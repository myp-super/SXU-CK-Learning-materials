#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""STM32温度测控系统 图表生成"""

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch
import os

plt.rcParams['font.sans-serif'] = ['SimHei', 'Microsoft YaHei', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

out = os.path.dirname(os.path.abspath(__file__))

# ==================== 图1: 系统总体框图 ====================
def fig1():
    fig, ax = plt.subplots(figsize=(16, 10))
    ax.set_xlim(0, 16); ax.set_ylim(0, 10); ax.axis('off')
    ax.set_title('STM32温度测控系统总体框图', fontsize=24, fontweight='bold', pad=20)

    mods = [
        (0.3, 4.0, 2.2, 1.6, 'DS18B20\n温度传感器', '#FF6B6B'),
        (3.2, 4.0, 3.2, 1.6, 'STM32F103ZET6\n主控制器\n(ARM Cortex-M3)', '#4ECDC4'),
        (7.8, 6.8, 2.2, 1.4, 'LCD显示屏\n(DMTFT-28)', '#45B7D1'),
        (7.8, 4.8, 2.2, 1.4, '风扇驱动\n(PWM1 / LED)', '#96CEB4'),
        (7.8, 2.8, 2.2, 1.4, '电热丝驱动\n(PWM2 / LED)', '#FFEAA7'),
        (3.2, 1.0, 3.2, 1.4, '按键输入\n(KEY_UP / KEY_DOWN)', '#DDA0DD'),
        (11.5, 4.0, 3.0, 1.6, '被控对象\n(环境温度)', '#FF8C69'),
    ]
    for x, y, w, h, label, color in mods:
        r = FancyBboxPatch((x, y), w, h, boxstyle="round,pad=0.1",
                           facecolor=color, edgecolor='black', linewidth=2, alpha=0.85)
        ax.add_patch(r)
        ax.text(x + w/2, y + h/2, label, ha='center', va='center',
                fontsize=13, fontweight='bold')

    arrows = [
        (2.5, 4.8, 3.2, 4.8, '1-Wire'),
        (6.4, 4.8, 7.8, 7.5, 'FSMC'),
        (6.4, 4.3, 7.8, 5.5, 'PWM1'),
        (6.4, 3.8, 7.8, 3.5, 'PWM2'),
        (3.2, 2.4, 4.8, 4.0, 'GPIO'),
        (14.5, 4.8, 11.5, 4.8, '控制'),
    ]
    for x1, y1, x2, y2, label in arrows:
        ax.annotate('', xy=(x2, y2), xytext=(x1, y1),
                    arrowprops=dict(arrowstyle='->', color='black', lw=2))
        ax.text((x1+x2)/2, (y1+y2)/2 + 0.2, label, ha='center', fontsize=11,
                bbox=dict(boxstyle='round,pad=0.2', facecolor='white', alpha=0.85))

    ax.annotate('反馈 (温度传感)', xy=(1.4, 5.6), xytext=(9, 0.5),
                fontsize=12, color='red', style='italic',
                arrowprops=dict(arrowstyle='->', color='red', lw=1.8,
                               connectionstyle='arc3,rad=-0.5'))

    plt.tight_layout()
    plt.savefig(os.path.join(out, '系统总体框图.png'), dpi=200, bbox_inches='tight')
    plt.close(); print('图1 已生成')

# ==================== 图2: 软件流程图 ====================
def fig2():
    fig, ax = plt.subplots(figsize=(12, 18))
    ax.set_xlim(0, 12); ax.set_ylim(0, 18); ax.axis('off')
    ax.set_title('系统主程序流程图', fontsize=22, fontweight='bold', pad=15)

    steps = [
        (6, 16.5, '开始\n(系统上电)', 'start'),
        (6, 14.5, 'SystemInit()\n时钟72MHz', 'proc'),
        (6, 12.3, 'NVIC配置 + 外设初始化\nLED/KEY/DS18B20/LCD/PWM', 'proc'),
        (6, 10.0, '显示启动画面\n(1.5秒)', 'proc'),
        (6, 8.0,  '======== 主循环 ========', 'loop'),
        (6, 6.2,  '按键扫描\n(持续, 20ms消抖)', 'proc'),
        (6, 4.8,  '温度控制 Temp_Control()\n(每750ms)', 'proc'),
        (6, 3.4,  'LCD更新 LCD_Update()\n(每500ms)', 'proc'),
        (6, 1.6,  '延时 + 循环返回', 'proc'),
    ]

    for x, y, label, stype in steps:
        w, h = (5.0, 1.3) if stype != 'loop' else (4.5, 0.7)
        color = '#90EE90' if stype == 'start' else ('#FFD700' if stype == 'loop' else '#87CEEB')
        r = FancyBboxPatch((x - w/2, y - h/2), w, h, boxstyle="round,pad=0.1",
                           facecolor=color, edgecolor='black', linewidth=1.5)
        ax.add_patch(r)
        ax.text(x, y, label, ha='center', va='center', fontsize=12)

    for i in range(len(steps)-1):
        ax.annotate('', xy=(6, steps[i+1][1] + 0.65), xytext=(6, steps[i][1] - 0.65),
                    arrowprops=dict(arrowstyle='->', color='black', lw=2))

    ax.annotate('', xy=(3.5, 8.0), xytext=(3.5, 2.2),
                arrowprops=dict(arrowstyle='->', color='blue', lw=2, connectionstyle='arc3,rad=-0.4'))
    ax.text(2.5, 5.0, '循环', fontsize=12, color='blue', rotation=90)

    plt.tight_layout()
    plt.savefig(os.path.join(out, '软件流程图.png'), dpi=200, bbox_inches='tight')
    plt.close(); print('图2 已生成')

# ==================== 图3: 电路原理图 ====================
def fig3():
    fig, ax = plt.subplots(figsize=(18, 11))
    ax.set_xlim(0, 18); ax.set_ylim(0, 11); ax.axis('off')
    ax.set_title('STM32温度测控系统 电路原理图', fontsize=22, fontweight='bold', pad=15)

    chip = FancyBboxPatch((1, 1.0), 4.5, 9.0, boxstyle="round,pad=0.2",
                          facecolor='#2C3E50', edgecolor='black', linewidth=2)
    ax.add_patch(chip)
    ax.text(3.25, 9.2, 'STM32F103ZET6', ha='center', fontsize=14, fontweight='bold', color='white')
    ax.text(3.25, 8.3, 'LQFP-144 | 72MHz', ha='center', fontsize=11, color='#BDC3C7')

    left_pins = ['PA6', 'PA7', 'PA9', 'PA10', 'PB0', 'PC0', 'PC1', 'PC13',
                 'PG0', 'PG7', 'PG8', 'PG9', 'PG11', 'PG12', 'PD4', 'PD5',
                 'PE7-15', 'PD0-1,14-15']
    for i, pin in enumerate(left_pins):
        y_pos = 8.9 - i * 0.42
        ax.text(0.9, y_pos, pin, fontsize=7, ha='right', va='center')
        ax.plot([0.95, 1.2], [y_pos, y_pos], 'k-', lw=0.5)

    mods = [
        (6.5, 8.2, 'LCD DMTFT-28\n(ILI9341)\nFSMC 16Bit', '#45B7D1'),
        (10.5, 8.2, 'DS18B20\n1-Wire\nPG9 + 4.7kΩ上拉', '#FF6B6B'),
        (6.5, 5.8, '风扇 LED\nPC0\n(220Ω限流)', '#96CEB4'),
        (10.5, 5.8, '加热 LED\nPC1\n(220Ω限流)', '#FFEAA7'),
        (6.5, 3.0, '按键 UP\nPG8 上拉', '#DDA0DD'),
        (10.5, 3.0, '按键 DOWN\nPG7 上拉', '#DDA0DD'),
        (6.5, 0.8, 'USART1\nPA9(TX) PA10(RX)', '#F0E68C'),
        (10.5, 0.8, '电源指示 LED\nPC13', '#FF8C69'),
    ]
    for x, y, label, color in mods:
        r = FancyBboxPatch((x, y-0.8), 3.2, 1.6, boxstyle="round,pad=0.05",
                           facecolor=color, edgecolor='black', linewidth=1.2, alpha=0.85)
        ax.add_patch(r)
        ax.text(x+1.6, y, label, ha='center', va='center', fontsize=10)

    info = [
        (14.5, 9.5, '电源与时钟', True),
        (14.5, 8.8, 'VDD: 3.3V', False),
        (14.5, 8.1, 'HSE: 8MHz晶振', False),
        (14.5, 7.4, 'PLL: ×9 → 72MHz', False),
        (14.5, 6.7, '复位: RC电路', False),
        (14.5, 5.8, 'PWM参数', True),
        (14.5, 5.1, 'TIM3_CH1 → PA6', False),
        (14.5, 4.4, 'TIM3_CH2 → PA7', False),
        (14.5, 3.7, 'PSC=71 ARR=999', False),
        (14.5, 3.0, '频率: 1kHz', False),
    ]
    for x, y, t, b in info:
        ax.text(x, y, t, fontsize=11 if b else 10, fontweight='bold' if b else 'normal')

    plt.tight_layout()
    plt.savefig(os.path.join(out, '电路原理图.png'), dpi=200, bbox_inches='tight')
    plt.close(); print('图3 已生成')

# ==================== 图4: PCB/模块连接图 ====================
def fig4():
    fig, ax = plt.subplots(figsize=(16, 10))
    ax.set_xlim(0, 16); ax.set_ylim(0, 10); ax.axis('off')
    ax.set_title('STM32温度测控系统 模块连接图', fontsize=22, fontweight='bold', pad=15)

    center = FancyBboxPatch((5.5, 3.0), 5.0, 3.0, boxstyle="round,pad=0.1",
                            facecolor='#2C3E50', edgecolor='gold', linewidth=2.5)
    ax.add_patch(center)
    ax.text(8, 5.8, 'STM32F103ZET6', ha='center', fontsize=15, fontweight='bold', color='white')
    ax.text(8, 4.5, 'LQFP-144\n72MHz Cortex-M3', ha='center', fontsize=11, color='#BDC3C7')

    mods = [
        (0.3, 6.5, 3.0, 1.6, 'DS18B20\n温度传感器', '#FF6B6B'),
        (0.3, 3.5, 3.0, 1.6, 'DMTFT-28 LCD\n(ILI9341)', '#45B7D1'),
        (0.3, 0.8, 3.0, 1.6, 'USART1\n调试串口', '#F0E68C'),
        (12.7, 6.5, 3.0, 1.6, '风扇 PWM\n(PA6 / LED)', '#96CEB4'),
        (12.7, 3.5, 3.0, 1.6, '电热丝 PWM\n(PA7 / LED)', '#FFEAA7'),
        (12.7, 0.8, 3.0, 1.6, '按键输入\n(PG7 / PG8)', '#DDA0DD'),
    ]
    for x, y, w, h, label, color in mods:
        r = FancyBboxPatch((x, y), w, h, boxstyle="round,pad=0.05",
                           facecolor=color, edgecolor='black', linewidth=1.5, alpha=0.85)
        ax.add_patch(r)
        ax.text(x + w/2, y + h/2, label, ha='center', va='center',
                fontsize=11, fontweight='bold')

    conns = [
        (3.3, 7.3, 5.5, 5.2, 'PG9 (1-Wire)'),
        (3.3, 4.3, 5.5, 4.5, 'FSMC D0-D15\nPG0,PG12,PD4-5'),
        (3.3, 1.6, 5.5, 4.0, 'PA9(TX), PA10(RX)'),
        (10.5, 5.2, 12.7, 7.3, 'PA6 (TIM3_CH1)'),
        (10.5, 4.5, 12.7, 4.3, 'PA7 (TIM3_CH2)'),
        (10.5, 4.0, 12.7, 1.6, 'PG7, PG8 (GPIO)'),
    ]
    for x1, y1, x2, y2, label in conns:
        ax.plot([x1, x2], [y1, y2], 'k-', lw=1.2, alpha=0.6)
        ax.text((x1+x2)/2, (y1+y2)/2, label, fontsize=9, ha='center', va='center',
                bbox=dict(boxstyle='round,pad=0.15', facecolor='white', alpha=0.9))

    pwr = FancyBboxPatch((5.5, 0.2), 5.0, 0.6, boxstyle="round,pad=0.05",
                         facecolor='#2ECC71', edgecolor='black', linewidth=1, alpha=0.5)
    ax.add_patch(pwr)
    ax.text(8, 0.5, '3.3V 电源 | 8MHz晶振 | 复位电路', ha='center', fontsize=11)

    plt.tight_layout()
    plt.savefig(os.path.join(out, 'PCB连接图.png'), dpi=200, bbox_inches='tight')
    plt.close(); print('图4 已生成')

if __name__ == '__main__':
    fig1(); fig2(); fig3(); fig4()
    print('\n全部完成！')
