-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

-- DATE "06/15/2026 21:47:15"

-- 
-- Device: Altera EP3C5F256C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	clock_top_scheme1 IS
    PORT (
	clk : IN std_logic;
	key_sec : IN std_logic;
	key_min : IN std_logic;
	key_hour : IN std_logic;
	sec0 : BUFFER std_logic_vector(3 DOWNTO 0);
	sec1 : BUFFER std_logic_vector(3 DOWNTO 0);
	min0 : BUFFER std_logic_vector(3 DOWNTO 0);
	min1 : BUFFER std_logic_vector(3 DOWNTO 0);
	hour0 : BUFFER std_logic_vector(3 DOWNTO 0);
	hour1 : BUFFER std_logic_vector(3 DOWNTO 0);
	key_shift : IN std_logic;
	speak : OUT std_logic;
	seg_sec0 : OUT std_logic_vector(6 DOWNTO 0);
	seg_sec1 : OUT std_logic_vector(6 DOWNTO 0);
	seg_min0 : OUT std_logic_vector(6 DOWNTO 0);
	seg_min1 : OUT std_logic_vector(6 DOWNTO 0);
	seg_hour0 : OUT std_logic_vector(6 DOWNTO 0);
	seg_hour1 : OUT std_logic_vector(6 DOWNTO 0)
	);
END clock_top_scheme1;

-- Design Ports Information
-- sec0[0]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sec0[1]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sec0[2]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sec0[3]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sec1[0]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sec1[1]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sec1[2]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sec1[3]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min0[0]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min0[1]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min0[2]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min0[3]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min1[0]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min1[1]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min1[2]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- min1[3]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour0[0]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour0[1]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour0[2]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour0[3]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour1[0]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour1[1]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour1[2]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hour1[3]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- speak	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec0[0]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec0[1]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec0[2]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec0[3]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec0[4]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec0[5]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec0[6]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec1[0]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec1[1]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec1[2]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec1[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec1[4]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec1[5]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_sec1[6]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min0[0]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min0[1]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min0[2]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min0[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min0[4]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min0[5]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min0[6]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min1[0]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min1[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min1[2]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min1[3]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min1[4]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min1[5]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_min1[6]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour0[0]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour0[1]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour0[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour0[3]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour0[4]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour0[5]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour0[6]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour1[0]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour1[1]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour1[2]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour1[3]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour1[4]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour1[5]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_hour1[6]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key_sec	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key_shift	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key_min	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key_hour	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF clock_top_scheme1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_key_sec : std_logic;
SIGNAL ww_key_min : std_logic;
SIGNAL ww_key_hour : std_logic;
SIGNAL ww_sec0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sec1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_min0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_min1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_hour0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_hour1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_key_shift : std_logic;
SIGNAL ww_speak : std_logic;
SIGNAL ww_seg_sec0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg_sec1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg_min0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg_min1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg_hour0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg_hour1 : std_logic_vector(6 DOWNTO 0);
SIGNAL \U_DIVER|m_clk1~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U_MUX_HOUR|y~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sec0[0]~output_o\ : std_logic;
SIGNAL \sec0[1]~output_o\ : std_logic;
SIGNAL \sec0[2]~output_o\ : std_logic;
SIGNAL \sec0[3]~output_o\ : std_logic;
SIGNAL \sec1[0]~output_o\ : std_logic;
SIGNAL \sec1[1]~output_o\ : std_logic;
SIGNAL \sec1[2]~output_o\ : std_logic;
SIGNAL \sec1[3]~output_o\ : std_logic;
SIGNAL \min0[0]~output_o\ : std_logic;
SIGNAL \min0[1]~output_o\ : std_logic;
SIGNAL \min0[2]~output_o\ : std_logic;
SIGNAL \min0[3]~output_o\ : std_logic;
SIGNAL \min1[0]~output_o\ : std_logic;
SIGNAL \min1[1]~output_o\ : std_logic;
SIGNAL \min1[2]~output_o\ : std_logic;
SIGNAL \min1[3]~output_o\ : std_logic;
SIGNAL \hour0[0]~output_o\ : std_logic;
SIGNAL \hour0[1]~output_o\ : std_logic;
SIGNAL \hour0[2]~output_o\ : std_logic;
SIGNAL \hour0[3]~output_o\ : std_logic;
SIGNAL \hour1[0]~output_o\ : std_logic;
SIGNAL \hour1[1]~output_o\ : std_logic;
SIGNAL \hour1[2]~output_o\ : std_logic;
SIGNAL \hour1[3]~output_o\ : std_logic;
SIGNAL \speak~output_o\ : std_logic;
SIGNAL \seg_sec0[0]~output_o\ : std_logic;
SIGNAL \seg_sec0[1]~output_o\ : std_logic;
SIGNAL \seg_sec0[2]~output_o\ : std_logic;
SIGNAL \seg_sec0[3]~output_o\ : std_logic;
SIGNAL \seg_sec0[4]~output_o\ : std_logic;
SIGNAL \seg_sec0[5]~output_o\ : std_logic;
SIGNAL \seg_sec0[6]~output_o\ : std_logic;
SIGNAL \seg_sec1[0]~output_o\ : std_logic;
SIGNAL \seg_sec1[1]~output_o\ : std_logic;
SIGNAL \seg_sec1[2]~output_o\ : std_logic;
SIGNAL \seg_sec1[3]~output_o\ : std_logic;
SIGNAL \seg_sec1[4]~output_o\ : std_logic;
SIGNAL \seg_sec1[5]~output_o\ : std_logic;
SIGNAL \seg_sec1[6]~output_o\ : std_logic;
SIGNAL \seg_min0[0]~output_o\ : std_logic;
SIGNAL \seg_min0[1]~output_o\ : std_logic;
SIGNAL \seg_min0[2]~output_o\ : std_logic;
SIGNAL \seg_min0[3]~output_o\ : std_logic;
SIGNAL \seg_min0[4]~output_o\ : std_logic;
SIGNAL \seg_min0[5]~output_o\ : std_logic;
SIGNAL \seg_min0[6]~output_o\ : std_logic;
SIGNAL \seg_min1[0]~output_o\ : std_logic;
SIGNAL \seg_min1[1]~output_o\ : std_logic;
SIGNAL \seg_min1[2]~output_o\ : std_logic;
SIGNAL \seg_min1[3]~output_o\ : std_logic;
SIGNAL \seg_min1[4]~output_o\ : std_logic;
SIGNAL \seg_min1[5]~output_o\ : std_logic;
SIGNAL \seg_min1[6]~output_o\ : std_logic;
SIGNAL \seg_hour0[0]~output_o\ : std_logic;
SIGNAL \seg_hour0[1]~output_o\ : std_logic;
SIGNAL \seg_hour0[2]~output_o\ : std_logic;
SIGNAL \seg_hour0[3]~output_o\ : std_logic;
SIGNAL \seg_hour0[4]~output_o\ : std_logic;
SIGNAL \seg_hour0[5]~output_o\ : std_logic;
SIGNAL \seg_hour0[6]~output_o\ : std_logic;
SIGNAL \seg_hour1[0]~output_o\ : std_logic;
SIGNAL \seg_hour1[1]~output_o\ : std_logic;
SIGNAL \seg_hour1[2]~output_o\ : std_logic;
SIGNAL \seg_hour1[3]~output_o\ : std_logic;
SIGNAL \seg_hour1[4]~output_o\ : std_logic;
SIGNAL \seg_hour1[5]~output_o\ : std_logic;
SIGNAL \seg_hour1[6]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \U_DIVER|m_clk1~0_combout\ : std_logic;
SIGNAL \U_DIVER|m_clk1~q\ : std_logic;
SIGNAL \U_DIVER|m_clk1~clkctrl_outclk\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~0_combout\ : std_logic;
SIGNAL \key_shift~input_o\ : std_logic;
SIGNAL \U_TRIGGER|temp~0_combout\ : std_logic;
SIGNAL \U_TRIGGER|temp~q\ : std_logic;
SIGNAL \key_sec~input_o\ : std_logic;
SIGNAL \U_SW_SEC|s2~combout\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~1\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~2_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~3\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~5\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~6_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|count~3_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~7\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~8_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|count~2_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~9\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~10_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|count~0_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|Equal0~0_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|Add0~4_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|count~1_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|LessThan0~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \U_DIVER|cnt_0~1_combout\ : std_logic;
SIGNAL \U_DIVER|cnt_0~0_combout\ : std_logic;
SIGNAL \U_DIVER|m_clk0~0_combout\ : std_logic;
SIGNAL \U_DIVER|m_clk0~feeder_combout\ : std_logic;
SIGNAL \U_DIVER|m_clk0~q\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~0_combout\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~1\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~2_combout\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~3\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~5\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~6_combout\ : std_logic;
SIGNAL \U_SEC_BIN|count~3_combout\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~7\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~8_combout\ : std_logic;
SIGNAL \U_SEC_BIN|count~2_combout\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~9\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~10_combout\ : std_logic;
SIGNAL \U_SEC_BIN|count~0_combout\ : std_logic;
SIGNAL \U_SEC_BIN|Equal0~0_combout\ : std_logic;
SIGNAL \U_SEC_BIN|Add0~4_combout\ : std_logic;
SIGNAL \U_SEC_BIN|count~1_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|LessThan0~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[0]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[0]~18_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[0]~2_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[0]~5_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[1]~9_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[1]~8_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[0]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[0]~3_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[1]~7_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[1]~10_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[0]~13_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[2]~11_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[2]~12_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[2]~14_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[3]~15_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[3]~16_combout\ : std_logic;
SIGNAL \U_MUX_DISP0|y[3]~17_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_MUX_DISP1|y[0]~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP1|y[1]~1_combout\ : std_logic;
SIGNAL \U_MUX_DISP1|y[2]~2_combout\ : std_logic;
SIGNAL \U_SEC_BIN|Equal0~1_combout\ : std_logic;
SIGNAL \key_min~input_o\ : std_logic;
SIGNAL \U_SW_MIN|s1~combout\ : std_logic;
SIGNAL \U_MUX_MIN|y~combout\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~0_combout\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~1\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~2_combout\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~3\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~5\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~6_combout\ : std_logic;
SIGNAL \U_MIN_BIN|count~3_combout\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~7\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~9\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~10_combout\ : std_logic;
SIGNAL \U_MIN_BIN|count~1_combout\ : std_logic;
SIGNAL \U_MIN_BIN|Equal0~0_combout\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~4_combout\ : std_logic;
SIGNAL \U_MIN_BIN|count~0_combout\ : std_logic;
SIGNAL \U_MIN_BIN|Add0~8_combout\ : std_logic;
SIGNAL \U_MIN_BIN|count~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|LessThan0~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~0_combout\ : std_logic;
SIGNAL \U_SW_MIN|s2~combout\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~1\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~2_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~3\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~5\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~6_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|count~3_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~7\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~8_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|count~2_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~9\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~10_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|count~1_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|Equal0~0_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|Add0~4_combout\ : std_logic;
SIGNAL \U_MIN_ALARM|count~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|LessThan0~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\ : std_logic;
SIGNAL \U_MUX_DISP2|y[0]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\ : std_logic;
SIGNAL \U_MUX_DISP2|y[1]~1_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\ : std_logic;
SIGNAL \U_MUX_DISP2|y[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ : std_logic;
SIGNAL \U_MUX_DISP2|y[3]~3_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_MUX_DISP3|y[0]~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP3|y[1]~1_combout\ : std_logic;
SIGNAL \U_MUX_DISP3|y[2]~2_combout\ : std_logic;
SIGNAL \key_hour~input_o\ : std_logic;
SIGNAL \U_SW_HOUR|s1~combout\ : std_logic;
SIGNAL \U_MIN_BIN|Equal0~1_combout\ : std_logic;
SIGNAL \U_MUX_HOUR|y~combout\ : std_logic;
SIGNAL \U_MUX_HOUR|y~clkctrl_outclk\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~0_combout\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~1\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~2_combout\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~3\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~4_combout\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~5\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~6_combout\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~7\ : std_logic;
SIGNAL \U_HOUR_BIN|Add0~8_combout\ : std_logic;
SIGNAL \U_HOUR_BIN|count~0_combout\ : std_logic;
SIGNAL \U_HOUR_BIN|Equal0~0_combout\ : std_logic;
SIGNAL \U_HOUR_BIN|count~1_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|LessThan1~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|temp~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|temp~1_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|temp~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~0_combout\ : std_logic;
SIGNAL \U_SW_HOUR|s2~combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~1\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~2_combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~3\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~4_combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~5\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~7\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~8_combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|count~0_combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|Equal0~0_combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|Add0~6_combout\ : std_logic;
SIGNAL \U_HOUR_ALARM|count~1_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|temp~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|temp~1_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|temp~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|LessThan1~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\ : std_logic;
SIGNAL \U_MUX_DISP4|y[0]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ : std_logic;
SIGNAL \U_MUX_DISP4|y[1]~1_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ : std_logic;
SIGNAL \U_MUX_DISP4|y[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\ : std_logic;
SIGNAL \U_MUX_DISP4|y[3]~3_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \U_MUX_DISP5|y[0]~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP5|y[1]~1_combout\ : std_logic;
SIGNAL \U_ALARM|speak~2_combout\ : std_logic;
SIGNAL \U_ALARM|speak~3_combout\ : std_logic;
SIGNAL \U_ALARM|speak~1_combout\ : std_logic;
SIGNAL \U_ALARM|speak~4_combout\ : std_logic;
SIGNAL \U_ALARM|speak~0_combout\ : std_logic;
SIGNAL \U_ALARM|speak~5_combout\ : std_logic;
SIGNAL \U_ALARM|speak~6_combout\ : std_logic;
SIGNAL \U_ALARM|speak~7_combout\ : std_logic;
SIGNAL \U_ALARM|speak~8_combout\ : std_logic;
SIGNAL \U_BAOSHI|speak~0_combout\ : std_logic;
SIGNAL \U_BAOSHI|speak~1_combout\ : std_logic;
SIGNAL \U_BAOSHI|speak~2_combout\ : std_logic;
SIGNAL \U_BAOSHI|speak~3_combout\ : std_logic;
SIGNAL \speak~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|Mux0~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|Mux0~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|Mux0~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|Mux0~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|Mux0~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR1|Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR1|Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR1|Mux1~0_combout\ : std_logic;
SIGNAL \U_SEC_ALARM|count\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U_MIN_ALARM|count\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U_HOUR_ALARM|count\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \U_DIVER|cnt_0\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U_SEC_BIN|count\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U_MIN_BIN|count\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U_HOUR_BIN|count\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \U_MUX_HOUR|ALT_INV_y~clkctrl_outclk\ : std_logic;
SIGNAL \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\ : std_logic;
SIGNAL \U_MUX_MIN|ALT_INV_y~combout\ : std_logic;
SIGNAL \U_DIVER|ALT_INV_m_clk0~q\ : std_logic;
SIGNAL \U_SEG_HOUR1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR1|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_HOUR0|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN1|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_MIN0|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC1|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \U_SEG_SEC0|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP5|ALT_INV_y[1]~1_combout\ : std_logic;
SIGNAL \U_MUX_DISP5|ALT_INV_y[0]~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP3|ALT_INV_y[2]~2_combout\ : std_logic;
SIGNAL \U_MUX_DISP3|ALT_INV_y[1]~1_combout\ : std_logic;
SIGNAL \U_MUX_DISP3|ALT_INV_y[0]~0_combout\ : std_logic;
SIGNAL \U_MUX_DISP1|ALT_INV_y[2]~2_combout\ : std_logic;
SIGNAL \U_MUX_DISP1|ALT_INV_y[1]~1_combout\ : std_logic;
SIGNAL \U_MUX_DISP1|ALT_INV_y[0]~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_key_sec <= key_sec;
ww_key_min <= key_min;
ww_key_hour <= key_hour;
sec0 <= ww_sec0;
sec1 <= ww_sec1;
min0 <= ww_min0;
min1 <= ww_min1;
hour0 <= ww_hour0;
hour1 <= ww_hour1;
ww_key_shift <= key_shift;
speak <= ww_speak;
seg_sec0 <= ww_seg_sec0;
seg_sec1 <= ww_seg_sec1;
seg_min0 <= ww_seg_min0;
seg_min1 <= ww_seg_min1;
seg_hour0 <= ww_seg_hour0;
seg_hour1 <= ww_seg_hour1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\U_DIVER|m_clk1~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \U_DIVER|m_clk1~q\);

\U_MUX_HOUR|y~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \U_MUX_HOUR|y~combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\U_MUX_HOUR|ALT_INV_y~clkctrl_outclk\ <= NOT \U_MUX_HOUR|y~clkctrl_outclk\;
\U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\ <= NOT \U_DIVER|m_clk1~clkctrl_outclk\;
\U_MUX_MIN|ALT_INV_y~combout\ <= NOT \U_MUX_MIN|y~combout\;
\U_DIVER|ALT_INV_m_clk0~q\ <= NOT \U_DIVER|m_clk0~q\;
\U_SEG_HOUR1|ALT_INV_Mux1~0_combout\ <= NOT \U_SEG_HOUR1|Mux1~0_combout\;
\U_SEG_HOUR1|ALT_INV_Mux4~0_combout\ <= NOT \U_SEG_HOUR1|Mux4~0_combout\;
\U_SEG_HOUR0|ALT_INV_Mux1~0_combout\ <= NOT \U_SEG_HOUR0|Mux1~0_combout\;
\U_SEG_HOUR0|ALT_INV_Mux2~0_combout\ <= NOT \U_SEG_HOUR0|Mux2~0_combout\;
\U_SEG_HOUR0|ALT_INV_Mux3~0_combout\ <= NOT \U_SEG_HOUR0|Mux3~0_combout\;
\U_SEG_HOUR0|ALT_INV_Mux4~0_combout\ <= NOT \U_SEG_HOUR0|Mux4~0_combout\;
\U_SEG_HOUR0|ALT_INV_Mux5~0_combout\ <= NOT \U_SEG_HOUR0|Mux5~0_combout\;
\U_SEG_HOUR0|ALT_INV_Mux6~0_combout\ <= NOT \U_SEG_HOUR0|Mux6~0_combout\;
\U_SEG_MIN1|ALT_INV_Mux0~0_combout\ <= NOT \U_SEG_MIN1|Mux0~0_combout\;
\U_SEG_MIN1|ALT_INV_Mux1~0_combout\ <= NOT \U_SEG_MIN1|Mux1~0_combout\;
\U_SEG_MIN1|ALT_INV_Mux2~0_combout\ <= NOT \U_SEG_MIN1|Mux2~0_combout\;
\U_SEG_MIN1|ALT_INV_Mux3~0_combout\ <= NOT \U_SEG_MIN1|Mux3~0_combout\;
\U_SEG_MIN1|ALT_INV_Mux4~0_combout\ <= NOT \U_SEG_MIN1|Mux4~0_combout\;
\U_SEG_MIN0|ALT_INV_Mux1~0_combout\ <= NOT \U_SEG_MIN0|Mux1~0_combout\;
\U_SEG_MIN0|ALT_INV_Mux2~0_combout\ <= NOT \U_SEG_MIN0|Mux2~0_combout\;
\U_SEG_MIN0|ALT_INV_Mux3~0_combout\ <= NOT \U_SEG_MIN0|Mux3~0_combout\;
\U_SEG_MIN0|ALT_INV_Mux4~0_combout\ <= NOT \U_SEG_MIN0|Mux4~0_combout\;
\U_SEG_MIN0|ALT_INV_Mux5~0_combout\ <= NOT \U_SEG_MIN0|Mux5~0_combout\;
\U_SEG_MIN0|ALT_INV_Mux6~0_combout\ <= NOT \U_SEG_MIN0|Mux6~0_combout\;
\U_SEG_SEC1|ALT_INV_Mux0~0_combout\ <= NOT \U_SEG_SEC1|Mux0~0_combout\;
\U_SEG_SEC1|ALT_INV_Mux1~0_combout\ <= NOT \U_SEG_SEC1|Mux1~0_combout\;
\U_SEG_SEC1|ALT_INV_Mux2~0_combout\ <= NOT \U_SEG_SEC1|Mux2~0_combout\;
\U_SEG_SEC1|ALT_INV_Mux3~0_combout\ <= NOT \U_SEG_SEC1|Mux3~0_combout\;
\U_SEG_SEC1|ALT_INV_Mux4~0_combout\ <= NOT \U_SEG_SEC1|Mux4~0_combout\;
\U_SEG_SEC0|ALT_INV_Mux1~0_combout\ <= NOT \U_SEG_SEC0|Mux1~0_combout\;
\U_SEG_SEC0|ALT_INV_Mux2~0_combout\ <= NOT \U_SEG_SEC0|Mux2~0_combout\;
\U_SEG_SEC0|ALT_INV_Mux3~0_combout\ <= NOT \U_SEG_SEC0|Mux3~0_combout\;
\U_SEG_SEC0|ALT_INV_Mux4~0_combout\ <= NOT \U_SEG_SEC0|Mux4~0_combout\;
\U_SEG_SEC0|ALT_INV_Mux5~0_combout\ <= NOT \U_SEG_SEC0|Mux5~0_combout\;
\U_SEG_SEC0|ALT_INV_Mux6~0_combout\ <= NOT \U_SEG_SEC0|Mux6~0_combout\;
\U_MUX_DISP5|ALT_INV_y[1]~1_combout\ <= NOT \U_MUX_DISP5|y[1]~1_combout\;
\U_MUX_DISP5|ALT_INV_y[0]~0_combout\ <= NOT \U_MUX_DISP5|y[0]~0_combout\;
\U_MUX_DISP3|ALT_INV_y[2]~2_combout\ <= NOT \U_MUX_DISP3|y[2]~2_combout\;
\U_MUX_DISP3|ALT_INV_y[1]~1_combout\ <= NOT \U_MUX_DISP3|y[1]~1_combout\;
\U_MUX_DISP3|ALT_INV_y[0]~0_combout\ <= NOT \U_MUX_DISP3|y[0]~0_combout\;
\U_MUX_DISP1|ALT_INV_y[2]~2_combout\ <= NOT \U_MUX_DISP1|y[2]~2_combout\;
\U_MUX_DISP1|ALT_INV_y[1]~1_combout\ <= NOT \U_MUX_DISP1|y[1]~1_combout\;
\U_MUX_DISP1|ALT_INV_y[0]~0_combout\ <= NOT \U_MUX_DISP1|y[0]~0_combout\;

-- Location: IOOBUF_X0_Y18_N23
\sec0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP0|y[0]~5_combout\,
	devoe => ww_devoe,
	o => \sec0[0]~output_o\);

-- Location: IOOBUF_X0_Y8_N2
\sec0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP0|y[1]~10_combout\,
	devoe => ww_devoe,
	o => \sec0[1]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\sec0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP0|y[2]~14_combout\,
	devoe => ww_devoe,
	o => \sec0[2]~output_o\);

-- Location: IOOBUF_X11_Y0_N2
\sec0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP0|y[3]~17_combout\,
	devoe => ww_devoe,
	o => \sec0[3]~output_o\);

-- Location: IOOBUF_X13_Y0_N23
\sec1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP1|ALT_INV_y[0]~0_combout\,
	devoe => ww_devoe,
	o => \sec1[0]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\sec1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP1|ALT_INV_y[1]~1_combout\,
	devoe => ww_devoe,
	o => \sec1[1]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\sec1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP1|ALT_INV_y[2]~2_combout\,
	devoe => ww_devoe,
	o => \sec1[2]~output_o\);

-- Location: IOOBUF_X30_Y0_N16
\sec1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sec1[3]~output_o\);

-- Location: IOOBUF_X11_Y24_N2
\min0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP2|y[0]~0_combout\,
	devoe => ww_devoe,
	o => \min0[0]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\min0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP2|y[1]~1_combout\,
	devoe => ww_devoe,
	o => \min0[1]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\min0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP2|y[2]~2_combout\,
	devoe => ww_devoe,
	o => \min0[2]~output_o\);

-- Location: IOOBUF_X3_Y24_N9
\min0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP2|y[3]~3_combout\,
	devoe => ww_devoe,
	o => \min0[3]~output_o\);

-- Location: IOOBUF_X3_Y24_N16
\min1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP3|ALT_INV_y[0]~0_combout\,
	devoe => ww_devoe,
	o => \min1[0]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\min1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP3|ALT_INV_y[1]~1_combout\,
	devoe => ww_devoe,
	o => \min1[1]~output_o\);

-- Location: IOOBUF_X0_Y19_N23
\min1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP3|ALT_INV_y[2]~2_combout\,
	devoe => ww_devoe,
	o => \min1[2]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\min1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \min1[3]~output_o\);

-- Location: IOOBUF_X23_Y24_N23
\hour0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP4|y[0]~0_combout\,
	devoe => ww_devoe,
	o => \hour0[0]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\hour0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP4|y[1]~1_combout\,
	devoe => ww_devoe,
	o => \hour0[1]~output_o\);

-- Location: IOOBUF_X13_Y24_N2
\hour0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP4|y[2]~2_combout\,
	devoe => ww_devoe,
	o => \hour0[2]~output_o\);

-- Location: IOOBUF_X21_Y24_N16
\hour0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP4|y[3]~3_combout\,
	devoe => ww_devoe,
	o => \hour0[3]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\hour1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP5|ALT_INV_y[0]~0_combout\,
	devoe => ww_devoe,
	o => \hour1[0]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\hour1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP5|ALT_INV_y[1]~1_combout\,
	devoe => ww_devoe,
	o => \hour1[1]~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\hour1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \hour1[2]~output_o\);

-- Location: IOOBUF_X21_Y0_N23
\hour1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \hour1[3]~output_o\);

-- Location: IOOBUF_X11_Y24_N9
\speak~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \speak~0_combout\,
	devoe => ww_devoe,
	o => \speak~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\seg_sec0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC0|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec0[0]~output_o\);

-- Location: IOOBUF_X0_Y9_N2
\seg_sec0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC0|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec0[1]~output_o\);

-- Location: IOOBUF_X0_Y10_N16
\seg_sec0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC0|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec0[2]~output_o\);

-- Location: IOOBUF_X34_Y11_N9
\seg_sec0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC0|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec0[3]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\seg_sec0[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC0|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec0[4]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\seg_sec0[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC0|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec0[5]~output_o\);

-- Location: IOOBUF_X0_Y10_N2
\seg_sec0[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC0|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec0[6]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\seg_sec1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec1[0]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\seg_sec1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec1[1]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\seg_sec1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC1|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec1[2]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\seg_sec1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC1|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec1[3]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\seg_sec1[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC1|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec1[4]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\seg_sec1[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC1|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec1[5]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\seg_sec1[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_SEC1|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \seg_sec1[6]~output_o\);

-- Location: IOOBUF_X11_Y24_N23
\seg_min0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN0|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \seg_min0[0]~output_o\);

-- Location: IOOBUF_X9_Y24_N16
\seg_min0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN0|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \seg_min0[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\seg_min0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN0|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \seg_min0[2]~output_o\);

-- Location: IOOBUF_X9_Y24_N23
\seg_min0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN0|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \seg_min0[3]~output_o\);

-- Location: IOOBUF_X18_Y24_N9
\seg_min0[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN0|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \seg_min0[4]~output_o\);

-- Location: IOOBUF_X7_Y24_N16
\seg_min0[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN0|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \seg_min0[5]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\seg_min0[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN0|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \seg_min0[6]~output_o\);

-- Location: IOOBUF_X5_Y24_N2
\seg_min1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \seg_min1[0]~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\seg_min1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \seg_min1[1]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\seg_min1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN1|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \seg_min1[2]~output_o\);

-- Location: IOOBUF_X5_Y24_N23
\seg_min1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN1|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \seg_min1[3]~output_o\);

-- Location: IOOBUF_X0_Y19_N16
\seg_min1[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN1|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \seg_min1[4]~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\seg_min1[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN1|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \seg_min1[5]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\seg_min1[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_MIN1|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \seg_min1[6]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\seg_hour0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR0|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour0[0]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\seg_hour0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR0|ALT_INV_Mux5~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour0[1]~output_o\);

-- Location: IOOBUF_X21_Y24_N9
\seg_hour0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR0|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour0[2]~output_o\);

-- Location: IOOBUF_X5_Y24_N16
\seg_hour0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR0|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour0[3]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\seg_hour0[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR0|ALT_INV_Mux2~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour0[4]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\seg_hour0[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR0|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour0[5]~output_o\);

-- Location: IOOBUF_X13_Y24_N9
\seg_hour0[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR0|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour0[6]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\seg_hour1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour1[0]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\seg_hour1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg_hour1[1]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\seg_hour1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR1|ALT_INV_Mux4~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour1[2]~output_o\);

-- Location: IOOBUF_X9_Y0_N23
\seg_hour1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour1[3]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\seg_hour1[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP5|y[0]~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour1[4]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\seg_hour1[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_SEG_HOUR1|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \seg_hour1[5]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\seg_hour1[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_MUX_DISP5|ALT_INV_y[1]~1_combout\,
	devoe => ww_devoe,
	o => \seg_hour1[6]~output_o\);

-- Location: IOIBUF_X0_Y11_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X11_Y14_N30
\U_DIVER|m_clk1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_DIVER|m_clk1~0_combout\ = !\U_DIVER|m_clk1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_DIVER|m_clk1~q\,
	combout => \U_DIVER|m_clk1~0_combout\);

-- Location: FF_X11_Y14_N19
\U_DIVER|m_clk1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U_DIVER|m_clk1~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_DIVER|m_clk1~q\);

-- Location: CLKCTRL_G2
\U_DIVER|m_clk1~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \U_DIVER|m_clk1~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \U_DIVER|m_clk1~clkctrl_outclk\);

-- Location: LCCOMB_X12_Y14_N0
\U_SEC_ALARM|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|Add0~0_combout\ = \U_SEC_ALARM|count\(0) $ (VCC)
-- \U_SEC_ALARM|Add0~1\ = CARRY(\U_SEC_ALARM|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_ALARM|count\(0),
	datad => VCC,
	combout => \U_SEC_ALARM|Add0~0_combout\,
	cout => \U_SEC_ALARM|Add0~1\);

-- Location: IOIBUF_X0_Y11_N22
\key_shift~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key_shift,
	o => \key_shift~input_o\);

-- Location: LCCOMB_X13_Y14_N18
\U_TRIGGER|temp~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_TRIGGER|temp~0_combout\ = \U_TRIGGER|temp~q\ $ (\key_shift~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_TRIGGER|temp~q\,
	datad => \key_shift~input_o\,
	combout => \U_TRIGGER|temp~0_combout\);

-- Location: FF_X13_Y14_N19
\U_TRIGGER|temp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \U_TRIGGER|temp~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_TRIGGER|temp~q\);

-- Location: IOIBUF_X0_Y11_N15
\key_sec~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key_sec,
	o => \key_sec~input_o\);

-- Location: LCCOMB_X12_Y14_N16
\U_SW_SEC|s2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SW_SEC|s2~combout\ = (\U_TRIGGER|temp~q\ & \key_sec~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datad => \key_sec~input_o\,
	combout => \U_SW_SEC|s2~combout\);

-- Location: FF_X12_Y14_N1
\U_SEC_ALARM|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_SEC_ALARM|Add0~0_combout\,
	ena => \U_SW_SEC|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_ALARM|count\(0));

-- Location: LCCOMB_X12_Y14_N2
\U_SEC_ALARM|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|Add0~2_combout\ = (\U_SEC_ALARM|count\(1) & (!\U_SEC_ALARM|Add0~1\)) # (!\U_SEC_ALARM|count\(1) & ((\U_SEC_ALARM|Add0~1\) # (GND)))
-- \U_SEC_ALARM|Add0~3\ = CARRY((!\U_SEC_ALARM|Add0~1\) # (!\U_SEC_ALARM|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_ALARM|count\(1),
	datad => VCC,
	cin => \U_SEC_ALARM|Add0~1\,
	combout => \U_SEC_ALARM|Add0~2_combout\,
	cout => \U_SEC_ALARM|Add0~3\);

-- Location: FF_X12_Y14_N3
\U_SEC_ALARM|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_SEC_ALARM|Add0~2_combout\,
	ena => \U_SW_SEC|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_ALARM|count\(1));

-- Location: LCCOMB_X12_Y14_N4
\U_SEC_ALARM|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|Add0~4_combout\ = (\U_SEC_ALARM|count\(2) & (\U_SEC_ALARM|Add0~3\ $ (GND))) # (!\U_SEC_ALARM|count\(2) & (!\U_SEC_ALARM|Add0~3\ & VCC))
-- \U_SEC_ALARM|Add0~5\ = CARRY((\U_SEC_ALARM|count\(2) & !\U_SEC_ALARM|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(2),
	datad => VCC,
	cin => \U_SEC_ALARM|Add0~3\,
	combout => \U_SEC_ALARM|Add0~4_combout\,
	cout => \U_SEC_ALARM|Add0~5\);

-- Location: LCCOMB_X12_Y14_N6
\U_SEC_ALARM|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|Add0~6_combout\ = (\U_SEC_ALARM|count\(3) & (!\U_SEC_ALARM|Add0~5\)) # (!\U_SEC_ALARM|count\(3) & ((\U_SEC_ALARM|Add0~5\) # (GND)))
-- \U_SEC_ALARM|Add0~7\ = CARRY((!\U_SEC_ALARM|Add0~5\) # (!\U_SEC_ALARM|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(3),
	datad => VCC,
	cin => \U_SEC_ALARM|Add0~5\,
	combout => \U_SEC_ALARM|Add0~6_combout\,
	cout => \U_SEC_ALARM|Add0~7\);

-- Location: LCCOMB_X12_Y14_N12
\U_SEC_ALARM|count~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|count~3_combout\ = (\U_SEC_ALARM|Add0~6_combout\ & ((\U_SEC_ALARM|count\(2)) # ((!\U_SEC_ALARM|count\(1)) # (!\U_SEC_ALARM|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(2),
	datab => \U_SEC_ALARM|Equal0~0_combout\,
	datac => \U_SEC_ALARM|count\(1),
	datad => \U_SEC_ALARM|Add0~6_combout\,
	combout => \U_SEC_ALARM|count~3_combout\);

-- Location: FF_X12_Y14_N13
\U_SEC_ALARM|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_SEC_ALARM|count~3_combout\,
	ena => \U_SW_SEC|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_ALARM|count\(3));

-- Location: LCCOMB_X12_Y14_N8
\U_SEC_ALARM|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|Add0~8_combout\ = (\U_SEC_ALARM|count\(4) & (\U_SEC_ALARM|Add0~7\ $ (GND))) # (!\U_SEC_ALARM|count\(4) & (!\U_SEC_ALARM|Add0~7\ & VCC))
-- \U_SEC_ALARM|Add0~9\ = CARRY((\U_SEC_ALARM|count\(4) & !\U_SEC_ALARM|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_ALARM|count\(4),
	datad => VCC,
	cin => \U_SEC_ALARM|Add0~7\,
	combout => \U_SEC_ALARM|Add0~8_combout\,
	cout => \U_SEC_ALARM|Add0~9\);

-- Location: LCCOMB_X12_Y14_N18
\U_SEC_ALARM|count~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|count~2_combout\ = (\U_SEC_ALARM|Add0~8_combout\ & ((\U_SEC_ALARM|count\(2)) # ((!\U_SEC_ALARM|Equal0~0_combout\) # (!\U_SEC_ALARM|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(2),
	datab => \U_SEC_ALARM|count\(1),
	datac => \U_SEC_ALARM|Add0~8_combout\,
	datad => \U_SEC_ALARM|Equal0~0_combout\,
	combout => \U_SEC_ALARM|count~2_combout\);

-- Location: FF_X12_Y14_N19
\U_SEC_ALARM|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_SEC_ALARM|count~2_combout\,
	ena => \U_SW_SEC|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_ALARM|count\(4));

-- Location: LCCOMB_X12_Y14_N10
\U_SEC_ALARM|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|Add0~10_combout\ = \U_SEC_ALARM|Add0~9\ $ (\U_SEC_ALARM|count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U_SEC_ALARM|count\(5),
	cin => \U_SEC_ALARM|Add0~9\,
	combout => \U_SEC_ALARM|Add0~10_combout\);

-- Location: LCCOMB_X12_Y14_N28
\U_SEC_ALARM|count~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|count~0_combout\ = (\U_SEC_ALARM|Add0~10_combout\ & ((\U_SEC_ALARM|count\(2)) # ((!\U_SEC_ALARM|count\(1)) # (!\U_SEC_ALARM|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(2),
	datab => \U_SEC_ALARM|Equal0~0_combout\,
	datac => \U_SEC_ALARM|count\(1),
	datad => \U_SEC_ALARM|Add0~10_combout\,
	combout => \U_SEC_ALARM|count~0_combout\);

-- Location: FF_X12_Y14_N29
\U_SEC_ALARM|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_SEC_ALARM|count~0_combout\,
	ena => \U_SW_SEC|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_ALARM|count\(5));

-- Location: LCCOMB_X12_Y14_N24
\U_SEC_ALARM|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|Equal0~0_combout\ = (\U_SEC_ALARM|count\(0) & (\U_SEC_ALARM|count\(4) & (\U_SEC_ALARM|count\(3) & \U_SEC_ALARM|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(0),
	datab => \U_SEC_ALARM|count\(4),
	datac => \U_SEC_ALARM|count\(3),
	datad => \U_SEC_ALARM|count\(5),
	combout => \U_SEC_ALARM|Equal0~0_combout\);

-- Location: LCCOMB_X12_Y14_N26
\U_SEC_ALARM|count~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_ALARM|count~1_combout\ = (\U_SEC_ALARM|Add0~4_combout\ & (((\U_SEC_ALARM|count\(2)) # (!\U_SEC_ALARM|count\(1))) # (!\U_SEC_ALARM|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|Equal0~0_combout\,
	datab => \U_SEC_ALARM|count\(1),
	datac => \U_SEC_ALARM|count\(2),
	datad => \U_SEC_ALARM|Add0~4_combout\,
	combout => \U_SEC_ALARM|count~1_combout\);

-- Location: FF_X12_Y14_N27
\U_SEC_ALARM|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_SEC_ALARM|count~1_combout\,
	ena => \U_SW_SEC|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_ALARM|count\(2));

-- Location: LCCOMB_X12_Y14_N22
\U_ABIN2BCD_SEC|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|LessThan0~0_combout\ = (\U_SEC_ALARM|count\(2) & (\U_SEC_ALARM|count\(4) & (\U_SEC_ALARM|count\(3) & \U_SEC_ALARM|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(2),
	datab => \U_SEC_ALARM|count\(4),
	datac => \U_SEC_ALARM|count\(3),
	datad => \U_SEC_ALARM|count\(5),
	combout => \U_ABIN2BCD_SEC|LessThan0~0_combout\);

-- Location: LCCOMB_X13_Y16_N14
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((\U_SEC_ALARM|count\(3) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\)))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((\U_SEC_ALARM|count\(3) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(3),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X13_Y16_N16
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_SEC_ALARM|count\(4) & ((\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)) # 
-- (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)))) # (!\U_SEC_ALARM|count\(4) & (((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_ABIN2BCD_SEC|LessThan0~0_combout\) # (!\U_SEC_ALARM|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(4),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X13_Y16_N18
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (\U_SEC_ALARM|count\(5) & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & VCC))) # 
-- (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((\U_SEC_ALARM|count\(5) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\)))))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\U_SEC_ALARM|count\(5) & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100000010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(5),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X13_Y16_N20
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X13_Y16_N28
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\);

-- Location: LCCOMB_X13_Y16_N10
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ = (\U_SEC_ALARM|count\(5) & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(5),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\);

-- Location: LCCOMB_X10_Y16_N20
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\);

-- Location: LCCOMB_X13_Y16_N26
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ = (\U_SEC_ALARM|count\(4) & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(4),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\);

-- Location: LCCOMB_X10_Y16_N26
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\);

-- Location: LCCOMB_X10_Y16_N24
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_ALARM|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_ALARM|count\(3),
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\);

-- Location: LCCOMB_X13_Y16_N0
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (\U_SEC_ALARM|count\(2) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_SEC_ALARM|count\(2),
	datad => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X10_Y16_N12
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\);

-- Location: LCCOMB_X13_Y16_N24
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ = (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_ALARM|count\(2) & \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datac => \U_SEC_ALARM|count\(2),
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\);

-- Location: LCCOMB_X10_Y16_N2
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\) # (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\)))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\) # (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X10_Y16_N4
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\)))) # (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ & 
-- (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\)))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X10_Y16_N6
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\)))) # (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\)))))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X10_Y16_N8
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\)))) # (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ & 
-- (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\)))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X10_Y16_N10
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y16_N22
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\);

-- Location: LCCOMB_X13_Y16_N8
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\) # 
-- ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\);

-- Location: LCCOMB_X10_Y16_N28
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\);

-- Location: LCCOMB_X10_Y16_N18
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\) # 
-- ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\);

-- Location: LCCOMB_X10_Y16_N30
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\);

-- Location: LCCOMB_X10_Y16_N16
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\) # 
-- ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\);

-- Location: LCCOMB_X11_Y16_N0
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\);

-- Location: LCCOMB_X13_Y16_N22
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # 
-- ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\);

-- Location: LCCOMB_X13_Y16_N2
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ = (\U_SEC_ALARM|count\(1) & (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\U_ABIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(1),
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\);

-- Location: LCCOMB_X13_Y16_N30
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_SEC_ALARM|count\(1) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_SEC_ALARM|count\(1),
	datad => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X13_Y16_N12
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\);

-- Location: LCCOMB_X12_Y16_N0
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\)))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X12_Y16_N2
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\)))) # (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & 
-- (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\)))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X12_Y16_N4
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\)))) # (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\)))))
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X12_Y16_N6
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\ & 
-- !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X12_Y16_N8
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\) # ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\) # 
-- (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X12_Y16_N10
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X12_Y15_N28
\U_DIVER|cnt_0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_DIVER|cnt_0~1_combout\ = (!\U_DIVER|cnt_0\(1) & \U_DIVER|cnt_0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_DIVER|cnt_0\(1),
	datad => \U_DIVER|cnt_0\(0),
	combout => \U_DIVER|cnt_0~1_combout\);

-- Location: FF_X12_Y15_N29
\U_DIVER|cnt_0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_DIVER|cnt_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_DIVER|cnt_0\(1));

-- Location: LCCOMB_X12_Y15_N26
\U_DIVER|cnt_0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_DIVER|cnt_0~0_combout\ = (!\U_DIVER|cnt_0\(0) & !\U_DIVER|cnt_0\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_DIVER|cnt_0\(0),
	datad => \U_DIVER|cnt_0\(1),
	combout => \U_DIVER|cnt_0~0_combout\);

-- Location: FF_X12_Y15_N27
\U_DIVER|cnt_0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_DIVER|cnt_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_DIVER|cnt_0\(0));

-- Location: LCCOMB_X12_Y15_N16
\U_DIVER|m_clk0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_DIVER|m_clk0~0_combout\ = \U_DIVER|m_clk0~q\ $ (((!\U_DIVER|cnt_0\(0) & \U_DIVER|cnt_0\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_DIVER|m_clk0~q\,
	datac => \U_DIVER|cnt_0\(0),
	datad => \U_DIVER|cnt_0\(1),
	combout => \U_DIVER|m_clk0~0_combout\);

-- Location: LCCOMB_X12_Y15_N30
\U_DIVER|m_clk0~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_DIVER|m_clk0~feeder_combout\ = \U_DIVER|m_clk0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_DIVER|m_clk0~0_combout\,
	combout => \U_DIVER|m_clk0~feeder_combout\);

-- Location: FF_X12_Y15_N31
\U_DIVER|m_clk0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_DIVER|m_clk0~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_DIVER|m_clk0~q\);

-- Location: LCCOMB_X11_Y15_N12
\U_SEC_BIN|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Add0~0_combout\ = \U_SEC_BIN|count\(0) $ (VCC)
-- \U_SEC_BIN|Add0~1\ = CARRY(\U_SEC_BIN|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(0),
	datad => VCC,
	combout => \U_SEC_BIN|Add0~0_combout\,
	cout => \U_SEC_BIN|Add0~1\);

-- Location: FF_X11_Y15_N13
\U_SEC_BIN|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk0~q\,
	d => \U_SEC_BIN|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_BIN|count\(0));

-- Location: LCCOMB_X11_Y15_N14
\U_SEC_BIN|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Add0~2_combout\ = (\U_SEC_BIN|count\(1) & (!\U_SEC_BIN|Add0~1\)) # (!\U_SEC_BIN|count\(1) & ((\U_SEC_BIN|Add0~1\) # (GND)))
-- \U_SEC_BIN|Add0~3\ = CARRY((!\U_SEC_BIN|Add0~1\) # (!\U_SEC_BIN|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_BIN|count\(1),
	datad => VCC,
	cin => \U_SEC_BIN|Add0~1\,
	combout => \U_SEC_BIN|Add0~2_combout\,
	cout => \U_SEC_BIN|Add0~3\);

-- Location: FF_X11_Y15_N15
\U_SEC_BIN|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk0~q\,
	d => \U_SEC_BIN|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_BIN|count\(1));

-- Location: LCCOMB_X11_Y15_N16
\U_SEC_BIN|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Add0~4_combout\ = (\U_SEC_BIN|count\(2) & (\U_SEC_BIN|Add0~3\ $ (GND))) # (!\U_SEC_BIN|count\(2) & (!\U_SEC_BIN|Add0~3\ & VCC))
-- \U_SEC_BIN|Add0~5\ = CARRY((\U_SEC_BIN|count\(2) & !\U_SEC_BIN|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_BIN|count\(2),
	datad => VCC,
	cin => \U_SEC_BIN|Add0~3\,
	combout => \U_SEC_BIN|Add0~4_combout\,
	cout => \U_SEC_BIN|Add0~5\);

-- Location: LCCOMB_X11_Y15_N18
\U_SEC_BIN|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Add0~6_combout\ = (\U_SEC_BIN|count\(3) & (!\U_SEC_BIN|Add0~5\)) # (!\U_SEC_BIN|count\(3) & ((\U_SEC_BIN|Add0~5\) # (GND)))
-- \U_SEC_BIN|Add0~7\ = CARRY((!\U_SEC_BIN|Add0~5\) # (!\U_SEC_BIN|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_BIN|count\(3),
	datad => VCC,
	cin => \U_SEC_BIN|Add0~5\,
	combout => \U_SEC_BIN|Add0~6_combout\,
	cout => \U_SEC_BIN|Add0~7\);

-- Location: LCCOMB_X11_Y15_N8
\U_SEC_BIN|count~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|count~3_combout\ = (\U_SEC_BIN|Add0~6_combout\ & (((\U_SEC_BIN|count\(2)) # (!\U_SEC_BIN|count\(1))) # (!\U_SEC_BIN|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|Equal0~0_combout\,
	datab => \U_SEC_BIN|count\(1),
	datac => \U_SEC_BIN|count\(2),
	datad => \U_SEC_BIN|Add0~6_combout\,
	combout => \U_SEC_BIN|count~3_combout\);

-- Location: FF_X11_Y15_N9
\U_SEC_BIN|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk0~q\,
	d => \U_SEC_BIN|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_BIN|count\(3));

-- Location: LCCOMB_X11_Y15_N20
\U_SEC_BIN|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Add0~8_combout\ = (\U_SEC_BIN|count\(4) & (\U_SEC_BIN|Add0~7\ $ (GND))) # (!\U_SEC_BIN|count\(4) & (!\U_SEC_BIN|Add0~7\ & VCC))
-- \U_SEC_BIN|Add0~9\ = CARRY((\U_SEC_BIN|count\(4) & !\U_SEC_BIN|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(4),
	datad => VCC,
	cin => \U_SEC_BIN|Add0~7\,
	combout => \U_SEC_BIN|Add0~8_combout\,
	cout => \U_SEC_BIN|Add0~9\);

-- Location: LCCOMB_X11_Y15_N10
\U_SEC_BIN|count~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|count~2_combout\ = (\U_SEC_BIN|Add0~8_combout\ & (((\U_SEC_BIN|count\(2)) # (!\U_SEC_BIN|count\(1))) # (!\U_SEC_BIN|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|Equal0~0_combout\,
	datab => \U_SEC_BIN|count\(1),
	datac => \U_SEC_BIN|count\(2),
	datad => \U_SEC_BIN|Add0~8_combout\,
	combout => \U_SEC_BIN|count~2_combout\);

-- Location: FF_X11_Y15_N11
\U_SEC_BIN|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk0~q\,
	d => \U_SEC_BIN|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_BIN|count\(4));

-- Location: LCCOMB_X11_Y15_N22
\U_SEC_BIN|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Add0~10_combout\ = \U_SEC_BIN|count\(5) $ (\U_SEC_BIN|Add0~9\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(5),
	cin => \U_SEC_BIN|Add0~9\,
	combout => \U_SEC_BIN|Add0~10_combout\);

-- Location: LCCOMB_X11_Y15_N26
\U_SEC_BIN|count~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|count~0_combout\ = (\U_SEC_BIN|Add0~10_combout\ & ((\U_SEC_BIN|count\(2)) # ((!\U_SEC_BIN|Equal0~0_combout\) # (!\U_SEC_BIN|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(2),
	datab => \U_SEC_BIN|count\(1),
	datac => \U_SEC_BIN|Add0~10_combout\,
	datad => \U_SEC_BIN|Equal0~0_combout\,
	combout => \U_SEC_BIN|count~0_combout\);

-- Location: FF_X11_Y15_N27
\U_SEC_BIN|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk0~q\,
	d => \U_SEC_BIN|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_BIN|count\(5));

-- Location: LCCOMB_X11_Y15_N6
\U_SEC_BIN|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Equal0~0_combout\ = (\U_SEC_BIN|count\(0) & (\U_SEC_BIN|count\(3) & (\U_SEC_BIN|count\(5) & \U_SEC_BIN|count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(0),
	datab => \U_SEC_BIN|count\(3),
	datac => \U_SEC_BIN|count\(5),
	datad => \U_SEC_BIN|count\(4),
	combout => \U_SEC_BIN|Equal0~0_combout\);

-- Location: LCCOMB_X11_Y15_N4
\U_SEC_BIN|count~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|count~1_combout\ = (\U_SEC_BIN|Add0~4_combout\ & (((\U_SEC_BIN|count\(2)) # (!\U_SEC_BIN|count\(1))) # (!\U_SEC_BIN|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|Equal0~0_combout\,
	datab => \U_SEC_BIN|count\(1),
	datac => \U_SEC_BIN|count\(2),
	datad => \U_SEC_BIN|Add0~4_combout\,
	combout => \U_SEC_BIN|count~1_combout\);

-- Location: FF_X11_Y15_N5
\U_SEC_BIN|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk0~q\,
	d => \U_SEC_BIN|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_SEC_BIN|count\(2));

-- Location: LCCOMB_X11_Y15_N28
\U_BIN2BCD_SEC|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|LessThan0~0_combout\ = (\U_SEC_BIN|count\(2) & (\U_SEC_BIN|count\(3) & (\U_SEC_BIN|count\(5) & \U_SEC_BIN|count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(2),
	datab => \U_SEC_BIN|count\(3),
	datac => \U_SEC_BIN|count\(5),
	datad => \U_SEC_BIN|count\(4),
	combout => \U_BIN2BCD_SEC|LessThan0~0_combout\);

-- Location: LCCOMB_X11_Y16_N2
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(3))))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_BIN|count\(3),
	datad => VCC,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X11_Y16_N4
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_BIN2BCD_SEC|LessThan0~0_combout\ & (((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)))) # (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & 
-- ((\U_SEC_BIN|count\(4) & (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\U_SEC_BIN|count\(4) & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_BIN2BCD_SEC|LessThan0~0_combout\) # (!\U_SEC_BIN|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_BIN|count\(4),
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X11_Y16_N6
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_BIN|count\(5) & VCC))) # 
-- (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(5))))))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_BIN|count\(5) & !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_BIN|count\(5),
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X11_Y16_N8
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X11_Y12_N10
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ = (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_SEC_BIN|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_SEC_BIN|count\(5),
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\);

-- Location: LCCOMB_X11_Y12_N28
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ = (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\);

-- Location: LCCOMB_X11_Y16_N12
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\);

-- Location: LCCOMB_X11_Y16_N30
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ = (\U_SEC_BIN|count\(4) & (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & !\U_BIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(4),
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\);

-- Location: LCCOMB_X11_Y16_N18
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ = (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_SEC_BIN|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_SEC_BIN|count\(3),
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\);

-- Location: LCCOMB_X11_Y16_N16
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ = (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\);

-- Location: LCCOMB_X11_Y12_N30
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ = (\U_SEC_BIN|count\(2) & (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & !\U_BIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_BIN|count\(2),
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\);

-- Location: LCCOMB_X11_Y12_N0
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (\U_SEC_BIN|count\(2) & !\U_BIN2BCD_SEC|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_SEC_BIN|count\(2),
	datad => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X11_Y12_N4
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\);

-- Location: LCCOMB_X11_Y12_N18
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\)))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X11_Y12_N20
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\)))) # (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ & 
-- (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\)))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ & 
-- !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X11_Y12_N22
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\)))) # (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\)))))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X11_Y12_N24
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\)))) # (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ & 
-- (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\)))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ & 
-- !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X11_Y12_N26
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X11_Y12_N8
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\) # 
-- ((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\);

-- Location: LCCOMB_X11_Y12_N6
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ = (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\);

-- Location: LCCOMB_X11_Y12_N16
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\);

-- Location: LCCOMB_X11_Y16_N24
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\) # 
-- ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\);

-- Location: LCCOMB_X11_Y16_N22
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\) # 
-- ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\);

-- Location: LCCOMB_X11_Y12_N14
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ = (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\);

-- Location: LCCOMB_X11_Y12_N12
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ = (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\);

-- Location: LCCOMB_X11_Y12_N2
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # 
-- ((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\);

-- Location: LCCOMB_X11_Y16_N20
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_BIN|count\(1),
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X11_Y16_N28
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ = (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\);

-- Location: LCCOMB_X11_Y16_N14
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_BIN|count\(1),
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\);

-- Location: LCCOMB_X12_Y12_N0
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\) # (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\)))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\) # (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X12_Y12_N2
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\)))) # (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & 
-- (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\)))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\ & 
-- !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X12_Y12_N4
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\)))) # (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\)))))
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X12_Y12_N6
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ & (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\ & 
-- !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[27]~23_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X12_Y12_N8
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\) # ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\) # 
-- (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~22_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X12_Y12_N10
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X11_Y16_N10
\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\ = (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_BIN|count\(0),
	combout => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\);

-- Location: LCCOMB_X11_Y16_N26
\U_MUX_DISP0|y[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[0]~4_combout\ = (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\U_SEC_BIN|count\(0) & (!\U_BIN2BCD_SEC|LessThan0~0_combout\))) # 
-- (!\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(0),
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\,
	combout => \U_MUX_DISP0|y[0]~4_combout\);

-- Location: LCCOMB_X13_Y16_N4
\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\ = (\U_SEC_ALARM|count\(0) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_ALARM|count\(0),
	datad => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\);

-- Location: LCCOMB_X12_Y16_N30
\U_MUX_DISP0|y[0]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[0]~18_combout\ = (\U_TRIGGER|temp~q\ & (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\)))) # 
-- (!\U_TRIGGER|temp~q\ & (((\U_MUX_DISP0|y[0]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \U_TRIGGER|temp~q\,
	datac => \U_MUX_DISP0|y[0]~4_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~12_combout\,
	combout => \U_MUX_DISP0|y[0]~18_combout\);

-- Location: LCCOMB_X12_Y16_N12
\U_MUX_DISP0|y[0]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[0]~2_combout\ = (\U_TRIGGER|temp~q\ & \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_TRIGGER|temp~q\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \U_MUX_DISP0|y[0]~2_combout\);

-- Location: LCCOMB_X12_Y16_N20
\U_MUX_DISP0|y[0]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[0]~5_combout\ = (\U_MUX_DISP0|y[0]~18_combout\) # ((!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_ALARM|count\(0) & \U_MUX_DISP0|y[0]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_ALARM|count\(0),
	datac => \U_MUX_DISP0|y[0]~18_combout\,
	datad => \U_MUX_DISP0|y[0]~2_combout\,
	combout => \U_MUX_DISP0|y[0]~5_combout\);

-- Location: LCCOMB_X13_Y16_N6
\U_MUX_DISP0|y[1]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[1]~9_combout\ = (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_SEC_ALARM|count\(1) & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\))) # 
-- (!\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(1),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_MUX_DISP0|y[1]~9_combout\);

-- Location: LCCOMB_X12_Y12_N24
\U_MUX_DISP0|y[1]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[1]~8_combout\ = (!\U_TRIGGER|temp~q\ & (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \U_MUX_DISP0|y[1]~8_combout\);

-- Location: LCCOMB_X12_Y16_N22
\U_MUX_DISP0|y[0]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[0]~6_combout\ = (!\U_TRIGGER|temp~q\ & !\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_TRIGGER|temp~q\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \U_MUX_DISP0|y[0]~6_combout\);

-- Location: LCCOMB_X12_Y16_N14
\U_MUX_DISP0|y[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[0]~3_combout\ = (\U_TRIGGER|temp~q\ & !\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_TRIGGER|temp~q\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \U_MUX_DISP0|y[0]~3_combout\);

-- Location: LCCOMB_X12_Y16_N16
\U_MUX_DISP0|y[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[1]~7_combout\ = (\U_MUX_DISP0|y[0]~6_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\) # ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & 
-- \U_MUX_DISP0|y[0]~3_combout\)))) # (!\U_MUX_DISP0|y[0]~6_combout\ & (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & (\U_MUX_DISP0|y[0]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[0]~6_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datac => \U_MUX_DISP0|y[0]~3_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \U_MUX_DISP0|y[1]~7_combout\);

-- Location: LCCOMB_X12_Y12_N14
\U_MUX_DISP0|y[1]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[1]~10_combout\ = (\U_MUX_DISP0|y[1]~8_combout\) # ((\U_MUX_DISP0|y[1]~7_combout\) # ((\U_MUX_DISP0|y[1]~9_combout\ & \U_MUX_DISP0|y[0]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[1]~9_combout\,
	datab => \U_MUX_DISP0|y[1]~8_combout\,
	datac => \U_MUX_DISP0|y[0]~2_combout\,
	datad => \U_MUX_DISP0|y[1]~7_combout\,
	combout => \U_MUX_DISP0|y[1]~10_combout\);

-- Location: LCCOMB_X12_Y12_N28
\U_MUX_DISP0|y[0]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[0]~13_combout\ = (!\U_TRIGGER|temp~q\ & \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_TRIGGER|temp~q\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \U_MUX_DISP0|y[0]~13_combout\);

-- Location: LCCOMB_X12_Y16_N26
\U_MUX_DISP0|y[2]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[2]~11_combout\ = (\U_MUX_DISP0|y[0]~6_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\) # ((\U_MUX_DISP0|y[0]~3_combout\ & 
-- \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\)))) # (!\U_MUX_DISP0|y[0]~6_combout\ & (((\U_MUX_DISP0|y[0]~3_combout\ & \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[0]~6_combout\,
	datab => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datac => \U_MUX_DISP0|y[0]~3_combout\,
	datad => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \U_MUX_DISP0|y[2]~11_combout\);

-- Location: LCCOMB_X12_Y16_N24
\U_MUX_DISP0|y[2]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[2]~12_combout\ = (\U_MUX_DISP0|y[2]~11_combout\) # ((\U_MUX_DISP0|y[0]~2_combout\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[2]~11_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datad => \U_MUX_DISP0|y[0]~2_combout\,
	combout => \U_MUX_DISP0|y[2]~12_combout\);

-- Location: LCCOMB_X12_Y12_N26
\U_MUX_DISP0|y[2]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[2]~14_combout\ = (\U_MUX_DISP0|y[2]~12_combout\) # ((\U_MUX_DISP0|y[0]~13_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datab => \U_MUX_DISP0|y[0]~13_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[25]~25_combout\,
	datad => \U_MUX_DISP0|y[2]~12_combout\,
	combout => \U_MUX_DISP0|y[2]~14_combout\);

-- Location: LCCOMB_X12_Y16_N18
\U_MUX_DISP0|y[3]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[3]~15_combout\ = (\U_MUX_DISP0|y[0]~6_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\) # ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & 
-- \U_MUX_DISP0|y[0]~3_combout\)))) # (!\U_MUX_DISP0|y[0]~6_combout\ & (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & (\U_MUX_DISP0|y[0]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[0]~6_combout\,
	datab => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datac => \U_MUX_DISP0|y[0]~3_combout\,
	datad => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	combout => \U_MUX_DISP0|y[3]~15_combout\);

-- Location: LCCOMB_X12_Y16_N28
\U_MUX_DISP0|y[3]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[3]~16_combout\ = (\U_MUX_DISP0|y[3]~15_combout\) # ((\U_MUX_DISP0|y[0]~2_combout\ & ((\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\) # 
-- (\U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\,
	datab => \U_MUX_DISP0|y[3]~15_combout\,
	datac => \U_ABIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datad => \U_MUX_DISP0|y[0]~2_combout\,
	combout => \U_MUX_DISP0|y[3]~16_combout\);

-- Location: LCCOMB_X12_Y12_N20
\U_MUX_DISP0|y[3]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP0|y[3]~17_combout\ = (\U_MUX_DISP0|y[3]~16_combout\) # ((\U_MUX_DISP0|y[0]~13_combout\ & ((\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datab => \U_MUX_DISP0|y[0]~13_combout\,
	datac => \U_BIN2BCD_SEC|Mod0|auto_generated|divider|divider|StageOut[26]~24_combout\,
	datad => \U_MUX_DISP0|y[3]~16_combout\,
	combout => \U_MUX_DISP0|y[3]~17_combout\);

-- Location: LCCOMB_X11_Y13_N20
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((\U_SEC_ALARM|count\(3) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\)))
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((\U_SEC_ALARM|count\(3) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(3),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X11_Y13_N22
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_SEC_ALARM|count\(4) & ((\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)) # 
-- (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)))) # (!\U_SEC_ALARM|count\(4) & (((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_ABIN2BCD_SEC|LessThan0~0_combout\) # (!\U_SEC_ALARM|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(4),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X11_Y13_N24
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_ALARM|count\(5) & VCC))) # 
-- (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_ALARM|count\(5))))))
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_ALARM|count\(5) & !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_ALARM|count\(5),
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X11_Y13_N26
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X11_Y13_N16
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ = (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\);

-- Location: LCCOMB_X11_Y13_N28
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\U_SEC_ALARM|count\(5) & !\U_ABIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \U_SEC_ALARM|count\(5),
	datac => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\);

-- Location: LCCOMB_X11_Y13_N12
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ = (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\);

-- Location: LCCOMB_X11_Y13_N18
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_ALARM|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_ALARM|count\(4),
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\);

-- Location: LCCOMB_X11_Y13_N30
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_ALARM|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_ALARM|count\(3),
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\);

-- Location: LCCOMB_X11_Y13_N0
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ = (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\);

-- Location: LCCOMB_X10_Y13_N0
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_ALARM|count\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_ALARM|count\(2),
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X10_Y13_N2
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & 
-- !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\);

-- Location: LCCOMB_X10_Y13_N24
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ = (\U_SEC_ALARM|count\(2) & (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_ALARM|count\(2),
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\);

-- Location: LCCOMB_X11_Y13_N2
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\) # (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\)))
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\) # (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X11_Y13_N4
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\) # 
-- (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\)))) # (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ & 
-- (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\)))
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ & (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ & 
-- !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X11_Y13_N6
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\) # 
-- (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\)))) # (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\) # 
-- (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\)))))
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\) # 
-- (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X11_Y13_N8
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ & (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ & 
-- !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X11_Y13_N10
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y13_N22
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ = (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\);

-- Location: LCCOMB_X10_Y13_N4
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\);

-- Location: LCCOMB_X10_Y13_N28
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ = (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\);

-- Location: LCCOMB_X11_Y13_N14
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\) # 
-- ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\);

-- Location: LCCOMB_X10_Y13_N26
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ = (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\);

-- Location: LCCOMB_X10_Y13_N18
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ = (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\) # 
-- ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\);

-- Location: LCCOMB_X10_Y13_N6
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (!\U_ABIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_ALARM|count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_ALARM|count\(1),
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X10_Y13_N30
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ = (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\);

-- Location: LCCOMB_X10_Y13_N20
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ = (\U_SEC_ALARM|count\(1) & (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\U_ABIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_ALARM|count\(1),
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\);

-- Location: LCCOMB_X10_Y13_N8
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\) # (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\,
	datad => VCC,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X10_Y13_N10
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ & (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ & 
-- !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X10_Y13_N12
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & 
-- ((\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\) # (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X10_Y13_N14
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ & (!\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ & 
-- !\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X10_Y13_N16
\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X12_Y17_N18
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(3))))
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_BIN|count\(3),
	datad => VCC,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X12_Y17_N20
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_BIN2BCD_SEC|LessThan0~0_combout\ & (((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)))) # (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & 
-- ((\U_SEC_BIN|count\(4) & (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\U_SEC_BIN|count\(4) & (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_BIN2BCD_SEC|LessThan0~0_combout\) # (!\U_SEC_BIN|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_BIN|count\(4),
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X12_Y17_N22
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_BIN|count\(5) & VCC))) # 
-- (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(5))))))
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((!\U_BIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_BIN|count\(5) & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datab => \U_SEC_BIN|count\(5),
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X12_Y17_N24
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X12_Y17_N30
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ = (\U_SEC_BIN|count\(4) & (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(4),
	datac => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\);

-- Location: LCCOMB_X11_Y17_N8
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & \U_SEC_BIN|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datad => \U_SEC_BIN|count\(5),
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\);

-- Location: LCCOMB_X12_Y17_N28
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\);

-- Location: LCCOMB_X12_Y17_N0
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\);

-- Location: LCCOMB_X12_Y17_N26
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ = (!\U_BIN2BCD_SEC|LessThan0~0_combout\ & (\U_SEC_BIN|count\(3) & \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	datac => \U_SEC_BIN|count\(3),
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\);

-- Location: LCCOMB_X12_Y17_N2
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\);

-- Location: LCCOMB_X11_Y17_N4
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (\U_SEC_BIN|count\(2) & !\U_BIN2BCD_SEC|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_SEC_BIN|count\(2),
	datad => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X11_Y17_N0
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ = (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\);

-- Location: LCCOMB_X11_Y17_N6
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ = (\U_SEC_BIN|count\(2) & (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & !\U_BIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(2),
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\);

-- Location: LCCOMB_X12_Y17_N8
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\) # (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\)))
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\) # (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X12_Y17_N10
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\) # 
-- (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\)))) # (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ & 
-- (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\)))
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ & (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ & 
-- !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X12_Y17_N12
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\)))) # (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\)))))
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X12_Y17_N14
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ & (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ & 
-- !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X12_Y17_N16
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X12_Y17_N4
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\);

-- Location: LCCOMB_X11_Y17_N24
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\);

-- Location: LCCOMB_X12_Y17_N6
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\) # 
-- ((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\);

-- Location: LCCOMB_X11_Y17_N2
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\);

-- Location: LCCOMB_X11_Y17_N22
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\) # 
-- ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\);

-- Location: LCCOMB_X11_Y17_N20
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\);

-- Location: LCCOMB_X11_Y17_N30
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ = (\U_SEC_BIN|count\(1) & (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\U_BIN2BCD_SEC|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(1),
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\);

-- Location: LCCOMB_X11_Y17_N26
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_SEC_BIN|count\(1) & !\U_BIN2BCD_SEC|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|count\(1),
	datad => \U_BIN2BCD_SEC|LessThan0~0_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X11_Y17_N28
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ = (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\);

-- Location: LCCOMB_X11_Y17_N10
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\) # (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\,
	datad => VCC,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X11_Y17_N12
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ & (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ & 
-- !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X11_Y17_N14
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & 
-- ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\) # (\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X11_Y17_N16
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ & (!\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ & 
-- !\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\,
	datab => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X11_Y17_N18
\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y17_N28
\U_MUX_DISP1|y[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP1|y[0]~0_combout\ = (\U_TRIGGER|temp~q\ & (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)) # (!\U_TRIGGER|temp~q\ & 
-- ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \U_MUX_DISP1|y[0]~0_combout\);

-- Location: LCCOMB_X10_Y17_N10
\U_MUX_DISP1|y[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP1|y[1]~1_combout\ = (\U_TRIGGER|temp~q\ & (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # (!\U_TRIGGER|temp~q\ & 
-- ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datac => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_MUX_DISP1|y[1]~1_combout\);

-- Location: LCCOMB_X10_Y17_N0
\U_MUX_DISP1|y[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP1|y[2]~2_combout\ = (\U_TRIGGER|temp~q\ & (\U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # (!\U_TRIGGER|temp~q\ & 
-- ((\U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datab => \U_ABIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_SEC|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_MUX_DISP1|y[2]~2_combout\);

-- Location: LCCOMB_X11_Y15_N30
\U_SEC_BIN|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEC_BIN|Equal0~1_combout\ = (\U_SEC_BIN|count\(1) & (!\U_SEC_BIN|count\(2) & \U_SEC_BIN|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_BIN|count\(1),
	datac => \U_SEC_BIN|count\(2),
	datad => \U_SEC_BIN|Equal0~0_combout\,
	combout => \U_SEC_BIN|Equal0~1_combout\);

-- Location: IOIBUF_X13_Y0_N15
\key_min~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key_min,
	o => \key_min~input_o\);

-- Location: LCCOMB_X12_Y14_N20
\U_SW_MIN|s1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SW_MIN|s1~combout\ = (\key_min~input_o\ & !\U_TRIGGER|temp~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key_min~input_o\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_SW_MIN|s1~combout\);

-- Location: LCCOMB_X11_Y14_N20
\U_MUX_MIN|y\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_MIN|y~combout\ = LCELL((\U_SW_MIN|s1~combout\ & ((\U_DIVER|m_clk1~q\))) # (!\U_SW_MIN|s1~combout\ & (\U_SEC_BIN|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_BIN|Equal0~1_combout\,
	datac => \U_SW_MIN|s1~combout\,
	datad => \U_DIVER|m_clk1~q\,
	combout => \U_MUX_MIN|y~combout\);

-- Location: LCCOMB_X11_Y14_N6
\U_MIN_BIN|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Add0~0_combout\ = \U_MIN_BIN|count\(0) $ (VCC)
-- \U_MIN_BIN|Add0~1\ = CARRY(\U_MIN_BIN|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(0),
	datad => VCC,
	combout => \U_MIN_BIN|Add0~0_combout\,
	cout => \U_MIN_BIN|Add0~1\);

-- Location: FF_X11_Y14_N7
\U_MIN_BIN|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_MIN|ALT_INV_y~combout\,
	d => \U_MIN_BIN|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_BIN|count\(0));

-- Location: LCCOMB_X11_Y14_N8
\U_MIN_BIN|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Add0~2_combout\ = (\U_MIN_BIN|count\(1) & (!\U_MIN_BIN|Add0~1\)) # (!\U_MIN_BIN|count\(1) & ((\U_MIN_BIN|Add0~1\) # (GND)))
-- \U_MIN_BIN|Add0~3\ = CARRY((!\U_MIN_BIN|Add0~1\) # (!\U_MIN_BIN|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_BIN|count\(1),
	datad => VCC,
	cin => \U_MIN_BIN|Add0~1\,
	combout => \U_MIN_BIN|Add0~2_combout\,
	cout => \U_MIN_BIN|Add0~3\);

-- Location: FF_X11_Y14_N9
\U_MIN_BIN|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_MIN|ALT_INV_y~combout\,
	d => \U_MIN_BIN|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_BIN|count\(1));

-- Location: LCCOMB_X11_Y14_N10
\U_MIN_BIN|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Add0~4_combout\ = (\U_MIN_BIN|count\(2) & (\U_MIN_BIN|Add0~3\ $ (GND))) # (!\U_MIN_BIN|count\(2) & (!\U_MIN_BIN|Add0~3\ & VCC))
-- \U_MIN_BIN|Add0~5\ = CARRY((\U_MIN_BIN|count\(2) & !\U_MIN_BIN|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_BIN|count\(2),
	datad => VCC,
	cin => \U_MIN_BIN|Add0~3\,
	combout => \U_MIN_BIN|Add0~4_combout\,
	cout => \U_MIN_BIN|Add0~5\);

-- Location: LCCOMB_X11_Y14_N12
\U_MIN_BIN|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Add0~6_combout\ = (\U_MIN_BIN|count\(3) & (!\U_MIN_BIN|Add0~5\)) # (!\U_MIN_BIN|count\(3) & ((\U_MIN_BIN|Add0~5\) # (GND)))
-- \U_MIN_BIN|Add0~7\ = CARRY((!\U_MIN_BIN|Add0~5\) # (!\U_MIN_BIN|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_BIN|count\(3),
	datad => VCC,
	cin => \U_MIN_BIN|Add0~5\,
	combout => \U_MIN_BIN|Add0~6_combout\,
	cout => \U_MIN_BIN|Add0~7\);

-- Location: LCCOMB_X11_Y14_N2
\U_MIN_BIN|count~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|count~3_combout\ = (\U_MIN_BIN|Add0~6_combout\ & ((\U_MIN_BIN|count\(2)) # ((!\U_MIN_BIN|Equal0~0_combout\) # (!\U_MIN_BIN|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(2),
	datab => \U_MIN_BIN|count\(1),
	datac => \U_MIN_BIN|Equal0~0_combout\,
	datad => \U_MIN_BIN|Add0~6_combout\,
	combout => \U_MIN_BIN|count~3_combout\);

-- Location: FF_X11_Y14_N3
\U_MIN_BIN|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_MIN|ALT_INV_y~combout\,
	d => \U_MIN_BIN|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_BIN|count\(3));

-- Location: LCCOMB_X11_Y14_N14
\U_MIN_BIN|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Add0~8_combout\ = (\U_MIN_BIN|count\(4) & (\U_MIN_BIN|Add0~7\ $ (GND))) # (!\U_MIN_BIN|count\(4) & (!\U_MIN_BIN|Add0~7\ & VCC))
-- \U_MIN_BIN|Add0~9\ = CARRY((\U_MIN_BIN|count\(4) & !\U_MIN_BIN|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_BIN|count\(4),
	datad => VCC,
	cin => \U_MIN_BIN|Add0~7\,
	combout => \U_MIN_BIN|Add0~8_combout\,
	cout => \U_MIN_BIN|Add0~9\);

-- Location: LCCOMB_X11_Y14_N16
\U_MIN_BIN|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Add0~10_combout\ = \U_MIN_BIN|Add0~9\ $ (\U_MIN_BIN|count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U_MIN_BIN|count\(5),
	cin => \U_MIN_BIN|Add0~9\,
	combout => \U_MIN_BIN|Add0~10_combout\);

-- Location: LCCOMB_X11_Y14_N24
\U_MIN_BIN|count~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|count~1_combout\ = (\U_MIN_BIN|Add0~10_combout\ & ((\U_MIN_BIN|count\(2)) # ((!\U_MIN_BIN|Equal0~0_combout\) # (!\U_MIN_BIN|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(2),
	datab => \U_MIN_BIN|count\(1),
	datac => \U_MIN_BIN|Equal0~0_combout\,
	datad => \U_MIN_BIN|Add0~10_combout\,
	combout => \U_MIN_BIN|count~1_combout\);

-- Location: FF_X11_Y14_N25
\U_MIN_BIN|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_MIN|ALT_INV_y~combout\,
	d => \U_MIN_BIN|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_BIN|count\(5));

-- Location: LCCOMB_X11_Y14_N26
\U_MIN_BIN|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Equal0~0_combout\ = (\U_MIN_BIN|count\(0) & (\U_MIN_BIN|count\(5) & (\U_MIN_BIN|count\(4) & \U_MIN_BIN|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(0),
	datab => \U_MIN_BIN|count\(5),
	datac => \U_MIN_BIN|count\(4),
	datad => \U_MIN_BIN|count\(3),
	combout => \U_MIN_BIN|Equal0~0_combout\);

-- Location: LCCOMB_X11_Y14_N28
\U_MIN_BIN|count~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|count~0_combout\ = (\U_MIN_BIN|Add0~4_combout\ & (((\U_MIN_BIN|count\(2)) # (!\U_MIN_BIN|count\(1))) # (!\U_MIN_BIN|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|Equal0~0_combout\,
	datab => \U_MIN_BIN|count\(1),
	datac => \U_MIN_BIN|count\(2),
	datad => \U_MIN_BIN|Add0~4_combout\,
	combout => \U_MIN_BIN|count~0_combout\);

-- Location: FF_X11_Y14_N29
\U_MIN_BIN|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_MIN|ALT_INV_y~combout\,
	d => \U_MIN_BIN|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_BIN|count\(2));

-- Location: LCCOMB_X11_Y14_N4
\U_MIN_BIN|count~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|count~2_combout\ = (\U_MIN_BIN|Add0~8_combout\ & (((\U_MIN_BIN|count\(2)) # (!\U_MIN_BIN|Equal0~0_combout\)) # (!\U_MIN_BIN|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(1),
	datab => \U_MIN_BIN|count\(2),
	datac => \U_MIN_BIN|Add0~8_combout\,
	datad => \U_MIN_BIN|Equal0~0_combout\,
	combout => \U_MIN_BIN|count~2_combout\);

-- Location: FF_X11_Y14_N5
\U_MIN_BIN|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_MIN|ALT_INV_y~combout\,
	d => \U_MIN_BIN|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_BIN|count\(4));

-- Location: LCCOMB_X11_Y14_N22
\U_BIN2BCD_MIN|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|LessThan0~0_combout\ = (\U_MIN_BIN|count\(4) & (\U_MIN_BIN|count\(2) & (\U_MIN_BIN|count\(5) & \U_MIN_BIN|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(4),
	datab => \U_MIN_BIN|count\(2),
	datac => \U_MIN_BIN|count\(5),
	datad => \U_MIN_BIN|count\(3),
	combout => \U_BIN2BCD_MIN|LessThan0~0_combout\);

-- Location: LCCOMB_X12_Y14_N14
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ = (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_BIN|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datac => \U_MIN_BIN|count\(0),
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\);

-- Location: LCCOMB_X14_Y13_N0
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((\U_MIN_BIN|count\(3) & !\U_BIN2BCD_MIN|LessThan0~0_combout\)))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((\U_MIN_BIN|count\(3) & !\U_BIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(3),
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X14_Y13_N2
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_MIN_BIN|count\(4) & ((\U_BIN2BCD_MIN|LessThan0~0_combout\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)) # 
-- (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)))) # (!\U_MIN_BIN|count\(4) & (((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_BIN2BCD_MIN|LessThan0~0_combout\) # (!\U_MIN_BIN|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(4),
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X14_Y13_N4
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (\U_MIN_BIN|count\(5) & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & VCC))) # 
-- (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((\U_MIN_BIN|count\(5) & !\U_BIN2BCD_MIN|LessThan0~0_combout\)))))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\U_MIN_BIN|count\(5) & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100000010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(5),
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X14_Y13_N6
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X14_Y13_N22
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\);

-- Location: LCCOMB_X14_Y13_N28
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\U_MIN_BIN|count\(5) & !\U_BIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_MIN_BIN|count\(5),
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\);

-- Location: LCCOMB_X14_Y13_N30
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\U_MIN_BIN|count\(4) & !\U_BIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_MIN_BIN|count\(4),
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\);

-- Location: LCCOMB_X16_Y13_N8
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\);

-- Location: LCCOMB_X14_Y13_N26
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\);

-- Location: LCCOMB_X14_Y13_N8
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ = (\U_MIN_BIN|count\(3) & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(3),
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\);

-- Location: LCCOMB_X16_Y14_N30
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ = (\U_MIN_BIN|count\(2) & (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & !\U_BIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(2),
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\);

-- Location: LCCOMB_X16_Y14_N20
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (\U_MIN_BIN|count\(2) & !\U_BIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(2),
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X16_Y14_N4
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ = (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\);

-- Location: LCCOMB_X14_Y13_N12
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\)))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X14_Y13_N14
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ & 
-- (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\)))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ & 
-- !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X14_Y13_N16
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\)))))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X14_Y13_N18
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ & 
-- (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\)))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ & 
-- !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X14_Y13_N20
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X16_Y13_N10
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\);

-- Location: LCCOMB_X14_Y13_N24
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\) # 
-- ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\);

-- Location: LCCOMB_X13_Y13_N30
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ = (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\);

-- Location: LCCOMB_X13_Y13_N28
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\) # 
-- ((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\);

-- Location: LCCOMB_X13_Y13_N20
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\);

-- Location: LCCOMB_X14_Y13_N10
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\) # 
-- ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\);

-- Location: LCCOMB_X13_Y13_N26
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\);

-- Location: LCCOMB_X13_Y13_N18
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # 
-- ((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\);

-- Location: LCCOMB_X13_Y13_N0
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ = (\U_MIN_BIN|count\(1) & (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\U_BIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(1),
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\);

-- Location: LCCOMB_X13_Y13_N24
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_MIN_BIN|count\(1) & !\U_BIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MIN_BIN|count\(1),
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X16_Y13_N4
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\);

-- Location: LCCOMB_X13_Y13_N6
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ = (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\)))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ = CARRY((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\);

-- Location: LCCOMB_X13_Y13_N8
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & 
-- (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\)))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ = CARRY((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\ & 
-- !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\);

-- Location: LCCOMB_X13_Y13_N10
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\)))))
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ = CARRY((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\);

-- Location: LCCOMB_X13_Y13_N12
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ = CARRY((!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ & (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\ & 
-- !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\);

-- Location: LCCOMB_X13_Y13_N14
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ = CARRY((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\) # ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\) # 
-- (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\,
	cout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\);

-- Location: LCCOMB_X13_Y13_N16
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ = !\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\);

-- Location: LCCOMB_X12_Y14_N30
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_BIN|count\(0)))) # 
-- (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_MIN_BIN|count\(0),
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\);

-- Location: LCCOMB_X14_Y14_N6
\U_MIN_ALARM|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|Add0~0_combout\ = \U_MIN_ALARM|count\(0) $ (VCC)
-- \U_MIN_ALARM|Add0~1\ = CARRY(\U_MIN_ALARM|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(0),
	datad => VCC,
	combout => \U_MIN_ALARM|Add0~0_combout\,
	cout => \U_MIN_ALARM|Add0~1\);

-- Location: LCCOMB_X14_Y14_N26
\U_SW_MIN|s2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SW_MIN|s2~combout\ = (\U_TRIGGER|temp~q\ & \key_min~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_TRIGGER|temp~q\,
	datad => \key_min~input_o\,
	combout => \U_SW_MIN|s2~combout\);

-- Location: FF_X14_Y14_N7
\U_MIN_ALARM|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_MIN_ALARM|Add0~0_combout\,
	ena => \U_SW_MIN|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_ALARM|count\(0));

-- Location: LCCOMB_X14_Y14_N8
\U_MIN_ALARM|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|Add0~2_combout\ = (\U_MIN_ALARM|count\(1) & (!\U_MIN_ALARM|Add0~1\)) # (!\U_MIN_ALARM|count\(1) & ((\U_MIN_ALARM|Add0~1\) # (GND)))
-- \U_MIN_ALARM|Add0~3\ = CARRY((!\U_MIN_ALARM|Add0~1\) # (!\U_MIN_ALARM|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_ALARM|count\(1),
	datad => VCC,
	cin => \U_MIN_ALARM|Add0~1\,
	combout => \U_MIN_ALARM|Add0~2_combout\,
	cout => \U_MIN_ALARM|Add0~3\);

-- Location: FF_X14_Y14_N9
\U_MIN_ALARM|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_MIN_ALARM|Add0~2_combout\,
	ena => \U_SW_MIN|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_ALARM|count\(1));

-- Location: LCCOMB_X14_Y14_N10
\U_MIN_ALARM|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|Add0~4_combout\ = (\U_MIN_ALARM|count\(2) & (\U_MIN_ALARM|Add0~3\ $ (GND))) # (!\U_MIN_ALARM|count\(2) & (!\U_MIN_ALARM|Add0~3\ & VCC))
-- \U_MIN_ALARM|Add0~5\ = CARRY((\U_MIN_ALARM|count\(2) & !\U_MIN_ALARM|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_ALARM|count\(2),
	datad => VCC,
	cin => \U_MIN_ALARM|Add0~3\,
	combout => \U_MIN_ALARM|Add0~4_combout\,
	cout => \U_MIN_ALARM|Add0~5\);

-- Location: LCCOMB_X14_Y14_N12
\U_MIN_ALARM|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|Add0~6_combout\ = (\U_MIN_ALARM|count\(3) & (!\U_MIN_ALARM|Add0~5\)) # (!\U_MIN_ALARM|count\(3) & ((\U_MIN_ALARM|Add0~5\) # (GND)))
-- \U_MIN_ALARM|Add0~7\ = CARRY((!\U_MIN_ALARM|Add0~5\) # (!\U_MIN_ALARM|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(3),
	datad => VCC,
	cin => \U_MIN_ALARM|Add0~5\,
	combout => \U_MIN_ALARM|Add0~6_combout\,
	cout => \U_MIN_ALARM|Add0~7\);

-- Location: LCCOMB_X14_Y14_N30
\U_MIN_ALARM|count~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|count~3_combout\ = (\U_MIN_ALARM|Add0~6_combout\ & (((\U_MIN_ALARM|count\(2)) # (!\U_MIN_ALARM|Equal0~0_combout\)) # (!\U_MIN_ALARM|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(1),
	datab => \U_MIN_ALARM|Equal0~0_combout\,
	datac => \U_MIN_ALARM|count\(2),
	datad => \U_MIN_ALARM|Add0~6_combout\,
	combout => \U_MIN_ALARM|count~3_combout\);

-- Location: FF_X14_Y14_N31
\U_MIN_ALARM|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_MIN_ALARM|count~3_combout\,
	ena => \U_SW_MIN|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_ALARM|count\(3));

-- Location: LCCOMB_X14_Y14_N14
\U_MIN_ALARM|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|Add0~8_combout\ = (\U_MIN_ALARM|count\(4) & (\U_MIN_ALARM|Add0~7\ $ (GND))) # (!\U_MIN_ALARM|count\(4) & (!\U_MIN_ALARM|Add0~7\ & VCC))
-- \U_MIN_ALARM|Add0~9\ = CARRY((\U_MIN_ALARM|count\(4) & !\U_MIN_ALARM|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_ALARM|count\(4),
	datad => VCC,
	cin => \U_MIN_ALARM|Add0~7\,
	combout => \U_MIN_ALARM|Add0~8_combout\,
	cout => \U_MIN_ALARM|Add0~9\);

-- Location: LCCOMB_X14_Y14_N4
\U_MIN_ALARM|count~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|count~2_combout\ = (\U_MIN_ALARM|Add0~8_combout\ & (((\U_MIN_ALARM|count\(2)) # (!\U_MIN_ALARM|Equal0~0_combout\)) # (!\U_MIN_ALARM|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(1),
	datab => \U_MIN_ALARM|count\(2),
	datac => \U_MIN_ALARM|Add0~8_combout\,
	datad => \U_MIN_ALARM|Equal0~0_combout\,
	combout => \U_MIN_ALARM|count~2_combout\);

-- Location: FF_X14_Y14_N5
\U_MIN_ALARM|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_MIN_ALARM|count~2_combout\,
	ena => \U_SW_MIN|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_ALARM|count\(4));

-- Location: LCCOMB_X14_Y14_N16
\U_MIN_ALARM|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|Add0~10_combout\ = \U_MIN_ALARM|Add0~9\ $ (\U_MIN_ALARM|count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U_MIN_ALARM|count\(5),
	cin => \U_MIN_ALARM|Add0~9\,
	combout => \U_MIN_ALARM|Add0~10_combout\);

-- Location: LCCOMB_X14_Y14_N2
\U_MIN_ALARM|count~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|count~1_combout\ = (\U_MIN_ALARM|Add0~10_combout\ & (((\U_MIN_ALARM|count\(2)) # (!\U_MIN_ALARM|Equal0~0_combout\)) # (!\U_MIN_ALARM|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(1),
	datab => \U_MIN_ALARM|Equal0~0_combout\,
	datac => \U_MIN_ALARM|count\(2),
	datad => \U_MIN_ALARM|Add0~10_combout\,
	combout => \U_MIN_ALARM|count~1_combout\);

-- Location: FF_X14_Y14_N3
\U_MIN_ALARM|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_MIN_ALARM|count~1_combout\,
	ena => \U_SW_MIN|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_ALARM|count\(5));

-- Location: LCCOMB_X14_Y14_N24
\U_MIN_ALARM|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|Equal0~0_combout\ = (\U_MIN_ALARM|count\(4) & (\U_MIN_ALARM|count\(3) & (\U_MIN_ALARM|count\(0) & \U_MIN_ALARM|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(4),
	datab => \U_MIN_ALARM|count\(3),
	datac => \U_MIN_ALARM|count\(0),
	datad => \U_MIN_ALARM|count\(5),
	combout => \U_MIN_ALARM|Equal0~0_combout\);

-- Location: LCCOMB_X14_Y14_N20
\U_MIN_ALARM|count~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_ALARM|count~0_combout\ = (\U_MIN_ALARM|Add0~4_combout\ & (((\U_MIN_ALARM|count\(2)) # (!\U_MIN_ALARM|Equal0~0_combout\)) # (!\U_MIN_ALARM|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(1),
	datab => \U_MIN_ALARM|Equal0~0_combout\,
	datac => \U_MIN_ALARM|count\(2),
	datad => \U_MIN_ALARM|Add0~4_combout\,
	combout => \U_MIN_ALARM|count~0_combout\);

-- Location: FF_X14_Y14_N21
\U_MIN_ALARM|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_MIN_ALARM|count~0_combout\,
	ena => \U_SW_MIN|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MIN_ALARM|count\(2));

-- Location: LCCOMB_X14_Y14_N28
\U_ABIN2BCD_MIN|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|LessThan0~0_combout\ = (\U_MIN_ALARM|count\(2) & (\U_MIN_ALARM|count\(3) & (\U_MIN_ALARM|count\(4) & \U_MIN_ALARM|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(2),
	datab => \U_MIN_ALARM|count\(3),
	datac => \U_MIN_ALARM|count\(4),
	datad => \U_MIN_ALARM|count\(5),
	combout => \U_ABIN2BCD_MIN|LessThan0~0_combout\);

-- Location: LCCOMB_X13_Y14_N30
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ = (\U_MIN_ALARM|count\(0) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MIN_ALARM|count\(0),
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\);

-- Location: LCCOMB_X13_Y18_N2
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((\U_MIN_ALARM|count\(3) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\)))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((\U_MIN_ALARM|count\(3) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(3),
	datab => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X13_Y18_N4
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)))) # 
-- (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & ((\U_MIN_ALARM|count\(4) & (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\U_MIN_ALARM|count\(4) & 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_ABIN2BCD_MIN|LessThan0~0_combout\) # (!\U_MIN_ALARM|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_MIN_ALARM|count\(4),
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X13_Y18_N6
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(5) & VCC))) # 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_ALARM|count\(5))))))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(5) & !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_MIN_ALARM|count\(5),
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X13_Y18_N8
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X13_Y18_N0
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_ALARM|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datad => \U_MIN_ALARM|count\(5),
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\);

-- Location: LCCOMB_X12_Y18_N20
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ = (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\);

-- Location: LCCOMB_X13_Y18_N30
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\);

-- Location: LCCOMB_X13_Y18_N24
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\ = (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(4) & \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_MIN_ALARM|count\(4),
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\);

-- Location: LCCOMB_X14_Y18_N4
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ = (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\);

-- Location: LCCOMB_X13_Y18_N20
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ = (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_MIN_ALARM|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_MIN_ALARM|count\(3),
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\);

-- Location: LCCOMB_X13_Y15_N24
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (\U_MIN_ALARM|count\(2) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MIN_ALARM|count\(2),
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X14_Y18_N6
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\);

-- Location: LCCOMB_X14_Y14_N22
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\U_MIN_ALARM|count\(2) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \U_MIN_ALARM|count\(2),
	datac => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\);

-- Location: LCCOMB_X13_Y18_N10
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\) # (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\)))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\) # (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~15_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X13_Y18_N12
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ & 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\)))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\ & (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~13_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X13_Y18_N14
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\)))))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~11_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X13_Y18_N16
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ & 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\)))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\ & (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~9_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X13_Y18_N18
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X12_Y18_N30
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\);

-- Location: LCCOMB_X12_Y18_N2
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\) # 
-- ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[21]~8_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\);

-- Location: LCCOMB_X14_Y18_N28
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\);

-- Location: LCCOMB_X13_Y18_N26
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\) # 
-- ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[20]~10_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\);

-- Location: LCCOMB_X12_Y18_N4
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\);

-- Location: LCCOMB_X13_Y18_N28
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\) # 
-- ((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[19]~12_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\);

-- Location: LCCOMB_X12_Y18_N26
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\);

-- Location: LCCOMB_X13_Y18_N22
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\) # 
-- ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[18]~14_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\);

-- Location: LCCOMB_X13_Y17_N0
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_MIN_ALARM|count\(1) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MIN_ALARM|count\(1),
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X12_Y18_N6
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\);

-- Location: LCCOMB_X12_Y18_N28
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_MIN_ALARM|count\(1) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_MIN_ALARM|count\(1),
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\);

-- Location: LCCOMB_X12_Y18_N8
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ = (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\) # (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\)))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ = CARRY((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\) # (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\);

-- Location: LCCOMB_X12_Y18_N10
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\)))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ = CARRY((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\);

-- Location: LCCOMB_X12_Y18_N12
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\)))))
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ = CARRY((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\);

-- Location: LCCOMB_X12_Y18_N14
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ = CARRY((!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ & (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\ & 
-- !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[27]~27_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\);

-- Location: LCCOMB_X12_Y18_N16
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ = CARRY((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\) # ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\) # 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~16_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[28]~26_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\,
	cout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\);

-- Location: LCCOMB_X12_Y18_N18
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ = !\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\);

-- Location: LCCOMB_X13_Y14_N26
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_MIN_ALARM|count\(0) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\)))) # 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \U_MIN_ALARM|count\(0),
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\);

-- Location: LCCOMB_X13_Y20_N24
\U_MUX_DISP2|y[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP2|y[0]~0_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\))) # (!\U_TRIGGER|temp~q\ & (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\,
	datac => \U_TRIGGER|temp~q\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\,
	combout => \U_MUX_DISP2|y[0]~0_combout\);

-- Location: LCCOMB_X12_Y18_N24
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\) # 
-- ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\);

-- Location: LCCOMB_X13_Y13_N22
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[24]~21_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\);

-- Location: LCCOMB_X13_Y20_N14
\U_MUX_DISP2|y[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP2|y[1]~1_combout\ = (\U_TRIGGER|temp~q\ & (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\)) # (!\U_TRIGGER|temp~q\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\,
	datac => \U_TRIGGER|temp~q\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\,
	combout => \U_MUX_DISP2|y[1]~1_combout\);

-- Location: LCCOMB_X13_Y13_N4
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) # 
-- ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\);

-- Location: LCCOMB_X12_Y18_N22
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[25]~29_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\);

-- Location: LCCOMB_X12_Y20_N24
\U_MUX_DISP2|y[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP2|y[2]~2_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\))) # (!\U_TRIGGER|temp~q\ & (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_MUX_DISP2|y[2]~2_combout\);

-- Location: LCCOMB_X12_Y18_N0
\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ = (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\)))) # (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\,
	combout => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\);

-- Location: LCCOMB_X13_Y13_N2
\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\) # 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~28_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	combout => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\);

-- Location: LCCOMB_X12_Y20_N26
\U_MUX_DISP2|y[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP2|y[3]~3_combout\ = (\U_TRIGGER|temp~q\ & (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\)) # (!\U_TRIGGER|temp~q\ & ((\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\,
	datab => \U_TRIGGER|temp~q\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\,
	combout => \U_MUX_DISP2|y[3]~3_combout\);

-- Location: LCCOMB_X14_Y15_N18
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_ALARM|count\(3))))
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_ALARM|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_MIN_ALARM|count\(3),
	datad => VCC,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X14_Y15_N20
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_MIN_ALARM|count\(4) & ((\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)) # 
-- (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)))) # (!\U_MIN_ALARM|count\(4) & (((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_ABIN2BCD_MIN|LessThan0~0_combout\) # (!\U_MIN_ALARM|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(4),
	datab => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X14_Y15_N22
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(5) & VCC))) # 
-- (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_ALARM|count\(5))))))
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(5) & !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_MIN_ALARM|count\(5),
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X14_Y15_N24
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X14_Y15_N26
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ = (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(4) & \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datac => \U_MIN_ALARM|count\(4),
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\);

-- Location: LCCOMB_X14_Y15_N0
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\);

-- Location: LCCOMB_X14_Y14_N0
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ = (\U_MIN_ALARM|count\(5) & (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_ALARM|count\(5),
	datac => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\);

-- Location: LCCOMB_X14_Y15_N28
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\);

-- Location: LCCOMB_X14_Y15_N30
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ = (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\);

-- Location: LCCOMB_X14_Y15_N4
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ = (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(3) & \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datab => \U_MIN_ALARM|count\(3),
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\);

-- Location: LCCOMB_X13_Y15_N12
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ = (!\U_ABIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_ALARM|count\(2) & \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	datac => \U_MIN_ALARM|count\(2),
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\);

-- Location: LCCOMB_X13_Y15_N16
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (\U_MIN_ALARM|count\(2) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MIN_ALARM|count\(2),
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X14_Y15_N16
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\);

-- Location: LCCOMB_X14_Y15_N6
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\) # (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\)))
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\) # (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X14_Y15_N8
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\) # 
-- (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\)))) # (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ & 
-- (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\)))
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X14_Y15_N10
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\)))) # (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\)))))
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X14_Y15_N12
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X14_Y15_N14
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X14_Y15_N2
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\);

-- Location: LCCOMB_X13_Y15_N18
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ = (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\);

-- Location: LCCOMB_X13_Y15_N28
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ = (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\);

-- Location: LCCOMB_X13_Y15_N0
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\) # 
-- ((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\);

-- Location: LCCOMB_X13_Y15_N30
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\) # 
-- ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\);

-- Location: LCCOMB_X13_Y15_N14
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ = (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\);

-- Location: LCCOMB_X13_Y15_N26
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_MIN_ALARM|count\(1) & !\U_ABIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MIN_ALARM|count\(1),
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X13_Y15_N22
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ = (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\);

-- Location: LCCOMB_X13_Y15_N20
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ = (\U_MIN_ALARM|count\(1) & (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\U_ABIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_ALARM|count\(1),
	datac => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\);

-- Location: LCCOMB_X13_Y15_N2
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\) # (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\,
	datad => VCC,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X13_Y15_N4
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X13_Y15_N6
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & 
-- ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\) # (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X13_Y15_N8
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ & 
-- !\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X13_Y15_N10
\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X11_Y21_N4
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = (((\U_MIN_BIN|count\(3) & !\U_BIN2BCD_MIN|LessThan0~0_combout\)))
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY((\U_MIN_BIN|count\(3) & !\U_BIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(3),
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X11_Y21_N6
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\U_MIN_BIN|count\(4) & ((\U_BIN2BCD_MIN|LessThan0~0_combout\ & (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\)) # 
-- (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)))) # (!\U_MIN_BIN|count\(4) & (((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))))
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\U_BIN2BCD_MIN|LessThan0~0_combout\) # (!\U_MIN_BIN|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(4),
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X11_Y21_N8
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (\U_MIN_BIN|count\(5) & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & VCC))) # 
-- (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((\U_MIN_BIN|count\(5) & !\U_BIN2BCD_MIN|LessThan0~0_combout\)))))
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\U_MIN_BIN|count\(5) & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100000010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(5),
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X11_Y21_N10
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X11_Y21_N12
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\);

-- Location: LCCOMB_X11_Y21_N26
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\ = (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_BIN|count\(4) & \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datac => \U_MIN_BIN|count\(4),
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\);

-- Location: LCCOMB_X11_Y21_N2
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_BIN|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => \U_MIN_BIN|count\(3),
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\);

-- Location: LCCOMB_X11_Y21_N16
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\);

-- Location: LCCOMB_X11_Y21_N20
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & \U_MIN_BIN|count\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datac => \U_MIN_BIN|count\(2),
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X11_Y21_N24
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\ = (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\);

-- Location: LCCOMB_X11_Y21_N22
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\ = (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & (\U_MIN_BIN|count\(2) & \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datac => \U_MIN_BIN|count\(2),
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\);

-- Location: LCCOMB_X10_Y21_N12
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\) # (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\)))
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\) # (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~13_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X10_Y21_N14
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\) # 
-- (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\)))) # (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ & 
-- (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\)))
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\ & (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\ & 
-- !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~11_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X10_Y21_N16
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\) # 
-- (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\)))) # (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\) # 
-- (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\)))))
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\) # 
-- (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~9_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X11_Y21_N0
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\);

-- Location: LCCOMB_X11_Y21_N14
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ = (\U_MIN_BIN|count\(5) & (!\U_BIN2BCD_MIN|LessThan0~0_combout\ & \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MIN_BIN|count\(5),
	datac => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\);

-- Location: LCCOMB_X10_Y21_N18
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\ & (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ & 
-- !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~7_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[18]~6_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X10_Y21_N20
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y21_N30
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\);

-- Location: LCCOMB_X11_Y21_N28
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\) # 
-- ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\);

-- Location: LCCOMB_X11_Y21_N30
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\);

-- Location: LCCOMB_X11_Y21_N18
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\) # 
-- ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[16]~10_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\);

-- Location: LCCOMB_X10_Y21_N10
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\) # 
-- ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[15]~12_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\);

-- Location: LCCOMB_X10_Y21_N28
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\);

-- Location: LCCOMB_X10_Y21_N26
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_MIN_BIN|count\(1) & !\U_BIN2BCD_MIN|LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_MIN_BIN|count\(1),
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\);

-- Location: LCCOMB_X10_Y21_N22
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_MIN_BIN|count\(1) & !\U_BIN2BCD_MIN|LessThan0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MIN_BIN|count\(1),
	datad => \U_BIN2BCD_MIN|LessThan0~0_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X10_Y21_N24
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\);

-- Location: LCCOMB_X10_Y21_N0
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\) # (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~17_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[20]~18_combout\,
	datad => VCC,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X10_Y21_N2
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\ & (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\ & 
-- !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~21_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[21]~16_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X10_Y21_N4
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & 
-- ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\) # (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~15_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[22]~20_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X10_Y21_N6
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\ & (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\ & 
-- !\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~14_combout\,
	datab => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|StageOut[23]~19_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X10_Y21_N8
\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y17_N18
\U_MUX_DISP3|y[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP3|y[0]~0_combout\ = (\U_TRIGGER|temp~q\ & (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)) # (!\U_TRIGGER|temp~q\ & 
-- ((\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_MUX_DISP3|y[0]~0_combout\);

-- Location: LCCOMB_X10_Y17_N12
\U_MUX_DISP3|y[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP3|y[1]~1_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # (!\U_TRIGGER|temp~q\ & 
-- (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_MUX_DISP3|y[1]~1_combout\);

-- Location: LCCOMB_X10_Y17_N30
\U_MUX_DISP3|y[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP3|y[2]~2_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # (!\U_TRIGGER|temp~q\ & 
-- (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_MUX_DISP3|y[2]~2_combout\);

-- Location: IOIBUF_X11_Y0_N15
\key_hour~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key_hour,
	o => \key_hour~input_o\);

-- Location: LCCOMB_X13_Y14_N24
\U_SW_HOUR|s1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SW_HOUR|s1~combout\ = (\key_hour~input_o\ & !\U_TRIGGER|temp~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \key_hour~input_o\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_SW_HOUR|s1~combout\);

-- Location: LCCOMB_X11_Y14_N0
\U_MIN_BIN|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MIN_BIN|Equal0~1_combout\ = (\U_MIN_BIN|count\(1) & (\U_MIN_BIN|Equal0~0_combout\ & !\U_MIN_BIN|count\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MIN_BIN|count\(1),
	datac => \U_MIN_BIN|Equal0~0_combout\,
	datad => \U_MIN_BIN|count\(2),
	combout => \U_MIN_BIN|Equal0~1_combout\);

-- Location: LCCOMB_X11_Y14_N18
\U_MUX_HOUR|y\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_HOUR|y~combout\ = LCELL((\U_SW_HOUR|s1~combout\ & (\U_DIVER|m_clk1~q\)) # (!\U_SW_HOUR|s1~combout\ & ((\U_MIN_BIN|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SW_HOUR|s1~combout\,
	datac => \U_DIVER|m_clk1~q\,
	datad => \U_MIN_BIN|Equal0~1_combout\,
	combout => \U_MUX_HOUR|y~combout\);

-- Location: CLKCTRL_G1
\U_MUX_HOUR|y~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \U_MUX_HOUR|y~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \U_MUX_HOUR|y~clkctrl_outclk\);

-- Location: LCCOMB_X9_Y19_N20
\U_HOUR_BIN|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|Add0~0_combout\ = \U_HOUR_BIN|count\(0) $ (VCC)
-- \U_HOUR_BIN|Add0~1\ = CARRY(\U_HOUR_BIN|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_BIN|count\(0),
	datad => VCC,
	combout => \U_HOUR_BIN|Add0~0_combout\,
	cout => \U_HOUR_BIN|Add0~1\);

-- Location: FF_X9_Y19_N21
\U_HOUR_BIN|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_HOUR|ALT_INV_y~clkctrl_outclk\,
	d => \U_HOUR_BIN|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_BIN|count\(0));

-- Location: LCCOMB_X9_Y19_N22
\U_HOUR_BIN|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|Add0~2_combout\ = (\U_HOUR_BIN|count\(1) & (!\U_HOUR_BIN|Add0~1\)) # (!\U_HOUR_BIN|count\(1) & ((\U_HOUR_BIN|Add0~1\) # (GND)))
-- \U_HOUR_BIN|Add0~3\ = CARRY((!\U_HOUR_BIN|Add0~1\) # (!\U_HOUR_BIN|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(1),
	datad => VCC,
	cin => \U_HOUR_BIN|Add0~1\,
	combout => \U_HOUR_BIN|Add0~2_combout\,
	cout => \U_HOUR_BIN|Add0~3\);

-- Location: FF_X9_Y19_N23
\U_HOUR_BIN|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_HOUR|ALT_INV_y~clkctrl_outclk\,
	d => \U_HOUR_BIN|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_BIN|count\(1));

-- Location: LCCOMB_X9_Y19_N24
\U_HOUR_BIN|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|Add0~4_combout\ = (\U_HOUR_BIN|count\(2) & (\U_HOUR_BIN|Add0~3\ $ (GND))) # (!\U_HOUR_BIN|count\(2) & (!\U_HOUR_BIN|Add0~3\ & VCC))
-- \U_HOUR_BIN|Add0~5\ = CARRY((\U_HOUR_BIN|count\(2) & !\U_HOUR_BIN|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_BIN|count\(2),
	datad => VCC,
	cin => \U_HOUR_BIN|Add0~3\,
	combout => \U_HOUR_BIN|Add0~4_combout\,
	cout => \U_HOUR_BIN|Add0~5\);

-- Location: FF_X9_Y19_N25
\U_HOUR_BIN|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_HOUR|ALT_INV_y~clkctrl_outclk\,
	d => \U_HOUR_BIN|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_BIN|count\(2));

-- Location: LCCOMB_X9_Y19_N26
\U_HOUR_BIN|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|Add0~6_combout\ = (\U_HOUR_BIN|count\(3) & (!\U_HOUR_BIN|Add0~5\)) # (!\U_HOUR_BIN|count\(3) & ((\U_HOUR_BIN|Add0~5\) # (GND)))
-- \U_HOUR_BIN|Add0~7\ = CARRY((!\U_HOUR_BIN|Add0~5\) # (!\U_HOUR_BIN|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(3),
	datad => VCC,
	cin => \U_HOUR_BIN|Add0~5\,
	combout => \U_HOUR_BIN|Add0~6_combout\,
	cout => \U_HOUR_BIN|Add0~7\);

-- Location: LCCOMB_X9_Y19_N28
\U_HOUR_BIN|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|Add0~8_combout\ = \U_HOUR_BIN|Add0~7\ $ (!\U_HOUR_BIN|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U_HOUR_BIN|count\(4),
	cin => \U_HOUR_BIN|Add0~7\,
	combout => \U_HOUR_BIN|Add0~8_combout\);

-- Location: LCCOMB_X9_Y19_N16
\U_HOUR_BIN|count~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|count~0_combout\ = (\U_HOUR_BIN|Add0~8_combout\ & ((!\U_HOUR_BIN|count\(1)) # (!\U_HOUR_BIN|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|Equal0~0_combout\,
	datab => \U_HOUR_BIN|count\(1),
	datad => \U_HOUR_BIN|Add0~8_combout\,
	combout => \U_HOUR_BIN|count~0_combout\);

-- Location: FF_X9_Y19_N17
\U_HOUR_BIN|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_HOUR|ALT_INV_y~clkctrl_outclk\,
	d => \U_HOUR_BIN|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_BIN|count\(4));

-- Location: LCCOMB_X9_Y19_N12
\U_HOUR_BIN|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|Equal0~0_combout\ = (\U_HOUR_BIN|count\(0) & (\U_HOUR_BIN|count\(4) & (\U_HOUR_BIN|count\(2) & !\U_HOUR_BIN|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(0),
	datab => \U_HOUR_BIN|count\(4),
	datac => \U_HOUR_BIN|count\(2),
	datad => \U_HOUR_BIN|count\(3),
	combout => \U_HOUR_BIN|Equal0~0_combout\);

-- Location: LCCOMB_X9_Y19_N10
\U_HOUR_BIN|count~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_BIN|count~1_combout\ = (\U_HOUR_BIN|Add0~6_combout\ & ((!\U_HOUR_BIN|Equal0~0_combout\) # (!\U_HOUR_BIN|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_BIN|count\(1),
	datac => \U_HOUR_BIN|Add0~6_combout\,
	datad => \U_HOUR_BIN|Equal0~0_combout\,
	combout => \U_HOUR_BIN|count~1_combout\);

-- Location: FF_X9_Y19_N11
\U_HOUR_BIN|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_MUX_HOUR|ALT_INV_y~clkctrl_outclk\,
	d => \U_HOUR_BIN|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_BIN|count\(3));

-- Location: LCCOMB_X10_Y19_N6
\U_BIN2BCD_HOUR|LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|LessThan1~0_combout\ = (\U_HOUR_BIN|count\(3) & \U_HOUR_BIN|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(3),
	datac => \U_HOUR_BIN|count\(4),
	combout => \U_BIN2BCD_HOUR|LessThan1~0_combout\);

-- Location: LCCOMB_X9_Y19_N4
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ = (\U_HOUR_BIN|count\(0) & !\U_BIN2BCD_HOUR|LessThan1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_HOUR_BIN|count\(0),
	datad => \U_BIN2BCD_HOUR|LessThan1~0_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\);

-- Location: LCCOMB_X9_Y20_N24
\U_BIN2BCD_HOUR|temp~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|temp~0_combout\ = (!\U_HOUR_BIN|count\(3) & \U_HOUR_BIN|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_HOUR_BIN|count\(3),
	datad => \U_HOUR_BIN|count\(4),
	combout => \U_BIN2BCD_HOUR|temp~0_combout\);

-- Location: LCCOMB_X9_Y20_N28
\U_BIN2BCD_HOUR|temp~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|temp~1_combout\ = (\U_HOUR_BIN|count\(3) & !\U_HOUR_BIN|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_HOUR_BIN|count\(3),
	datad => \U_HOUR_BIN|count\(4),
	combout => \U_BIN2BCD_HOUR|temp~1_combout\);

-- Location: LCCOMB_X8_Y19_N0
\U_BIN2BCD_HOUR|temp~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|temp~2_combout\ = (\U_HOUR_BIN|count\(2) & ((!\U_HOUR_BIN|count\(4)) # (!\U_HOUR_BIN|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_BIN|count\(2),
	datac => \U_HOUR_BIN|count\(3),
	datad => \U_HOUR_BIN|count\(4),
	combout => \U_BIN2BCD_HOUR|temp~2_combout\);

-- Location: LCCOMB_X9_Y20_N2
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = \U_BIN2BCD_HOUR|temp~2_combout\ $ (VCC)
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY(\U_BIN2BCD_HOUR|temp~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|temp~2_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X9_Y20_N4
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_BIN2BCD_HOUR|temp~1_combout\ & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & VCC)) # (!\U_BIN2BCD_HOUR|temp~1_combout\ & 
-- (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_BIN2BCD_HOUR|temp~1_combout\ & !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|temp~1_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X9_Y20_N6
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_BIN2BCD_HOUR|temp~0_combout\ & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ $ (GND))) # (!\U_BIN2BCD_HOUR|temp~0_combout\ & 
-- (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & VCC))
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((\U_BIN2BCD_HOUR|temp~0_combout\ & !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|temp~0_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X9_Y20_N8
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY(!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X9_Y20_N10
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y20_N24
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & 
-- !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\);

-- Location: LCCOMB_X10_Y20_N26
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & 
-- !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\);

-- Location: LCCOMB_X10_Y20_N2
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ = (!\U_HOUR_BIN|count\(3) & (\U_HOUR_BIN|count\(4) & \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(3),
	datac => \U_HOUR_BIN|count\(4),
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\);

-- Location: LCCOMB_X9_Y20_N14
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & 
-- !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\);

-- Location: LCCOMB_X10_Y20_N28
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ = (\U_HOUR_BIN|count\(3) & (!\U_HOUR_BIN|count\(4) & \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(3),
	datac => \U_HOUR_BIN|count\(4),
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\);

-- Location: LCCOMB_X9_Y20_N16
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & 
-- !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\);

-- Location: LCCOMB_X9_Y19_N2
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ = (\U_HOUR_BIN|count\(2) & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((!\U_HOUR_BIN|count\(4)) # (!\U_HOUR_BIN|count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(3),
	datab => \U_HOUR_BIN|count\(4),
	datac => \U_HOUR_BIN|count\(2),
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\);

-- Location: LCCOMB_X9_Y19_N0
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ = (\U_HOUR_BIN|count\(1) & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((!\U_HOUR_BIN|count\(4)) # (!\U_HOUR_BIN|count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_BIN|count\(3),
	datab => \U_HOUR_BIN|count\(4),
	datac => \U_HOUR_BIN|count\(1),
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\);

-- Location: LCCOMB_X9_Y19_N30
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_HOUR_BIN|count\(1) & !\U_BIN2BCD_HOUR|LessThan1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_BIN|count\(1),
	datad => \U_BIN2BCD_HOUR|LessThan1~0_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X9_Y20_N30
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & 
-- !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\);

-- Location: LCCOMB_X10_Y20_N4
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ = (((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\)))
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ = CARRY((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\);

-- Location: LCCOMB_X10_Y20_N6
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\) # 
-- (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\)))) # (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\ & 
-- (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\)))
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ = CARRY((!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\ & (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & 
-- !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\);

-- Location: LCCOMB_X10_Y20_N8
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & (((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\) # 
-- (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\)))) # (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\) # 
-- (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\)))))
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ = CARRY((!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\) # 
-- (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\);

-- Location: LCCOMB_X10_Y20_N10
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ = CARRY((!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\ & (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ & 
-- !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\);

-- Location: LCCOMB_X10_Y20_N12
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ = CARRY((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\) # 
-- (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\,
	cout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\);

-- Location: LCCOMB_X10_Y20_N14
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ = !\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\);

-- Location: LCCOMB_X9_Y19_N8
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (!\U_BIN2BCD_HOUR|LessThan1~0_combout\ & ((\U_HOUR_BIN|count\(0))))) # 
-- (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|LessThan1~0_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	datac => \U_HOUR_BIN|count\(0),
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\);

-- Location: LCCOMB_X10_Y14_N6
\U_HOUR_ALARM|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|Add0~0_combout\ = \U_HOUR_ALARM|count\(0) $ (VCC)
-- \U_HOUR_ALARM|Add0~1\ = CARRY(\U_HOUR_ALARM|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(0),
	datad => VCC,
	combout => \U_HOUR_ALARM|Add0~0_combout\,
	cout => \U_HOUR_ALARM|Add0~1\);

-- Location: LCCOMB_X13_Y14_N6
\U_SW_HOUR|s2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SW_HOUR|s2~combout\ = (\U_TRIGGER|temp~q\ & \key_hour~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_TRIGGER|temp~q\,
	datad => \key_hour~input_o\,
	combout => \U_SW_HOUR|s2~combout\);

-- Location: FF_X10_Y14_N7
\U_HOUR_ALARM|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_HOUR_ALARM|Add0~0_combout\,
	ena => \U_SW_HOUR|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_ALARM|count\(0));

-- Location: LCCOMB_X10_Y14_N8
\U_HOUR_ALARM|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|Add0~2_combout\ = (\U_HOUR_ALARM|count\(1) & (!\U_HOUR_ALARM|Add0~1\)) # (!\U_HOUR_ALARM|count\(1) & ((\U_HOUR_ALARM|Add0~1\) # (GND)))
-- \U_HOUR_ALARM|Add0~3\ = CARRY((!\U_HOUR_ALARM|Add0~1\) # (!\U_HOUR_ALARM|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_ALARM|count\(1),
	datad => VCC,
	cin => \U_HOUR_ALARM|Add0~1\,
	combout => \U_HOUR_ALARM|Add0~2_combout\,
	cout => \U_HOUR_ALARM|Add0~3\);

-- Location: FF_X10_Y14_N9
\U_HOUR_ALARM|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_HOUR_ALARM|Add0~2_combout\,
	ena => \U_SW_HOUR|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_ALARM|count\(1));

-- Location: LCCOMB_X10_Y14_N10
\U_HOUR_ALARM|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|Add0~4_combout\ = (\U_HOUR_ALARM|count\(2) & (\U_HOUR_ALARM|Add0~3\ $ (GND))) # (!\U_HOUR_ALARM|count\(2) & (!\U_HOUR_ALARM|Add0~3\ & VCC))
-- \U_HOUR_ALARM|Add0~5\ = CARRY((\U_HOUR_ALARM|count\(2) & !\U_HOUR_ALARM|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(2),
	datad => VCC,
	cin => \U_HOUR_ALARM|Add0~3\,
	combout => \U_HOUR_ALARM|Add0~4_combout\,
	cout => \U_HOUR_ALARM|Add0~5\);

-- Location: FF_X10_Y14_N11
\U_HOUR_ALARM|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_HOUR_ALARM|Add0~4_combout\,
	ena => \U_SW_HOUR|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_ALARM|count\(2));

-- Location: LCCOMB_X10_Y14_N12
\U_HOUR_ALARM|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|Add0~6_combout\ = (\U_HOUR_ALARM|count\(3) & (!\U_HOUR_ALARM|Add0~5\)) # (!\U_HOUR_ALARM|count\(3) & ((\U_HOUR_ALARM|Add0~5\) # (GND)))
-- \U_HOUR_ALARM|Add0~7\ = CARRY((!\U_HOUR_ALARM|Add0~5\) # (!\U_HOUR_ALARM|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_ALARM|count\(3),
	datad => VCC,
	cin => \U_HOUR_ALARM|Add0~5\,
	combout => \U_HOUR_ALARM|Add0~6_combout\,
	cout => \U_HOUR_ALARM|Add0~7\);

-- Location: LCCOMB_X10_Y14_N14
\U_HOUR_ALARM|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|Add0~8_combout\ = \U_HOUR_ALARM|Add0~7\ $ (!\U_HOUR_ALARM|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U_HOUR_ALARM|count\(4),
	cin => \U_HOUR_ALARM|Add0~7\,
	combout => \U_HOUR_ALARM|Add0~8_combout\);

-- Location: LCCOMB_X10_Y14_N2
\U_HOUR_ALARM|count~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|count~0_combout\ = (\U_HOUR_ALARM|Add0~8_combout\ & ((!\U_HOUR_ALARM|Equal0~0_combout\) # (!\U_HOUR_ALARM|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(1),
	datac => \U_HOUR_ALARM|Add0~8_combout\,
	datad => \U_HOUR_ALARM|Equal0~0_combout\,
	combout => \U_HOUR_ALARM|count~0_combout\);

-- Location: FF_X10_Y14_N3
\U_HOUR_ALARM|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_HOUR_ALARM|count~0_combout\,
	ena => \U_SW_HOUR|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_ALARM|count\(4));

-- Location: LCCOMB_X10_Y14_N24
\U_HOUR_ALARM|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|Equal0~0_combout\ = (\U_HOUR_ALARM|count\(2) & (!\U_HOUR_ALARM|count\(3) & (\U_HOUR_ALARM|count\(0) & \U_HOUR_ALARM|count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(2),
	datab => \U_HOUR_ALARM|count\(3),
	datac => \U_HOUR_ALARM|count\(0),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_HOUR_ALARM|Equal0~0_combout\);

-- Location: LCCOMB_X10_Y14_N28
\U_HOUR_ALARM|count~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_HOUR_ALARM|count~1_combout\ = (\U_HOUR_ALARM|Add0~6_combout\ & ((!\U_HOUR_ALARM|Equal0~0_combout\) # (!\U_HOUR_ALARM|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(1),
	datab => \U_HOUR_ALARM|Equal0~0_combout\,
	datad => \U_HOUR_ALARM|Add0~6_combout\,
	combout => \U_HOUR_ALARM|count~1_combout\);

-- Location: FF_X10_Y14_N29
\U_HOUR_ALARM|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_DIVER|ALT_INV_m_clk1~clkctrl_outclk\,
	d => \U_HOUR_ALARM|count~1_combout\,
	ena => \U_SW_HOUR|s2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_HOUR_ALARM|count\(3));

-- Location: LCCOMB_X10_Y15_N0
\U_ABIN2BCD_HOUR|temp~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|temp~0_combout\ = (!\U_HOUR_ALARM|count\(3) & \U_HOUR_ALARM|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_HOUR_ALARM|count\(3),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|temp~0_combout\);

-- Location: LCCOMB_X10_Y16_N0
\U_ABIN2BCD_HOUR|temp~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|temp~1_combout\ = (\U_HOUR_ALARM|count\(3) & !\U_HOUR_ALARM|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(3),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|temp~1_combout\);

-- Location: LCCOMB_X17_Y14_N4
\U_ABIN2BCD_HOUR|temp~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|temp~2_combout\ = (\U_HOUR_ALARM|count\(2) & ((!\U_HOUR_ALARM|count\(4)) # (!\U_HOUR_ALARM|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(3),
	datac => \U_HOUR_ALARM|count\(2),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|temp~2_combout\);

-- Location: LCCOMB_X9_Y18_N10
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = \U_ABIN2BCD_HOUR|temp~2_combout\ $ (VCC)
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY(\U_ABIN2BCD_HOUR|temp~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|temp~2_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X9_Y18_N12
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_ABIN2BCD_HOUR|temp~1_combout\ & (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & VCC)) # (!\U_ABIN2BCD_HOUR|temp~1_combout\ & 
-- (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_HOUR|temp~1_combout\ & !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|temp~1_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X9_Y18_N14
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_ABIN2BCD_HOUR|temp~0_combout\ & (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ $ (GND))) # (!\U_ABIN2BCD_HOUR|temp~0_combout\ & 
-- (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & VCC))
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((\U_ABIN2BCD_HOUR|temp~0_combout\ & !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|temp~0_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X9_Y18_N16
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY(!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X9_Y18_N18
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y18_N20
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & 
-- !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\);

-- Location: LCCOMB_X10_Y18_N30
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\ = (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\);

-- Location: LCCOMB_X10_Y18_N28
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\U_HOUR_ALARM|count\(3) & \U_HOUR_ALARM|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_HOUR_ALARM|count\(3),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\);

-- Location: LCCOMB_X10_Y18_N22
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_HOUR_ALARM|count\(3) & !\U_HOUR_ALARM|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_HOUR_ALARM|count\(3),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\);

-- Location: LCCOMB_X9_Y18_N24
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & 
-- !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\);

-- Location: LCCOMB_X10_Y14_N26
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ = (\U_HOUR_ALARM|count\(2) & (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((!\U_HOUR_ALARM|count\(4)) # 
-- (!\U_HOUR_ALARM|count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(2),
	datab => \U_HOUR_ALARM|count\(3),
	datac => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\);

-- Location: LCCOMB_X10_Y18_N16
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\ = (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\);

-- Location: LCCOMB_X10_Y18_N12
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_HOUR_ALARM|count\(1) & ((!\U_HOUR_ALARM|count\(4)) # 
-- (!\U_HOUR_ALARM|count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(3),
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_HOUR_ALARM|count\(1),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\);

-- Location: LCCOMB_X10_Y14_N16
\U_ABIN2BCD_HOUR|LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|LessThan1~0_combout\ = (\U_HOUR_ALARM|count\(3) & \U_HOUR_ALARM|count\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_ALARM|count\(3),
	datad => \U_HOUR_ALARM|count\(4),
	combout => \U_ABIN2BCD_HOUR|LessThan1~0_combout\);

-- Location: LCCOMB_X9_Y17_N0
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_HOUR_ALARM|count\(1) & !\U_ABIN2BCD_HOUR|LessThan1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_HOUR_ALARM|count\(1),
	datad => \U_ABIN2BCD_HOUR|LessThan1~0_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X9_Y18_N6
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & 
-- !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\);

-- Location: LCCOMB_X10_Y18_N0
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ = (((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\)))
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ = CARRY((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\);

-- Location: LCCOMB_X10_Y18_N2
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\) 
-- # (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\)))) # (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ & (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & 
-- (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\)))
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ = CARRY((!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\ & (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\ & 
-- !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\);

-- Location: LCCOMB_X10_Y18_N4
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & (((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) 
-- # (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\)))) # (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\)))))
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ = CARRY((!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\);

-- Location: LCCOMB_X10_Y18_N6
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\ = CARRY((!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\ & (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\ & 
-- !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~9_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[27]~17_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\);

-- Location: LCCOMB_X10_Y18_N8
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\ = CARRY((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\) # 
-- (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[28]~8_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9_cout\,
	cout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\);

-- Location: LCCOMB_X10_Y18_N10
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ = !\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11_cout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\);

-- Location: LCCOMB_X10_Y14_N20
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ = (\U_HOUR_ALARM|count\(0) & !\U_ABIN2BCD_HOUR|LessThan1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_ALARM|count\(0),
	datac => \U_ABIN2BCD_HOUR|LessThan1~0_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\);

-- Location: LCCOMB_X10_Y14_N18
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\U_HOUR_ALARM|count\(0) & (!\U_ABIN2BCD_HOUR|LessThan1~0_combout\))) # 
-- (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datab => \U_HOUR_ALARM|count\(0),
	datac => \U_ABIN2BCD_HOUR|LessThan1~0_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\);

-- Location: LCCOMB_X11_Y20_N8
\U_MUX_DISP4|y[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP4|y[0]~0_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\))) # (!\U_TRIGGER|temp~q\ & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\,
	datac => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_MUX_DISP4|y[0]~0_combout\);

-- Location: LCCOMB_X10_Y20_N20
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # 
-- ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\)))) # (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\);

-- Location: LCCOMB_X10_Y18_N26
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\) # 
-- ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\)))) # (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~20_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	datac => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[24]~12_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\);

-- Location: LCCOMB_X13_Y20_N12
\U_MUX_DISP4|y[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP4|y[1]~1_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\))) # (!\U_TRIGGER|temp~q\ & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\,
	datac => \U_TRIGGER|temp~q\,
	combout => \U_MUX_DISP4|y[1]~1_combout\);

-- Location: LCCOMB_X10_Y18_N24
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\) # 
-- ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\)))) # (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\,
	datac => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\);

-- Location: LCCOMB_X10_Y20_N22
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\) # 
-- ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\)))) # (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~11_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[25]~19_combout\,
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\);

-- Location: LCCOMB_X13_Y20_N26
\U_MUX_DISP4|y[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP4|y[2]~2_combout\ = (\U_TRIGGER|temp~q\ & (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\)) # (!\U_TRIGGER|temp~q\ & ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\,
	datac => \U_TRIGGER|temp~q\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\,
	combout => \U_MUX_DISP4|y[2]~2_combout\);

-- Location: LCCOMB_X10_Y20_N0
\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\) # 
-- ((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\)))) # (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	combout => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\);

-- Location: LCCOMB_X10_Y18_N18
\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\) # 
-- ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\)))) # (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~18_combout\,
	datab => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[26]~10_combout\,
	datac => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\);

-- Location: LCCOMB_X13_Y20_N8
\U_MUX_DISP4|y[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP4|y[3]~3_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\))) # (!\U_TRIGGER|temp~q\ & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\,
	combout => \U_MUX_DISP4|y[3]~3_combout\);

-- Location: LCCOMB_X8_Y19_N4
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = \U_BIN2BCD_HOUR|temp~2_combout\ $ (VCC)
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY(\U_BIN2BCD_HOUR|temp~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|temp~2_combout\,
	datad => VCC,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X8_Y19_N6
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_BIN2BCD_HOUR|temp~1_combout\ & (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & VCC)) # (!\U_BIN2BCD_HOUR|temp~1_combout\ & 
-- (!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_BIN2BCD_HOUR|temp~1_combout\ & !\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|temp~1_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X8_Y19_N8
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_BIN2BCD_HOUR|temp~0_combout\ & (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ $ (GND))) # (!\U_BIN2BCD_HOUR|temp~0_combout\ & 
-- (!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & VCC))
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((\U_BIN2BCD_HOUR|temp~0_combout\ & !\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|temp~0_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X8_Y19_N10
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY(!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X8_Y19_N12
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X8_Y19_N14
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\ = (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & 
-- !\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\);

-- Location: LCCOMB_X8_Y19_N28
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\ = (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\U_HOUR_BIN|count\(3) & \U_HOUR_BIN|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_HOUR_BIN|count\(3),
	datad => \U_HOUR_BIN|count\(4),
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\);

-- Location: LCCOMB_X8_Y19_N30
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\ = (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & 
-- !\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\);

-- Location: LCCOMB_X8_Y19_N2
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\ = (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_HOUR_BIN|count\(3) & !\U_HOUR_BIN|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \U_HOUR_BIN|count\(3),
	datad => \U_HOUR_BIN|count\(4),
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\);

-- Location: LCCOMB_X8_Y19_N26
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ = (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & 
-- !\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\);

-- Location: LCCOMB_X9_Y19_N18
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\ = (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_HOUR_BIN|count\(2) & ((!\U_HOUR_BIN|count\(4)) # (!\U_HOUR_BIN|count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_HOUR_BIN|count\(3),
	datac => \U_HOUR_BIN|count\(2),
	datad => \U_HOUR_BIN|count\(4),
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\);

-- Location: LCCOMB_X10_Y19_N4
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_HOUR_BIN|count\(1) & !\U_BIN2BCD_HOUR|LessThan1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_HOUR_BIN|count\(1),
	datad => \U_BIN2BCD_HOUR|LessThan1~0_combout\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X9_Y19_N6
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\ = (!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\);

-- Location: LCCOMB_X9_Y19_N14
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\ = (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_HOUR_BIN|count\(1) & ((!\U_HOUR_BIN|count\(3)) # (!\U_HOUR_BIN|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_HOUR_BIN|count\(4),
	datac => \U_HOUR_BIN|count\(3),
	datad => \U_HOUR_BIN|count\(1),
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\);

-- Location: LCCOMB_X8_Y19_N16
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\) # (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\,
	datad => VCC,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X8_Y19_N18
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ & (!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\ & 
-- !\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X8_Y19_N20
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & 
-- ((\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\) # (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X8_Y19_N22
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\ & (!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\ & 
-- !\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\,
	datad => VCC,
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X8_Y19_N24
\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y15_N16
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = \U_ABIN2BCD_HOUR|temp~2_combout\ $ (VCC)
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY(\U_ABIN2BCD_HOUR|temp~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|temp~2_combout\,
	datad => VCC,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X10_Y15_N18
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\U_ABIN2BCD_HOUR|temp~1_combout\ & (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & VCC)) # (!\U_ABIN2BCD_HOUR|temp~1_combout\ & 
-- (!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\U_ABIN2BCD_HOUR|temp~1_combout\ & !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|temp~1_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X10_Y15_N20
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\U_ABIN2BCD_HOUR|temp~0_combout\ & (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ $ (GND))) # (!\U_ABIN2BCD_HOUR|temp~0_combout\ & 
-- (!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & VCC))
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((\U_ABIN2BCD_HOUR|temp~0_combout\ & !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|temp~0_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X10_Y15_N22
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY(!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X10_Y15_N24
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y15_N30
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\ = (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & 
-- !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\);

-- Location: LCCOMB_X10_Y15_N4
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\ = (\U_HOUR_ALARM|count\(4) & (!\U_HOUR_ALARM|count\(3) & \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(4),
	datac => \U_HOUR_ALARM|count\(3),
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\);

-- Location: LCCOMB_X10_Y15_N2
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\ = (!\U_HOUR_ALARM|count\(4) & (\U_HOUR_ALARM|count\(3) & \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(4),
	datac => \U_HOUR_ALARM|count\(3),
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\);

-- Location: LCCOMB_X10_Y15_N28
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\ = (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & 
-- !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\);

-- Location: LCCOMB_X10_Y15_N26
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ = (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & 
-- !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\);

-- Location: LCCOMB_X10_Y14_N0
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\ = (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_HOUR_ALARM|count\(2) & ((!\U_HOUR_ALARM|count\(3)) # 
-- (!\U_HOUR_ALARM|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(4),
	datab => \U_HOUR_ALARM|count\(3),
	datac => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_HOUR_ALARM|count\(2),
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\);

-- Location: LCCOMB_X9_Y17_N10
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ = (\U_HOUR_ALARM|count\(1) & !\U_ABIN2BCD_HOUR|LessThan1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_HOUR_ALARM|count\(1),
	datad => \U_ABIN2BCD_HOUR|LessThan1~0_combout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\);

-- Location: LCCOMB_X9_Y17_N12
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\ = (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\ & 
-- !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~10_combout\,
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\);

-- Location: LCCOMB_X10_Y14_N30
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\ = (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_HOUR_ALARM|count\(1) & ((!\U_HOUR_ALARM|count\(3)) # 
-- (!\U_HOUR_ALARM|count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_HOUR_ALARM|count\(4),
	datab => \U_HOUR_ALARM|count\(3),
	datac => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_HOUR_ALARM|count\(1),
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\);

-- Location: LCCOMB_X10_Y15_N6
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\) # (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~11_combout\,
	datab => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[20]~15_combout\,
	datad => VCC,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X10_Y15_N8
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ & (!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\ 
-- & !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~10_combout\,
	datab => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[21]~14_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X10_Y15_N10
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & 
-- ((\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\) # (\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~13_combout\,
	datab => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[22]~9_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X10_Y15_N12
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\ & (!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\ & 
-- !\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~8_combout\,
	datab => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|StageOut[23]~12_combout\,
	datad => VCC,
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X10_Y15_N14
\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X9_Y17_N6
\U_MUX_DISP5|y[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP5|y[0]~0_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\U_TRIGGER|temp~q\ & 
-- (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_MUX_DISP5|y[0]~0_combout\);

-- Location: LCCOMB_X9_Y17_N24
\U_MUX_DISP5|y[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MUX_DISP5|y[1]~1_combout\ = (\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # (!\U_TRIGGER|temp~q\ & 
-- (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_TRIGGER|temp~q\,
	datac => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_MUX_DISP5|y[1]~1_combout\);

-- Location: LCCOMB_X9_Y17_N22
\U_ALARM|speak~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~2_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ (!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # 
-- (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ (!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \U_ALARM|speak~2_combout\);

-- Location: LCCOMB_X9_Y17_N8
\U_ALARM|speak~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~3_combout\ = (\U_ALARM|speak~2_combout\ & (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ (!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ALARM|speak~2_combout\,
	datac => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ALARM|speak~3_combout\);

-- Location: LCCOMB_X10_Y17_N24
\U_ALARM|speak~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~1_combout\ = (\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # 
-- (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- (\U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ (!\U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \U_BIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_ABIN2BCD_MIN|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \U_ALARM|speak~1_combout\);

-- Location: LCCOMB_X11_Y20_N14
\U_ALARM|speak~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~4_combout\ = (\U_ALARM|speak~3_combout\ & (\U_ALARM|speak~1_combout\ & (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\ $ (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\,
	datab => \U_ALARM|speak~3_combout\,
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[30]~13_combout\,
	datad => \U_ALARM|speak~1_combout\,
	combout => \U_ALARM|speak~4_combout\);

-- Location: LCCOMB_X12_Y20_N20
\U_ALARM|speak~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~0_combout\ = (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ & (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ & 
-- (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\ $ (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\)))) # (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ & 
-- (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\ & (\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\ $ (!\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\,
	datab => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[33]~25_combout\,
	datad => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[32]~24_combout\,
	combout => \U_ALARM|speak~0_combout\);

-- Location: LCCOMB_X13_Y20_N22
\U_ALARM|speak~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~5_combout\ = (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ & (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ & 
-- (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\ $ (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\)))) # (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ & 
-- (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\ & (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\ $ (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\,
	datac => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[31]~14_combout\,
	datad => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[30]~22_combout\,
	combout => \U_ALARM|speak~5_combout\);

-- Location: LCCOMB_X13_Y20_N20
\U_ALARM|speak~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~6_combout\ = (\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ & 
-- (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\ $ (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\)))) # (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ & 
-- (!\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\ & (\U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\ $ (!\U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\,
	datab => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[32]~15_combout\,
	datac => \U_BIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\,
	datad => \U_ABIN2BCD_HOUR|Mod0|auto_generated|divider|divider|StageOut[33]~16_combout\,
	combout => \U_ALARM|speak~6_combout\);

-- Location: LCCOMB_X13_Y20_N6
\U_ALARM|speak~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~7_combout\ = (\U_ALARM|speak~5_combout\ & (\U_ALARM|speak~6_combout\ & (\U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\ $ (!\U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ALARM|speak~5_combout\,
	datab => \U_BIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\,
	datac => \U_ABIN2BCD_MIN|Mod0|auto_generated|divider|divider|StageOut[31]~23_combout\,
	datad => \U_ALARM|speak~6_combout\,
	combout => \U_ALARM|speak~7_combout\);

-- Location: LCCOMB_X12_Y20_N10
\U_ALARM|speak~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_ALARM|speak~8_combout\ = (\U_ALARM|speak~4_combout\ & (\U_ALARM|speak~0_combout\ & \U_ALARM|speak~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ALARM|speak~4_combout\,
	datab => \U_ALARM|speak~0_combout\,
	datad => \U_ALARM|speak~7_combout\,
	combout => \U_ALARM|speak~8_combout\);

-- Location: LCCOMB_X10_Y17_N22
\U_BAOSHI|speak~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BAOSHI|speak~0_combout\ = (\U_MUX_DISP1|y[1]~1_combout\ & (!\U_MUX_DISP1|y[0]~0_combout\ & (\U_MUX_DISP3|y[1]~1_combout\ & !\U_MUX_DISP3|y[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP1|y[1]~1_combout\,
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP3|y[1]~1_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_BAOSHI|speak~0_combout\);

-- Location: LCCOMB_X10_Y17_N4
\U_BAOSHI|speak~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BAOSHI|speak~1_combout\ = (!\U_MUX_DISP3|y[2]~2_combout\ & (\U_BAOSHI|speak~0_combout\ & !\U_MUX_DISP1|y[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[2]~2_combout\,
	datac => \U_BAOSHI|speak~0_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_BAOSHI|speak~1_combout\);

-- Location: LCCOMB_X12_Y12_N18
\U_BAOSHI|speak~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BAOSHI|speak~2_combout\ = (\U_BAOSHI|speak~1_combout\ & (\U_MUX_DISP0|y[0]~5_combout\ & (!\U_MUX_DISP2|y[1]~1_combout\ & \U_MUX_DISP2|y[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BAOSHI|speak~1_combout\,
	datab => \U_MUX_DISP0|y[0]~5_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_BAOSHI|speak~2_combout\);

-- Location: LCCOMB_X12_Y12_N12
\U_BAOSHI|speak~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_BAOSHI|speak~3_combout\ = (\U_BAOSHI|speak~2_combout\ & (\U_MUX_DISP0|y[3]~17_combout\ $ (((\U_MUX_DISP0|y[2]~14_combout\) # (\U_MUX_DISP0|y[1]~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[2]~14_combout\,
	datab => \U_MUX_DISP0|y[3]~17_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_BAOSHI|speak~2_combout\,
	combout => \U_BAOSHI|speak~3_combout\);

-- Location: LCCOMB_X12_Y20_N4
\speak~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \speak~0_combout\ = (\U_ALARM|speak~8_combout\) # ((\U_BAOSHI|speak~3_combout\ & (\U_MUX_DISP2|y[3]~3_combout\ & !\U_MUX_DISP2|y[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_ALARM|speak~8_combout\,
	datab => \U_BAOSHI|speak~3_combout\,
	datac => \U_MUX_DISP2|y[3]~3_combout\,
	datad => \U_MUX_DISP2|y[2]~2_combout\,
	combout => \speak~0_combout\);

-- Location: LCCOMB_X4_Y10_N24
\U_SEG_SEC0|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC0|Mux6~0_combout\ = (\U_MUX_DISP0|y[1]~10_combout\ & (\U_MUX_DISP0|y[3]~17_combout\)) # (!\U_MUX_DISP0|y[1]~10_combout\ & (\U_MUX_DISP0|y[2]~14_combout\ $ (((!\U_MUX_DISP0|y[3]~17_combout\ & \U_MUX_DISP0|y[0]~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[3]~17_combout\,
	datab => \U_MUX_DISP0|y[2]~14_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_MUX_DISP0|y[0]~5_combout\,
	combout => \U_SEG_SEC0|Mux6~0_combout\);

-- Location: LCCOMB_X4_Y10_N30
\U_SEG_SEC0|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC0|Mux5~0_combout\ = (\U_MUX_DISP0|y[3]~17_combout\ & ((\U_MUX_DISP0|y[2]~14_combout\) # ((\U_MUX_DISP0|y[1]~10_combout\)))) # (!\U_MUX_DISP0|y[3]~17_combout\ & (\U_MUX_DISP0|y[2]~14_combout\ & (\U_MUX_DISP0|y[1]~10_combout\ $ 
-- (\U_MUX_DISP0|y[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[3]~17_combout\,
	datab => \U_MUX_DISP0|y[2]~14_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_MUX_DISP0|y[0]~5_combout\,
	combout => \U_SEG_SEC0|Mux5~0_combout\);

-- Location: LCCOMB_X4_Y10_N12
\U_SEG_SEC0|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC0|Mux4~0_combout\ = (\U_MUX_DISP0|y[2]~14_combout\ & (\U_MUX_DISP0|y[3]~17_combout\)) # (!\U_MUX_DISP0|y[2]~14_combout\ & (\U_MUX_DISP0|y[1]~10_combout\ & ((\U_MUX_DISP0|y[3]~17_combout\) # (!\U_MUX_DISP0|y[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[3]~17_combout\,
	datab => \U_MUX_DISP0|y[2]~14_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_MUX_DISP0|y[0]~5_combout\,
	combout => \U_SEG_SEC0|Mux4~0_combout\);

-- Location: LCCOMB_X4_Y10_N6
\U_SEG_SEC0|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC0|Mux3~0_combout\ = (\U_MUX_DISP0|y[1]~10_combout\ & ((\U_MUX_DISP0|y[3]~17_combout\) # ((\U_MUX_DISP0|y[2]~14_combout\ & \U_MUX_DISP0|y[0]~5_combout\)))) # (!\U_MUX_DISP0|y[1]~10_combout\ & (\U_MUX_DISP0|y[2]~14_combout\ $ 
-- (((!\U_MUX_DISP0|y[3]~17_combout\ & \U_MUX_DISP0|y[0]~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[3]~17_combout\,
	datab => \U_MUX_DISP0|y[2]~14_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_MUX_DISP0|y[0]~5_combout\,
	combout => \U_SEG_SEC0|Mux3~0_combout\);

-- Location: LCCOMB_X4_Y10_N8
\U_SEG_SEC0|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC0|Mux2~0_combout\ = (\U_MUX_DISP0|y[0]~5_combout\) # ((\U_MUX_DISP0|y[1]~10_combout\ & (\U_MUX_DISP0|y[3]~17_combout\)) # (!\U_MUX_DISP0|y[1]~10_combout\ & ((\U_MUX_DISP0|y[2]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[3]~17_combout\,
	datab => \U_MUX_DISP0|y[2]~14_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_MUX_DISP0|y[0]~5_combout\,
	combout => \U_SEG_SEC0|Mux2~0_combout\);

-- Location: LCCOMB_X4_Y10_N2
\U_SEG_SEC0|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC0|Mux1~0_combout\ = (\U_MUX_DISP0|y[2]~14_combout\ & ((\U_MUX_DISP0|y[3]~17_combout\) # ((\U_MUX_DISP0|y[1]~10_combout\ & \U_MUX_DISP0|y[0]~5_combout\)))) # (!\U_MUX_DISP0|y[2]~14_combout\ & ((\U_MUX_DISP0|y[1]~10_combout\) # 
-- ((!\U_MUX_DISP0|y[3]~17_combout\ & \U_MUX_DISP0|y[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[3]~17_combout\,
	datab => \U_MUX_DISP0|y[2]~14_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_MUX_DISP0|y[0]~5_combout\,
	combout => \U_SEG_SEC0|Mux1~0_combout\);

-- Location: LCCOMB_X4_Y10_N4
\U_SEG_SEC0|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC0|Mux0~0_combout\ = (\U_MUX_DISP0|y[2]~14_combout\ & (!\U_MUX_DISP0|y[3]~17_combout\ & ((!\U_MUX_DISP0|y[0]~5_combout\) # (!\U_MUX_DISP0|y[1]~10_combout\)))) # (!\U_MUX_DISP0|y[2]~14_combout\ & (\U_MUX_DISP0|y[3]~17_combout\ $ 
-- ((\U_MUX_DISP0|y[1]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP0|y[3]~17_combout\,
	datab => \U_MUX_DISP0|y[2]~14_combout\,
	datac => \U_MUX_DISP0|y[1]~10_combout\,
	datad => \U_MUX_DISP0|y[0]~5_combout\,
	combout => \U_SEG_SEC0|Mux0~0_combout\);

-- Location: LCCOMB_X18_Y1_N8
\U_SEG_SEC1|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC1|Mux6~0_combout\ = (\U_MUX_DISP1|y[0]~0_combout\ $ (!\U_MUX_DISP1|y[2]~2_combout\)) # (!\U_MUX_DISP1|y[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP1|y[1]~1_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_SEG_SEC1|Mux6~0_combout\);

-- Location: LCCOMB_X18_Y1_N30
\U_SEG_SEC1|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC1|Mux5~0_combout\ = (\U_MUX_DISP1|y[2]~2_combout\) # (\U_MUX_DISP1|y[0]~0_combout\ $ (!\U_MUX_DISP1|y[1]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP1|y[1]~1_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_SEG_SEC1|Mux5~0_combout\);

-- Location: LCCOMB_X18_Y1_N28
\U_SEG_SEC1|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC1|Mux4~0_combout\ = (\U_MUX_DISP1|y[0]~0_combout\ & (!\U_MUX_DISP1|y[1]~1_combout\ & \U_MUX_DISP1|y[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP1|y[1]~1_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_SEG_SEC1|Mux4~0_combout\);

-- Location: LCCOMB_X18_Y1_N26
\U_SEG_SEC1|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC1|Mux3~0_combout\ = (\U_MUX_DISP1|y[0]~0_combout\ & (\U_MUX_DISP1|y[1]~1_combout\ & !\U_MUX_DISP1|y[2]~2_combout\)) # (!\U_MUX_DISP1|y[0]~0_combout\ & (\U_MUX_DISP1|y[1]~1_combout\ $ (!\U_MUX_DISP1|y[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP1|y[1]~1_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_SEG_SEC1|Mux3~0_combout\);

-- Location: LCCOMB_X18_Y1_N4
\U_SEG_SEC1|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC1|Mux2~0_combout\ = ((\U_MUX_DISP1|y[1]~1_combout\ & !\U_MUX_DISP1|y[2]~2_combout\)) # (!\U_MUX_DISP1|y[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP1|y[1]~1_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_SEG_SEC1|Mux2~0_combout\);

-- Location: LCCOMB_X18_Y1_N10
\U_SEG_SEC1|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC1|Mux1~0_combout\ = (\U_MUX_DISP1|y[0]~0_combout\ & (!\U_MUX_DISP1|y[1]~1_combout\ & \U_MUX_DISP1|y[2]~2_combout\)) # (!\U_MUX_DISP1|y[0]~0_combout\ & ((\U_MUX_DISP1|y[2]~2_combout\) # (!\U_MUX_DISP1|y[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP1|y[1]~1_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_SEG_SEC1|Mux1~0_combout\);

-- Location: LCCOMB_X18_Y1_N12
\U_SEG_SEC1|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_SEC1|Mux0~0_combout\ = (\U_MUX_DISP1|y[1]~1_combout\ & ((\U_MUX_DISP1|y[2]~2_combout\))) # (!\U_MUX_DISP1|y[1]~1_combout\ & (!\U_MUX_DISP1|y[0]~0_combout\ & !\U_MUX_DISP1|y[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MUX_DISP1|y[0]~0_combout\,
	datac => \U_MUX_DISP1|y[1]~1_combout\,
	datad => \U_MUX_DISP1|y[2]~2_combout\,
	combout => \U_SEG_SEC1|Mux0~0_combout\);

-- Location: LCCOMB_X12_Y20_N2
\U_SEG_MIN0|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN0|Mux6~0_combout\ = (\U_MUX_DISP2|y[1]~1_combout\ & (\U_MUX_DISP2|y[3]~3_combout\)) # (!\U_MUX_DISP2|y[1]~1_combout\ & (\U_MUX_DISP2|y[2]~2_combout\ $ (((!\U_MUX_DISP2|y[3]~3_combout\ & \U_MUX_DISP2|y[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP2|y[3]~3_combout\,
	datab => \U_MUX_DISP2|y[2]~2_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_SEG_MIN0|Mux6~0_combout\);

-- Location: LCCOMB_X12_Y20_N12
\U_SEG_MIN0|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN0|Mux5~0_combout\ = (\U_MUX_DISP2|y[3]~3_combout\ & ((\U_MUX_DISP2|y[2]~2_combout\) # ((\U_MUX_DISP2|y[1]~1_combout\)))) # (!\U_MUX_DISP2|y[3]~3_combout\ & (\U_MUX_DISP2|y[2]~2_combout\ & (\U_MUX_DISP2|y[1]~1_combout\ $ 
-- (\U_MUX_DISP2|y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP2|y[3]~3_combout\,
	datab => \U_MUX_DISP2|y[2]~2_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_SEG_MIN0|Mux5~0_combout\);

-- Location: LCCOMB_X12_Y20_N14
\U_SEG_MIN0|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN0|Mux4~0_combout\ = (\U_MUX_DISP2|y[2]~2_combout\ & (\U_MUX_DISP2|y[3]~3_combout\)) # (!\U_MUX_DISP2|y[2]~2_combout\ & (\U_MUX_DISP2|y[1]~1_combout\ & ((\U_MUX_DISP2|y[3]~3_combout\) # (!\U_MUX_DISP2|y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP2|y[3]~3_combout\,
	datab => \U_MUX_DISP2|y[2]~2_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_SEG_MIN0|Mux4~0_combout\);

-- Location: LCCOMB_X12_Y20_N28
\U_SEG_MIN0|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN0|Mux3~0_combout\ = (\U_MUX_DISP2|y[1]~1_combout\ & ((\U_MUX_DISP2|y[3]~3_combout\) # ((\U_MUX_DISP2|y[2]~2_combout\ & \U_MUX_DISP2|y[0]~0_combout\)))) # (!\U_MUX_DISP2|y[1]~1_combout\ & (\U_MUX_DISP2|y[2]~2_combout\ $ 
-- (((!\U_MUX_DISP2|y[3]~3_combout\ & \U_MUX_DISP2|y[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP2|y[3]~3_combout\,
	datab => \U_MUX_DISP2|y[2]~2_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_SEG_MIN0|Mux3~0_combout\);

-- Location: LCCOMB_X12_Y20_N6
\U_SEG_MIN0|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN0|Mux2~0_combout\ = (\U_MUX_DISP2|y[0]~0_combout\) # ((\U_MUX_DISP2|y[1]~1_combout\ & (\U_MUX_DISP2|y[3]~3_combout\)) # (!\U_MUX_DISP2|y[1]~1_combout\ & ((\U_MUX_DISP2|y[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP2|y[3]~3_combout\,
	datab => \U_MUX_DISP2|y[2]~2_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_SEG_MIN0|Mux2~0_combout\);

-- Location: LCCOMB_X12_Y20_N0
\U_SEG_MIN0|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN0|Mux1~0_combout\ = (\U_MUX_DISP2|y[2]~2_combout\ & ((\U_MUX_DISP2|y[3]~3_combout\) # ((\U_MUX_DISP2|y[1]~1_combout\ & \U_MUX_DISP2|y[0]~0_combout\)))) # (!\U_MUX_DISP2|y[2]~2_combout\ & ((\U_MUX_DISP2|y[1]~1_combout\) # 
-- ((!\U_MUX_DISP2|y[3]~3_combout\ & \U_MUX_DISP2|y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP2|y[3]~3_combout\,
	datab => \U_MUX_DISP2|y[2]~2_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_SEG_MIN0|Mux1~0_combout\);

-- Location: LCCOMB_X12_Y20_N22
\U_SEG_MIN0|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN0|Mux0~0_combout\ = (\U_MUX_DISP2|y[2]~2_combout\ & (!\U_MUX_DISP2|y[3]~3_combout\ & ((!\U_MUX_DISP2|y[0]~0_combout\) # (!\U_MUX_DISP2|y[1]~1_combout\)))) # (!\U_MUX_DISP2|y[2]~2_combout\ & (\U_MUX_DISP2|y[3]~3_combout\ $ 
-- ((\U_MUX_DISP2|y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP2|y[3]~3_combout\,
	datab => \U_MUX_DISP2|y[2]~2_combout\,
	datac => \U_MUX_DISP2|y[1]~1_combout\,
	datad => \U_MUX_DISP2|y[0]~0_combout\,
	combout => \U_SEG_MIN0|Mux0~0_combout\);

-- Location: LCCOMB_X10_Y17_N14
\U_SEG_MIN1|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN1|Mux6~0_combout\ = (\U_MUX_DISP3|y[2]~2_combout\ $ (!\U_MUX_DISP3|y[0]~0_combout\)) # (!\U_MUX_DISP3|y[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[1]~1_combout\,
	datac => \U_MUX_DISP3|y[2]~2_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_SEG_MIN1|Mux6~0_combout\);

-- Location: LCCOMB_X10_Y17_N20
\U_SEG_MIN1|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN1|Mux5~0_combout\ = (\U_MUX_DISP3|y[2]~2_combout\) # (\U_MUX_DISP3|y[1]~1_combout\ $ (!\U_MUX_DISP3|y[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[1]~1_combout\,
	datac => \U_MUX_DISP3|y[2]~2_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_SEG_MIN1|Mux5~0_combout\);

-- Location: LCCOMB_X10_Y17_N26
\U_SEG_MIN1|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN1|Mux4~0_combout\ = (!\U_MUX_DISP3|y[1]~1_combout\ & (\U_MUX_DISP3|y[2]~2_combout\ & \U_MUX_DISP3|y[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[1]~1_combout\,
	datac => \U_MUX_DISP3|y[2]~2_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_SEG_MIN1|Mux4~0_combout\);

-- Location: LCCOMB_X10_Y17_N16
\U_SEG_MIN1|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN1|Mux3~0_combout\ = (\U_MUX_DISP3|y[1]~1_combout\ & (\U_MUX_DISP3|y[2]~2_combout\ $ (\U_MUX_DISP3|y[0]~0_combout\))) # (!\U_MUX_DISP3|y[1]~1_combout\ & (!\U_MUX_DISP3|y[2]~2_combout\ & !\U_MUX_DISP3|y[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[1]~1_combout\,
	datac => \U_MUX_DISP3|y[2]~2_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_SEG_MIN1|Mux3~0_combout\);

-- Location: LCCOMB_X10_Y17_N6
\U_SEG_MIN1|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN1|Mux2~0_combout\ = ((\U_MUX_DISP3|y[1]~1_combout\ & !\U_MUX_DISP3|y[2]~2_combout\)) # (!\U_MUX_DISP3|y[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[1]~1_combout\,
	datac => \U_MUX_DISP3|y[2]~2_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_SEG_MIN1|Mux2~0_combout\);

-- Location: LCCOMB_X10_Y17_N8
\U_SEG_MIN1|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN1|Mux1~0_combout\ = (\U_MUX_DISP3|y[1]~1_combout\ & (\U_MUX_DISP3|y[2]~2_combout\ & !\U_MUX_DISP3|y[0]~0_combout\)) # (!\U_MUX_DISP3|y[1]~1_combout\ & ((\U_MUX_DISP3|y[2]~2_combout\) # (!\U_MUX_DISP3|y[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[1]~1_combout\,
	datac => \U_MUX_DISP3|y[2]~2_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_SEG_MIN1|Mux1~0_combout\);

-- Location: LCCOMB_X10_Y17_N2
\U_SEG_MIN1|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_MIN1|Mux0~0_combout\ = (\U_MUX_DISP3|y[1]~1_combout\ & (\U_MUX_DISP3|y[2]~2_combout\)) # (!\U_MUX_DISP3|y[1]~1_combout\ & (!\U_MUX_DISP3|y[2]~2_combout\ & !\U_MUX_DISP3|y[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP3|y[1]~1_combout\,
	datac => \U_MUX_DISP3|y[2]~2_combout\,
	datad => \U_MUX_DISP3|y[0]~0_combout\,
	combout => \U_SEG_MIN1|Mux0~0_combout\);

-- Location: LCCOMB_X13_Y20_N16
\U_SEG_HOUR0|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR0|Mux6~0_combout\ = (\U_MUX_DISP4|y[1]~1_combout\ & (((\U_MUX_DISP4|y[3]~3_combout\)))) # (!\U_MUX_DISP4|y[1]~1_combout\ & (\U_MUX_DISP4|y[2]~2_combout\ $ (((!\U_MUX_DISP4|y[3]~3_combout\ & \U_MUX_DISP4|y[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP4|y[2]~2_combout\,
	datab => \U_MUX_DISP4|y[3]~3_combout\,
	datac => \U_MUX_DISP4|y[0]~0_combout\,
	datad => \U_MUX_DISP4|y[1]~1_combout\,
	combout => \U_SEG_HOUR0|Mux6~0_combout\);

-- Location: LCCOMB_X13_Y20_N18
\U_SEG_HOUR0|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR0|Mux5~0_combout\ = (\U_MUX_DISP4|y[2]~2_combout\ & ((\U_MUX_DISP4|y[3]~3_combout\) # (\U_MUX_DISP4|y[0]~0_combout\ $ (\U_MUX_DISP4|y[1]~1_combout\)))) # (!\U_MUX_DISP4|y[2]~2_combout\ & (\U_MUX_DISP4|y[3]~3_combout\ & 
-- ((\U_MUX_DISP4|y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP4|y[2]~2_combout\,
	datab => \U_MUX_DISP4|y[3]~3_combout\,
	datac => \U_MUX_DISP4|y[0]~0_combout\,
	datad => \U_MUX_DISP4|y[1]~1_combout\,
	combout => \U_SEG_HOUR0|Mux5~0_combout\);

-- Location: LCCOMB_X13_Y20_N0
\U_SEG_HOUR0|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR0|Mux4~0_combout\ = (\U_MUX_DISP4|y[2]~2_combout\ & (\U_MUX_DISP4|y[3]~3_combout\)) # (!\U_MUX_DISP4|y[2]~2_combout\ & (\U_MUX_DISP4|y[1]~1_combout\ & ((\U_MUX_DISP4|y[3]~3_combout\) # (!\U_MUX_DISP4|y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP4|y[2]~2_combout\,
	datab => \U_MUX_DISP4|y[3]~3_combout\,
	datac => \U_MUX_DISP4|y[0]~0_combout\,
	datad => \U_MUX_DISP4|y[1]~1_combout\,
	combout => \U_SEG_HOUR0|Mux4~0_combout\);

-- Location: LCCOMB_X13_Y20_N10
\U_SEG_HOUR0|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR0|Mux3~0_combout\ = (\U_MUX_DISP4|y[1]~1_combout\ & ((\U_MUX_DISP4|y[3]~3_combout\) # ((\U_MUX_DISP4|y[2]~2_combout\ & \U_MUX_DISP4|y[0]~0_combout\)))) # (!\U_MUX_DISP4|y[1]~1_combout\ & (\U_MUX_DISP4|y[2]~2_combout\ $ 
-- (((!\U_MUX_DISP4|y[3]~3_combout\ & \U_MUX_DISP4|y[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP4|y[2]~2_combout\,
	datab => \U_MUX_DISP4|y[3]~3_combout\,
	datac => \U_MUX_DISP4|y[0]~0_combout\,
	datad => \U_MUX_DISP4|y[1]~1_combout\,
	combout => \U_SEG_HOUR0|Mux3~0_combout\);

-- Location: LCCOMB_X13_Y20_N28
\U_SEG_HOUR0|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR0|Mux2~0_combout\ = (\U_MUX_DISP4|y[0]~0_combout\) # ((\U_MUX_DISP4|y[1]~1_combout\ & ((\U_MUX_DISP4|y[3]~3_combout\))) # (!\U_MUX_DISP4|y[1]~1_combout\ & (\U_MUX_DISP4|y[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP4|y[2]~2_combout\,
	datab => \U_MUX_DISP4|y[3]~3_combout\,
	datac => \U_MUX_DISP4|y[0]~0_combout\,
	datad => \U_MUX_DISP4|y[1]~1_combout\,
	combout => \U_SEG_HOUR0|Mux2~0_combout\);

-- Location: LCCOMB_X13_Y20_N2
\U_SEG_HOUR0|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR0|Mux1~0_combout\ = (\U_MUX_DISP4|y[2]~2_combout\ & ((\U_MUX_DISP4|y[3]~3_combout\) # ((\U_MUX_DISP4|y[0]~0_combout\ & \U_MUX_DISP4|y[1]~1_combout\)))) # (!\U_MUX_DISP4|y[2]~2_combout\ & ((\U_MUX_DISP4|y[1]~1_combout\) # 
-- ((!\U_MUX_DISP4|y[3]~3_combout\ & \U_MUX_DISP4|y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP4|y[2]~2_combout\,
	datab => \U_MUX_DISP4|y[3]~3_combout\,
	datac => \U_MUX_DISP4|y[0]~0_combout\,
	datad => \U_MUX_DISP4|y[1]~1_combout\,
	combout => \U_SEG_HOUR0|Mux1~0_combout\);

-- Location: LCCOMB_X13_Y20_N4
\U_SEG_HOUR0|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR0|Mux0~0_combout\ = (\U_MUX_DISP4|y[2]~2_combout\ & (!\U_MUX_DISP4|y[3]~3_combout\ & ((!\U_MUX_DISP4|y[1]~1_combout\) # (!\U_MUX_DISP4|y[0]~0_combout\)))) # (!\U_MUX_DISP4|y[2]~2_combout\ & (\U_MUX_DISP4|y[3]~3_combout\ $ 
-- (((\U_MUX_DISP4|y[1]~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP4|y[2]~2_combout\,
	datab => \U_MUX_DISP4|y[3]~3_combout\,
	datac => \U_MUX_DISP4|y[0]~0_combout\,
	datad => \U_MUX_DISP4|y[1]~1_combout\,
	combout => \U_SEG_HOUR0|Mux0~0_combout\);

-- Location: LCCOMB_X9_Y17_N26
\U_SEG_HOUR1|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR1|Mux6~0_combout\ = ((\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\U_TRIGGER|temp~q\ & 
-- (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\U_MUX_DISP5|y[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP5|y[1]~1_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_SEG_HOUR1|Mux6~0_combout\);

-- Location: LCCOMB_X9_Y17_N28
\U_SEG_HOUR1|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR1|Mux4~0_combout\ = (!\U_MUX_DISP5|y[1]~1_combout\ & ((\U_TRIGGER|temp~q\ & ((\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\U_TRIGGER|temp~q\ & 
-- (\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP5|y[1]~1_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_SEG_HOUR1|Mux4~0_combout\);

-- Location: LCCOMB_X9_Y17_N2
\U_SEG_HOUR1|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_SEG_HOUR1|Mux1~0_combout\ = ((\U_TRIGGER|temp~q\ & ((!\U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\U_TRIGGER|temp~q\ & 
-- (!\U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\U_MUX_DISP5|y[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MUX_DISP5|y[1]~1_combout\,
	datab => \U_BIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \U_ABIN2BCD_HOUR|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \U_TRIGGER|temp~q\,
	combout => \U_SEG_HOUR1|Mux1~0_combout\);

ww_sec0(0) <= \sec0[0]~output_o\;

ww_sec0(1) <= \sec0[1]~output_o\;

ww_sec0(2) <= \sec0[2]~output_o\;

ww_sec0(3) <= \sec0[3]~output_o\;

ww_sec1(0) <= \sec1[0]~output_o\;

ww_sec1(1) <= \sec1[1]~output_o\;

ww_sec1(2) <= \sec1[2]~output_o\;

ww_sec1(3) <= \sec1[3]~output_o\;

ww_min0(0) <= \min0[0]~output_o\;

ww_min0(1) <= \min0[1]~output_o\;

ww_min0(2) <= \min0[2]~output_o\;

ww_min0(3) <= \min0[3]~output_o\;

ww_min1(0) <= \min1[0]~output_o\;

ww_min1(1) <= \min1[1]~output_o\;

ww_min1(2) <= \min1[2]~output_o\;

ww_min1(3) <= \min1[3]~output_o\;

ww_hour0(0) <= \hour0[0]~output_o\;

ww_hour0(1) <= \hour0[1]~output_o\;

ww_hour0(2) <= \hour0[2]~output_o\;

ww_hour0(3) <= \hour0[3]~output_o\;

ww_hour1(0) <= \hour1[0]~output_o\;

ww_hour1(1) <= \hour1[1]~output_o\;

ww_hour1(2) <= \hour1[2]~output_o\;

ww_hour1(3) <= \hour1[3]~output_o\;

ww_speak <= \speak~output_o\;

ww_seg_sec0(0) <= \seg_sec0[0]~output_o\;

ww_seg_sec0(1) <= \seg_sec0[1]~output_o\;

ww_seg_sec0(2) <= \seg_sec0[2]~output_o\;

ww_seg_sec0(3) <= \seg_sec0[3]~output_o\;

ww_seg_sec0(4) <= \seg_sec0[4]~output_o\;

ww_seg_sec0(5) <= \seg_sec0[5]~output_o\;

ww_seg_sec0(6) <= \seg_sec0[6]~output_o\;

ww_seg_sec1(0) <= \seg_sec1[0]~output_o\;

ww_seg_sec1(1) <= \seg_sec1[1]~output_o\;

ww_seg_sec1(2) <= \seg_sec1[2]~output_o\;

ww_seg_sec1(3) <= \seg_sec1[3]~output_o\;

ww_seg_sec1(4) <= \seg_sec1[4]~output_o\;

ww_seg_sec1(5) <= \seg_sec1[5]~output_o\;

ww_seg_sec1(6) <= \seg_sec1[6]~output_o\;

ww_seg_min0(0) <= \seg_min0[0]~output_o\;

ww_seg_min0(1) <= \seg_min0[1]~output_o\;

ww_seg_min0(2) <= \seg_min0[2]~output_o\;

ww_seg_min0(3) <= \seg_min0[3]~output_o\;

ww_seg_min0(4) <= \seg_min0[4]~output_o\;

ww_seg_min0(5) <= \seg_min0[5]~output_o\;

ww_seg_min0(6) <= \seg_min0[6]~output_o\;

ww_seg_min1(0) <= \seg_min1[0]~output_o\;

ww_seg_min1(1) <= \seg_min1[1]~output_o\;

ww_seg_min1(2) <= \seg_min1[2]~output_o\;

ww_seg_min1(3) <= \seg_min1[3]~output_o\;

ww_seg_min1(4) <= \seg_min1[4]~output_o\;

ww_seg_min1(5) <= \seg_min1[5]~output_o\;

ww_seg_min1(6) <= \seg_min1[6]~output_o\;

ww_seg_hour0(0) <= \seg_hour0[0]~output_o\;

ww_seg_hour0(1) <= \seg_hour0[1]~output_o\;

ww_seg_hour0(2) <= \seg_hour0[2]~output_o\;

ww_seg_hour0(3) <= \seg_hour0[3]~output_o\;

ww_seg_hour0(4) <= \seg_hour0[4]~output_o\;

ww_seg_hour0(5) <= \seg_hour0[5]~output_o\;

ww_seg_hour0(6) <= \seg_hour0[6]~output_o\;

ww_seg_hour1(0) <= \seg_hour1[0]~output_o\;

ww_seg_hour1(1) <= \seg_hour1[1]~output_o\;

ww_seg_hour1(2) <= \seg_hour1[2]~output_o\;

ww_seg_hour1(3) <= \seg_hour1[3]~output_o\;

ww_seg_hour1(4) <= \seg_hour1[4]~output_o\;

ww_seg_hour1(5) <= \seg_hour1[5]~output_o\;

ww_seg_hour1(6) <= \seg_hour1[6]~output_o\;
END structure;


