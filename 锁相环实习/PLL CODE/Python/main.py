"""
Software PLL Data Collector + Viewer
====================================
Step 1: Click [采集] → Collect serial data for N seconds
Step 2: Data auto-plots as 7-panel figure
Step 3: Click [保存] to export

No real-time threading - simple, reliable.
"""

import tkinter as tk
from tkinter import ttk, messagebox, filedialog
import csv, os, time, threading
from datetime import datetime

import clr
clr.AddReference('System')
from System.IO.Ports import SerialPort

import serial.tools.list_ports

import matplotlib
matplotlib.use('TkAgg')
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure
import numpy as np

class App:
    def __init__(self, root):
        self.root = root
        self.root.title("Software PLL - Data Collector")
        self.root.geometry("1200x800")

        # Data
        self.t_data = []; self.inp = []; self.out = []
        self.perr = []; self.freq = []; self.theta = []; self.ylf = []; self.lock = []
        self.collecting = False
        self.sp = None

        self._build_ui()
        self._build_plot()

    def _list_ports(self):
        return [p.device for p in serial.tools.list_ports.comports()]

    def _build_ui(self):
        f = ttk.Frame(self.root, padding=8); f.pack(fill=tk.X)

        # COM
        ttk.Label(f, text="COM:").pack(side=tk.LEFT)
        self.com_var = tk.StringVar()
        ports = self._list_ports()
        self.com_cb = ttk.Combobox(f, textvariable=self.com_var, values=ports, width=10, state='readonly')
        self.com_cb.pack(side=tk.LEFT, padx=3)
        if ports: self.com_var.set(ports[-1])

        ttk.Button(f, text="刷新", width=4,
                   command=lambda: self.com_cb.configure(values=self._list_ports())
                   ).pack(side=tk.LEFT, padx=2)

        # Duration
        ttk.Label(f, text="采集时长(s):").pack(side=tk.LEFT, padx=(15,2))
        self.dur_var = tk.StringVar(value='5')
        ttk.Spinbox(f, textvariable=self.dur_var, from_=1, to=60, width=4).pack(side=tk.LEFT)

        # Buttons
        self.btn_coll = ttk.Button(f, text="开始采集", command=self._start_collect, width=10)
        self.btn_coll.pack(side=tk.LEFT, padx=(15,2))

        self.btn_plot = ttk.Button(f, text="刷新绘图", command=self._plot_data, width=10)
        self.btn_plot.pack(side=tk.LEFT, padx=2)

        ttk.Separator(f, orient=tk.VERTICAL).pack(side=tk.LEFT, fill=tk.Y, padx=10)

        self.btn_csv = ttk.Button(f, text="保存CSV", command=self._save_csv, width=10)
        self.btn_csv.pack(side=tk.LEFT, padx=2)
        self.btn_png = ttk.Button(f, text="保存截图", command=self._save_png, width=10)
        self.btn_png.pack(side=tk.LEFT, padx=2)

        ttk.Button(f, text="清空", command=self._clear, width=6).pack(side=tk.LEFT, padx=2)

        # Lock indicator
        self.lock_led = tk.Canvas(f, width=18, height=18, highlightthickness=0)
        self.lock_led.pack(side=tk.RIGHT, padx=5)
        self.led = self.lock_led.create_oval(2,2,17,17, fill='gray')
        ttk.Label(f, text="锁定:").pack(side=tk.RIGHT)

        # Status
        self.status_var = tk.StringVar(value="就绪 - 选COM口，点[开始采集]")
        ttk.Label(self.root, textvariable=self.status_var, font=('',8), padding=3).pack(fill=tk.X)

        # Sample count
        self.info_var = tk.StringVar(value="数据: 0 点")
        ttk.Label(self.root, textvariable=self.info_var, font=('',9,'bold'), padding=3).pack()

    def _start_collect(self):
        if self.collecting: return

        port = self.com_var.get()
        if not port:
            messagebox.showwarning("提示", "请先选择COM口")
            return

        try:
            dur = int(self.dur_var.get())
        except:
            dur = 5

        # Clear old data
        self._clear()

        # Collect in background thread
        self.collecting = True
        self.btn_coll.config(text="采集中...", state=tk.DISABLED)
        self.status_var.set(f"正在从 {port} 采集 {dur} 秒数据...")

        t = threading.Thread(target=self._do_collect, args=(port, dur), daemon=True)
        t.start()

    def _do_collect(self, port, duration):
        try:
            self.sp = SerialPort(port, 115200)
            self.sp.ReadTimeout = 200
            self.sp.Open()

            buf = ""
            t0 = time.time()

            while time.time() - t0 < duration:
                try:
                    data = self.sp.ReadExisting()
                    if data:
                        buf += data
                        while '\n' in buf:
                            line, buf = buf.split('\n', 1)
                            self._parse(line.strip())
                except:
                    pass

            self.sp.Close()
            self.sp = None

        except Exception as e:
            self.status_var.set(f"采集失败: {e}")
        finally:
            self.collecting = False
            self.btn_coll.config(text="开始采集", state=tk.NORMAL)
            self.status_var.set(f"采集完成！共 {len(self.t_data)} 个数据点")
            self._plot_data()

    def _parse(self, line):
        if not line or line[0] in '#=t': return
        parts = line.split(',')
        if len(parts) < 8: return
        try:
            self.t_data.append(float(parts[0]))
            self.inp.append(float(parts[1]))
            self.out.append(float(parts[2]))
            self.theta.append(float(parts[3]))
            self.freq.append(float(parts[4]))
            self.perr.append(float(parts[5]))
            self.ylf.append(float(parts[6]))
            self.lock.append(int(float(parts[7])))
        except:
            pass

    def _build_plot(self):
        self.fig = Figure(figsize=(12,7), dpi=100)
        self.fig.subplots_adjust(hspace=0.5, wspace=0.35, left=0.06, right=0.98, top=0.95, bottom=0.05)
        titles = ['Input Signal','PLL Output','Phase Error','Frequency (Hz)',
                  'Theta (rad)','Loop Filter','Lock State']
        colors = ['#2196F3','#F44336','#4CAF50','#FF9800','#9C27B0','#00BCD4','#795548']
        self.axes = []
        for i in range(7):
            ax = self.fig.add_subplot(4,2,i+1)
            ax.set_title(titles[i], fontsize=9, fontweight='bold')
            ax.tick_params(labelsize=6); ax.grid(True, alpha=0.3)
            if i==3: ax.axhline(y=50, color='gray', ls='--', alpha=0.4, lw=0.5)
            if i==4: ax.set_ylim(0,6.5)
            if i==6: ax.set_ylim(-0.1,1.1)
            self.axes.append(ax)
        ax8 = self.fig.add_subplot(4,2,8); ax8.axis('off')
        self.info_text = ax8.text(0.5,0.5,'',ha='center',va='center',
                                   fontsize=10, fontfamily='monospace', transform=ax8.transAxes)
        self.canvas = FigureCanvasTkAgg(self.fig, master=self.root)
        self.canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)

    def _plot_data(self):
        for ax in self.axes:
            for line in ax.lines: line.remove()

        n = len(self.t_data)
        if n < 2:
            self.canvas.draw_idle()
            return

        colors = ['#2196F3','#F44336','#4CAF50','#FF9800','#9C27B0','#00BCD4','#795548']
        ds = [self.inp, self.out, self.perr, self.freq, self.theta, self.ylf, self.lock]

        for i in range(7):
            self.axes[i].plot(self.t_data, ds[i], color=colors[i], lw=0.8)
            self.axes[i].relim(); self.axes[i].autoscale_view()
        self.axes[6].set_ylim(-0.1, 1.1)

        # Update info
        if self.freq:
            avg_f = np.mean(self.freq[-100:]) if len(self.freq) >= 100 else np.mean(self.freq)
            self.info_var.set(f"数据: {n} 点 | 平均频率: {avg_f:.2f} Hz")
            if self.lock and self.lock[-1] > 0.5:
                self.lock_led.itemconfig(self.led, fill='#00FF00')
            else:
                self.lock_led.itemconfig(self.led, fill='red')
            self.info_text.set(
                f"PLL Data Summary\n\n"
                f"Points = {n}\n"
                f"Freq = {avg_f:.2f} Hz\n"
                f"Lock = {'YES' if (self.lock and self.lock[-1]>0.5) else 'NO'}"
            )

        self.canvas.draw_idle()

    def _save_csv(self):
        if not self.t_data: return
        p = filedialog.asksaveasfilename(defaultextension='.csv',
            initialfile=f'pll_{datetime.now():%Y%m%d_%H%M%S}.csv')
        if not p: return
        with open(p,'w',newline='') as fh:
            w=csv.writer(fh)
            w.writerow(['time','input','pll_output','theta','frequency','phase_error','loop_filter','lock_state'])
            for k in range(len(self.t_data)):
                w.writerow([self.t_data[k],self.inp[k],self.out[k],self.theta[k],
                            self.freq[k],self.perr[k],self.ylf[k],self.lock[k]])
        self.status_var.set(f"已保存: {p}")

    def _save_png(self):
        p = filedialog.asksaveasfilename(defaultextension='.png',
            initialfile=f'pll_{datetime.now():%Y%m%d_%H%M%S}.png')
        if p: self.fig.savefig(p, dpi=150, bbox_inches='tight'); self.status_var.set(f"已保存: {p}")

    def _clear(self):
        self.t_data=[];self.inp=[];self.out=[];self.perr=[]
        self.freq=[];self.theta=[];self.ylf=[];self.lock=[]
        for ax in self.axes:
            for line in ax.lines: line.remove()
        self.canvas.draw_idle()
        self.info_var.set("数据: 0 点")
        self.lock_led.itemconfig(self.led, fill='gray')

    def on_close(self):
        if self.sp:
            try: self.sp.Close()
            except: pass
        self.root.destroy()

if __name__ == '__main__':
    root = tk.Tk()
    app = App(root)
    root.protocol("WM_DELETE_WINDOW", app.on_close)
    root.mainloop()
