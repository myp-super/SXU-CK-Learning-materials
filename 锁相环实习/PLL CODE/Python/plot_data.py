"""Step 2: Plot collected CSV data."""
import csv, os, glob
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import numpy as np

# Auto-find latest collected CSV
csv_dir = os.path.dirname(__file__)
csv_files = glob.glob(os.path.join(csv_dir, 'collected_*.csv'))
if csv_files:
    csv_file = max(csv_files, key=os.path.getmtime)
else:
    csv_file = os.path.join(csv_dir, 'collected_data.csv')

if not os.path.exists(csv_file):
    print(f"File not found: {csv_file}")
    print("Run collect.py first!")
    input("Press Enter to exit...")
    exit()

# Read CSV
t, inp, out, th, freq, pe, ylf, lk = [], [], [], [], [], [], [], []
with open(csv_file) as f:
    reader = csv.reader(f)
    next(reader)  # skip header
    for row in reader:
        if len(row) >= 8:
            try:
                t.append(float(row[0]))
                inp.append(float(row[1]))
                out.append(float(row[2]))
                th.append(float(row[3]))
                freq.append(float(row[4]))
                pe.append(float(row[5]))
                ylf.append(float(row[6]))
                lk.append(int(float(row[7])))
            except:
                pass

print(f"Loaded {len(t)} data points")

# Plot
fig, axes = plt.subplots(4, 2, figsize=(14, 9))
axes = axes.flatten()
titles = ['Input Signal', 'PLL Output', 'Phase Error', 'Frequency (Hz)',
          'Theta (rad)', 'Loop Filter', 'Lock State']
colors = ['#2196F3','#F44336','#4CAF50','#FF9800','#9C27B0','#00BCD4','#795548']
datasets = [inp, out, pe, freq, th, ylf, lk]

for i, (ax, title, data, color) in enumerate(zip(axes, titles, datasets, colors)):
    if i == 7:
        ax.plot(t, data, color=color, lw=1.5, drawstyle='steps-post')
        ax.set_ylim(-0.1, 1.1)
    elif i == 3:
        ax.plot(t, data, color=color, lw=0.8)
        ax.axhline(y=50, color='gray', ls='--', alpha=0.4, lw=0.5)
    elif i == 4:
        ax.plot(t, data, color=color, lw=0.8)
        ax.set_ylim(0, 6.5)
    else:
        ax.plot(t, data, color=color, lw=0.8)
    ax.set_title(title, fontsize=10, fontweight='bold')
    ax.tick_params(labelsize=7)
    ax.grid(True, alpha=0.3)

axes[7].axis('off')
axes[7].text(0.5, 0.5, f'PLL Data Summary\n\nPoints: {len(t)}\n'
             f'Freq: {np.mean(freq):.2f} Hz\n'
             f'Lock: {"YES" if lk and lk[-1] > 0.5 else "NO"}',
             ha='center', va='center', fontsize=11, fontfamily='monospace',
             transform=axes[7].transAxes)

fig.suptitle('Software PLL - Collected Data', fontsize=14, fontweight='bold')
fig.tight_layout()

# Save PNG
png_path = csv_file.replace('.csv', '.png')
fig.savefig(png_path, dpi=150, bbox_inches='tight')
print(f"Saved plot: {png_path}")

plt.show()
