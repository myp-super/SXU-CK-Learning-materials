# 1011 序列检测器 VHDL 实现（Moore 型 \+ Mealy 型）

统一设计规范：

- 触发：**时钟上升沿**

- 复位：**异步高电平复位**（全局复位，复位后回到初始状态）

- 端口：`clk`\(时钟\)、`rst`\(异步复位\)、`din`\(串行二进制输入\)、`y`\(检测输出，高电平有效\)

- 检测模式：**可重叠检测**（工程常用，连续序列可复用末尾码元）

- 目标序列：连续输入 `1 → 0 → 1 → 1`

核心区别：

1. **Moore 型**：输出仅由**当前状态**决定，输出比输入晚 1 个时钟周期；状态数更多。

2. **Mealy 型**：输出由**当前状态 \+ 当前输入**共同决定，输出与输入同步，无延迟；状态数更少。

---

## 一、Moore 型 1011 序列检测器

### 状态定义（共 5 个状态）

|状态|匹配情况|输出 y|
|---|---|---|
|S0|初始状态，未匹配任何位|0|
|S1|匹配第 1 位 `1`|0|
|S2|匹配前 2 位 `10`|0|
|S3|匹配前 3 位 `101`|0|
|S4|匹配完整序列 `1011`|1|

### 状态转移逻辑（可重叠）

- S0：din=0→S0；din=1→S1

- S1：din=0→S2；din=1→S1

- S2：din=0→S0；din=1→S3

- S3：din=0→S2；din=1→S4

- S4：din=0→S2；din=1→S1（末尾 1 可作为下一组序列起始，支持重叠）

### 完整 VHDL 代码

```vhdl
-- Moore型 1011序列检测器
library ieee;
use ieee.std_logic_1164.all;

entity seq1011_moore is
    port(
        clk  : in  std_logic;   -- 系统时钟，上升沿有效
        rst  : in  std_logic;   -- 异步高电平复位
        din  : in  std_logic;   -- 串行数据输入
        y    : out std_logic    -- 检测输出，高电平表示检测到1011
    );
end entity seq1011_moore;

architecture behav of seq1011_moore is
    -- 定义状态枚举类型
    type state_type is (S0, S1, S2, S3, S4);
    signal curr_state, next_state : state_type;  -- 当前状态、下一状态

begin
    -- 第一段：时序逻辑进程（状态跳转，受时钟+异步复位控制）
    reg_proc: process(clk, rst)
    begin
        if rst = '1' then
            curr_state <= S0;  -- 复位回到初始状态
        elsif rising_edge(clk) then
            curr_state <= next_state;  -- 时钟沿更新状态
        end if;
    end process reg_proc;

    -- 第二段：组合逻辑进程（状态转移判断）
    comb_proc: process(curr_state, din)
    begin
        case curr_state is
            when S0 =>
                if din = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                if din = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;

            when S2 =>
                if din = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;

            when S3 =>
                if din = '1' then
                    next_state <= S4;
                else
                    next_state <= S2;
                end if;

            when S4 =>
                if din = '1' then
                    next_state <= S1;
                else
                    next_state <= S2;
                end if;

            when others =>
                next_state <= S0;  -- 容错兜底
        end case;
    end process comb_proc;

    -- Moore型输出：仅由当前状态决定（独立组合逻辑）
    y <= '1' when curr_state = S4 else '0';

end architecture behav;
```

---

## 二、Mealy 型 1011 序列检测器

### 状态定义（共 4 个状态，无专门输出状态）

|状态|匹配情况|
|---|---|
|S0|初始状态，未匹配任何位|
|S1|匹配第 1 位 `1`|
|S2|匹配前 2 位 `10`|
|S3|匹配前 3 位 `101`|

### 状态 \& 输出转移逻辑（可重叠）

输出 `y` 由 **当前状态 \+ 输入 din** 共同决定：

- S0：din=0→S0,y=0；din=1→S1,y=0

- S1：din=0→S2,y=0；din=1→S1,y=0

- S2：din=0→S0,y=0；din=1→S3,y=0

- S3：din=0→S2,y=0；**din=1→S1,y=1**（凑齐 1011，输出置 1）

### 完整 VHDL 代码

```vhdl
-- Mealy型 1011序列检测器
library ieee;
use ieee.std_logic_1164.all;

entity seq1011_mealy is
    port(
        clk  : in  std_logic;   -- 系统时钟，上升沿有效
        rst  : in  std_logic;   -- 异步高电平复位
        din  : in  std_logic;   -- 串行数据输入
        y    : out std_logic    -- 检测输出，高电平表示检测到1011
    );
end entity seq1011_mealy;

architecture behav of seq1011_mealy is
    -- 定义状态枚举类型
    type state_type is (S0, S1, S2, S3);
    signal curr_state, next_state : state_type;

begin
    -- 第一段：时序逻辑（状态寄存器，时钟+异步复位）
    reg_proc: process(clk, rst)
    begin
        if rst = '1' then
            curr_state <= S0;
        elsif rising_edge(clk) then
            curr_state <= next_state;
        end if;
    end process reg_proc;

    -- 第二段：组合逻辑（状态转移 + Mealy输出）
    comb_proc: process(curr_state, din)
    begin
        -- 默认赋值，避免组合逻辑锁存
        next_state <= S0;
        y <= '0';

        case curr_state is
            when S0 =>
                if din = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                if din = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;

            when S2 =>
                if din = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;

            when S3 =>
                if din = '1' then
                    next_state <= S1;
                    y <= '1';  -- 输入第4位1，检测到1011，输出有效
                else
                    next_state <= S2;
                end if;

            when others =>
                next_state <= S0;
        end case;
    end process comb_proc;

end architecture behav;
```

---

## 三、关键补充说明

### 1\. 两段式状态机优势

以上代码均采用**时序进程 \+ 组合进程**的标准两段式写法，是 FPGA/CPLD 工程主流写法：

- 时序进程：负责状态寄存器，同步时钟、异步复位，电路稳定无毛刺；

- 组合进程：负责状态跳转和输出逻辑，逻辑划分清晰，便于综合与调试。

### 2\. 可重叠 / 非重叠 切换

当前代码为**可重叠检测**（例：输入 `10111`，会检测到两组 `1011`）。
若需要**非重叠检测**（检测到一组后，重新从下一位开始匹配），仅需修改 `S4`（Moore）/ `S3`（Mealy）的跳转逻辑：

- Moore 型：S4 无论 din 是 0/1，直接跳回 S0

- Mealy 型：S3 检测到有效序列后，直接跳回 S0

### 3\. 两者核心差异对比

|对比项|Moore 型|Mealy 型|
|---|---|---|
|输出决定因素|仅当前状态|当前状态 \+ 当前输入|
|输出延迟|滞后 1 个时钟周期|与输入同步，无延迟|
|状态数量|5 个（含专门输出状态）|4 个（无专门输出状态）|
|电路复杂度|略高|略低|

### 4\. 编译与仿真

代码可直接在 **Quartus II / Vivado** 综合编译，也可在 **ModelSim** 做功能仿真：
测试激励推荐输入序列：`1 0 1 1 1 0 1 1`，可直观验证**重叠检测**效果。

> （注：文档部分内容可能由 AI 生成）
