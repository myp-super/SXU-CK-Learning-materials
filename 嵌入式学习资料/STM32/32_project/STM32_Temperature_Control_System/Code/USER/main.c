/**
 * STM32温度测控系统 主程序
 * 山西大学 测控技术与仪器专业
 * 前提：Keil5已导入STM32标准外设库（StdPeriph V3.5）
 *       SystemInit()在startup中自动调用，时钟=72MHz
 */
#include "main.h"

volatile uint16_t g_cur_temp  = 0;
volatile int16_t  g_set_temp  = DEFAULT_TEMP * 10;
volatile uint8_t  g_fan_pwm   = 0;
volatile uint8_t  g_heat_pwm  = 0;
volatile SysMode_t g_mode     = MODE_STANDBY;
volatile uint8_t  g_fan_on    = 0;
volatile uint8_t  g_heat_on   = 0;

/* 风扇PWM计算（偏差单位0.1°C） */
static uint8_t CalcFan(int16_t diff)
{
    int16_t ex = diff - HYSTERESIS;
    if (ex <= 10) return diff <= HYSTERESIS ? 0 : PWM_MIN;
    if (ex >= 100) return PWM_MAX;
    return PWM_MIN + (uint8_t)((ex - 10) * (PWM_MAX - PWM_MIN) / 90);
}

/* 加热PWM计算 */
static uint8_t CalcHeat(int16_t diff)
{
    int16_t ex = -diff - HYSTERESIS;
    if (ex <= 10) return -diff <= HYSTERESIS ? 0 : PWM_MIN;
    if (ex >= 100) return PWM_MAX;
    return PWM_MIN + (uint8_t)((ex - 10) * (PWM_MAX - PWM_MIN) / 90);
}

/* 温度控制 */
void Temp_Control(void)
{
    int16_t raw = DS18B20_Get_Temp();
    int16_t diff;
    if (raw == -1000) return;
    g_cur_temp = (uint16_t)raw;
    diff = (int16_t)g_cur_temp - g_set_temp;

    if (diff > HYSTERESIS) {
        g_mode = MODE_COOLING;
        g_heat_pwm = 0; g_heat_on = 0;
        PWM_Heat(0); LED_Heat(0);
        g_fan_pwm = CalcFan(diff); g_fan_on = 1;
        PWM_Fan(g_fan_pwm); LED_Fan(1);
    } else if (diff < -HYSTERESIS) {
        g_mode = MODE_HEATING;
        g_fan_pwm = 0; g_fan_on = 0;
        PWM_Fan(0); LED_Fan(0);
        g_heat_pwm = CalcHeat(diff); g_heat_on = 1;
        PWM_Heat(g_heat_pwm); LED_Heat(1);
    } else {
        g_mode = MODE_STANDBY;
        g_fan_pwm = 0; g_heat_pwm = 0;
        g_fan_on = 0; g_heat_on = 0;
        PWM_Fan(0); PWM_Heat(0);
        LED_Fan(0); LED_Heat(0);
    }
}

/* LCD刷新 */
void LCD_Update(void)
{
    char buf[32];
    uint8_t *ms[] = {(uint8_t*)"HEATING", (uint8_t*)"COOLING", (uint8_t*)"STANDBY"};

    LCD_ShowString(10, 10, 200, 16, BLACK, (uint8_t*)"Cur :");
    sprintf(buf, "%2d.%1d C", (int16_t)g_cur_temp/10, ((int16_t)g_cur_temp%10+10)%10);
    LCD_ShowString(58, 10, 80, 16, BLACK, (uint8_t*)buf);

    LCD_ShowString(10, 35, 200, 16, BLACK, (uint8_t*)"Set :");
    sprintf(buf, "%2d.%1d C", g_set_temp/10, (g_set_temp%10+10)%10);
    LCD_ShowString(58, 35, 80, 16, BLACK, (uint8_t*)buf);

    LCD_ShowString(10, 60, 200, 16, BLACK, (uint8_t*)"Mode:");
    LCD_ShowString(58, 60, 100, 16, BLACK, ms[g_mode]);

    sprintf(buf, "Fan :%s %3d%%", g_fan_on ? "ON " : "OFF", g_fan_pwm);
    LCD_ShowString(10, 85, 200, 16, BLACK, (uint8_t*)buf);

    sprintf(buf, "Heat:%s %3d%%", g_heat_on ? "ON " : "OFF", g_heat_pwm);
    LCD_ShowString(10, 110, 200, 16, BLACK, (uint8_t*)buf);

    sprintf(buf, "Diff:%+2.1f C", ((float)(int16_t)g_cur_temp - g_set_temp) / 10.0f);
    LCD_ShowString(10, 135, 200, 16, BLACK, (uint8_t*)buf);
}

int main(void)
{
    uint8_t key;
    uint32_t t_disp = 0, t_ctrl = 0;

    /* SystemInit() 已在 startup 中调用: HSE→PLL→72MHz */

    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
    delay_init();
    uart_init(115200);
    LED_Init();
    KEY_Init();
    DS18B20_Init();
    LCD_Init();
    PWM_Init();

    LCD_Clear(WHITE);
    LCD_ShowString(30, 60, 200, 16, BLACK, (uint8_t*)"Temp Control System");
    LCD_ShowString(50, 85, 200, 16, BLACK, (uint8_t*)"Shanxi University");
    delay_ms(1500);
    LCD_Clear(WHITE);

    while (1) {
        key = KEY_Scan(0);
        if (key == 1 && g_set_temp < TEMP_MAX * 10) g_set_temp += 10;
        if (key == 2 && g_set_temp > TEMP_MIN * 10) g_set_temp -= 10;

        if (delay_tdiff(t_ctrl) >= 750) {
            t_ctrl = delay_tick();
            Temp_Control();
        }
        if (delay_tdiff(t_disp) >= 500) {
            t_disp = delay_tick();
            LCD_Update();
        }
    }
}
