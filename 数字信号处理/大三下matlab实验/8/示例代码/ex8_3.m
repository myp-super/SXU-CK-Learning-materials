%% 10个有效采样点
M=10;
n=0:M-1;
x=2*cos(0.35*pi*n)+cos(0.5*pi*n);
subplot(3,2,1);stem(n,x);title('10个有效采样点的序列');
Y=dft(x,M);
k1=0:M-1;w1=2*pi/M*k1;
subplot(3,2,2);stem(w1/pi,abs(Y));title('10个有效采样点的序列的频谱');
hold on; 
%% 补零到40长序列
M=10;
n=0:M-1;
b=40;
s=0:b-1;
x=[2*cos(0.35*pi*n)+cos(0.5*pi*n), zeros(1,30)];
subplot(3,2,3);stem(s,x);title('10个有效采样点的序列补零到40长');
Y=dft(x,b);
k1=0:b-1;w1=2*pi/b*k1;
subplot(3,2,4);stem(w1/pi,abs(Y));title('补零到40长序列的频谱');
%% 40个有效采样点的序列
M=40;
n=0:M-1;
x=2*cos(0.35*pi*n)+cos(0.5*pi*n);
subplot(3,2,5);stem(n,x);title('40个有效采样点的序列');
Y=dft(x,M);
k1=0:M-1;w1=2*pi/M*k1;
subplot(3,2,6);stem(w1/pi,abs(Y));title('40个有效采样点的序列的频谱');
