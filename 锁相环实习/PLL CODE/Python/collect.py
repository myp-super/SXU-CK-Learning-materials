"""Step 1: Collect serial data to CSV."""
import clr, time, sys
clr.AddReference('System')
from System.IO.Ports import SerialPort

# Auto-detect COM port
import serial.tools.list_ports
ports = [p.device for p in serial.tools.list_ports.comports()]
port = sys.argv[1] if len(sys.argv) > 1 else (ports[-1] if ports else 'COM5')
duration = int(sys.argv[2]) if len(sys.argv) > 2 else 5

print(f"Collecting from {port} for {duration}s...")
sp = SerialPort(port, 115200)
sp.ReadTimeout = 300
sp.Open()

t0 = time.time()
lines = []
buf = ""
last_report = 0

while time.time() - t0 < duration:
    data = sp.ReadExisting()
    if data:
        buf += data
        while '\n' in buf:
            line, buf = buf.split('\n', 1)
            lines.append(line.strip())
    elapsed = time.time() - t0
    if int(elapsed) > last_report:
        print(f"  {int(elapsed)}s: {len(lines)} lines...")
        last_report = int(elapsed)

sp.Close()
print(f"Done! {len(lines)} total lines")

# Save valid CSV lines
csv_lines = []
for l in lines:
    if l and l[0] not in '#=t' and ',' in l:
        parts = l.split(',')
        if len(parts) >= 8:
            csv_lines.append(l)

# Save
import os, time
out = os.path.join(os.path.dirname(__file__), f'collected_{int(time.time())}.csv')
with open(out, 'w') as f:
    f.write('time,input,pll_output,theta,frequency,phase_error,loop_filter,lock_state\n')
    f.write('\n'.join(csv_lines))

print(f"Saved {len(csv_lines)} data rows to {out}")
print("Now run: python plot_data.py")
