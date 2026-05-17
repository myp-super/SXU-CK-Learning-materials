#include <reg51.h>


sbit P0_6 = P0^6;    
sbit P1_0 = P1^0;    
sbit P1_1 = P1^1;    
sbit P2_1 = P2^1;    
sbit P3_2 = P3^2;    


unsigned int alarm_time = 0;  
bit alarm_flag = 0;           
bit switch_state = 1;         
bit alarm_triggered = 0;      


void System_Init();           
void Delay_ms(unsigned int ms); 

void main() {
    System_Init();
    
    while(1) {
        
        if (P0_6 == 0 && switch_state == 1 && !alarm_triggered) {
            Delay_ms(20);  
            if (P0_6 == 0) {  
                
                alarm_flag = 1;
                alarm_triggered = 1;  
                alarm_time = 0;       
                P1_0 = 0;     
                P1_1 = 1;     
                P2_1 = 1;     
            }
        }
        switch_state = P0_6;  
        
        
        if (alarm_flag && alarm_time >= 100) {  
            alarm_flag = 0;
            alarm_triggered = 0;  
            P1_0 = 1;     
            P1_1 = 0;     
            P2_1 = 0;     
        }
        
        
        if (!alarm_flag) {
            P1_0 = 1;     
            P1_1 = 0;     
            P2_1 = 0;     
        }
    }
}


void System_Init() {
   
    P1_0 = 1;    
    P1_1 = 0;
    P2_1 = 0;
    
    TMOD |= 0x01;     
    TH0 = 0x3C;       
    TL0 = 0xB0;
    ET0 = 1;          
    TR0 = 1;          
    
   
    IT0 = 1;          
    EX0 = 1;          
    
    EA = 1;           
}


void Timer0_ISR() interrupt 1 {
    static unsigned char count = 0;  
    
    
    TH0 = 0x3C;
    TL0 = 0xB0;
    
    
    if (++count >= 2) {
        count = 0;
        if (alarm_flag) {
            alarm_time++;  
        }
    }
}


void Ext0_ISR() interrupt 0 {
    Delay_ms(20);  
    if (P3_2 == 0 && alarm_flag) {  
        alarm_flag = 0;
        alarm_triggered = 0;  
        P1_0 = 1;     
        P1_1 = 0;     
        P2_1 = 0;     
    }
}
void Delay_ms(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++)
        for (j = 0; j < 123; j++);  
}