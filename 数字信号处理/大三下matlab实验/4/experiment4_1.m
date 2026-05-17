%% （1）当fs=1000 Hz,fm=500Hz时，连续时间信号经序列傅里叶变换的频谱特性。编程如下：首先产生信号x(n),0<=n<50
 
n=1:50;                     %定义序列的长度是50
A=444.128;                  %设置信号有关的参数
a=50*sqrt(2.0)*pi;
fs=1500;T=1/fs;                     %采样周期 fs=1000Hz   分别设置fs=1000Hz   500Hz   300Hz 观察频谱混叠现象
w0=50*sqrt(2.0)*pi;         %ω符号在MatLab 中不能输入，用w 代替
xa=A*exp(-a*n*T).*sin(w0*n*T); %pi 是MATLAB 定义的π，信号乘可采用“.*”
close all                   %清除已经绘制的xa(n) 图形
figure(1)
subplot(4,1,1);stem(xa);    %绘制xa(n) 的图形
title('理想采样信号序列xa(n)'); %设置结果图形的标题
 
hold on
%绘制信号xa(n)的幅度谱和相位谱
k=-200:200 ;   %k可以改变
W=(pi/100)*k;
Xa=xa*(exp(-j*pi/100)).^(n'*k);%-j*2*pi/M   M=200
magXa=abs(Xa);                  %绘制xa(n) 的幅度谱
subplot(4,1,2);stem(magXa);subplot(4,1,3); plot(W/pi,magXa)
title('理想采样信号序列的幅度谱'); 
angXa=angle(Xa);                %绘制xa(n) 的相位谱
subplot(4,1,4);stem(angXa) ; 
title ('理想采样信号序列的相位谱') 

%% 2、 单位脉冲序列  在MatLab 中，这一函数可以用zeros 函数实现：
n=1:50;                     %定义序列的长度是50 
xb=zeros(1,50);                 %注意：MATLAB 中数组下标从1 开始
xb(1)=1;figure; 
subplot(3,1,1);
stem(xb);
title('单位冲击信号序列'); 
k=-25:25;
Xb=xb*(exp(-j*pi/12.5)).^(n'*k); 
magXb=abs(Xb);                  %绘制xb(n) 的幅度谱
subplot(3,1,2);stem(magXb);% W=(pi/12.5)*k;plot(W/pi,magXb)
title('单位冲击信号的幅度谱'); 
angXb=angle(Xb);                    %绘制xb(n) 的相位谱
subplot(3,1,3);stem(angXb) ; 
title ('单位冲击信号的相位谱') 
%% 3、矩形序列
n=1:10; 
xc=sign(sign(10-n)+1); 
figure; 
subplot(3,1,1); 
stem(xc);title('矩形序列'); 
k=-25:25; 
Xc=xc*(exp(-j*pi/25)).^(n'*k); 
magXc=abs(Xc);                  %绘制x(n) 的幅度谱
subplot(3,1,2);
stem(magXc);title('矩形信号的幅度谱'); 
angXc=angle(Xc);                %绘制x(n) 的相位谱
subplot(3,1,3);
stem(angXc); 
title ('矩形信号的相位谱') 
%% 卷积计算
%在MATLAB 中提供了卷积函数conv，即y=conv(x,h) ，调用十分方便。例如：
%系统：hb (n)=δ(n)+2.5δ(n -1)+2.5δ(n -2)+δ(n-3)特定冲击串
%信号： 
n=1:50;                         %定义序列的长度是50
hb=zeros(1,50);                 %注意：MATLAB 中数组下标从1 开始
hb(1)=1; hb(2)=2.5; hb(3)=2.5; hb(4)=1; 
close all; subplot(3,3,2);stem(hb);title('系统hb[n]'); 
n=1:50; T=0.001;                %定义序列的长度是和采样率
A=444.128; a=50*sqrt(2.0)*pi;   %设置信号有关的参数
w0=50*sqrt(2.0)*pi;
xa=A*exp(-a*n*T).*sin(w0*n*T);      %pi 是MATLAB 定义的π，信号乘可采用“.*”
subplot(3,3,1);stem(xa);title('输入信号xa[n]'); 
y=conv(xa,hb); 
subplot(3,3,3);stem(y);title('输出信号y[n]'); 
hold on
 
k=-25:25; Xa=xa*(exp(-j*pi/12.5)).^(n'*k); 
magXa=abs(Xa);          %绘制xa(n) 的幅度谱
subplot(3,3,4);stem(magXa);title('输入信号xa(n)的幅度谱'); 
angXa=angle(Xa);            %绘制xa(n) 的相位谱
subplot(3,3,7);stem(angXa) ; title ('输入信号xa(n)的相位谱') 
Hb=hb*(exp(-j*pi/12.5)).^(n'*k); 
magHb=abs(Hb);          %绘制hb(n) 的幅度谱
subplot(3,3,5);stem(magHb);title('系统单位脉冲响应序列hb(n)的幅度谱'); 
angHb=angle(Hb);        %绘制hb(n) 的相位谱
subplot(3,3,8);stem(angHb) ; title ('系统系统单位脉冲响应序列hb(n)的相位谱') 
n=0:98; k=0:98;          %N1+N2-1=99
Y=y*(exp(-j*pi/12.5)).^(n'*k); 
magY=abs(Y);            %绘制y(n) 的幅度谱
subplot(3,3,6);stem(magY);title('输出信号y(n)的幅度谱'); 
 
angY=angle(Y);          %绘制y(n) 的相位谱
subplot(3,3,9);stem(angY) ; title ('输出信号y(n)的相位谱') 
hold on
%%卷积定律验证
%以下将验证的结果显示
figure;
XHb=Xa.*Hb; 
subplot(2,1,1);stem(abs(XHb));title('x(n)的幅度谱与hb(n)幅度谱相乘'); axis([0,50,0,8000])
subplot(2,1,2);stem(abs(Y)); title('y(n)的幅度谱'); axis([0,50,0,8000])

%% 计算卷积
x=[ones(1,10)]; %输入序列为矩形序列长度为10
x1=[ones(1,10),zeros(1,40)];
N1=length(x);%矩形序列长度为10
n1=0:N1-1; 
N2=50; n2=0:N2-1;
h=0.8.^n2; %单位脉冲响应
y=conv(x,h);%做卷积运算
N=N1+N2-1;n=0:N-1;
figure;
subplot(3,1,1);stem(n2,x1);title('矩形输入序列'); 
subplot(3,1,2);stem(n2,h);title('系统h[n]'); 
subplot(3,1,3);stem(n,y);title('系统的输出');