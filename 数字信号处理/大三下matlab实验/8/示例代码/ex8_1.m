%% 实验6例1
Dt=0.00005;     %步长为0.00005s
t=-0.005:Dt:0.005;
xa=exp(-1000*abs(t));   %取时间从-0.005s到0.005s这段模拟信号
Wmax=2*pi*2000;  %信号最高频率为2*2000
K=500;        %频域正半轴取500个点进行计算
k=0:1:K;
W=k*Wmax/K;    %  求模拟角频率
Xa=xa*exp(-j*t'*W)*Dt; %计算连续时间傅立叶变换（利用矩阵运算实现） 
Xa=real(Xa);   %取实部
W=[-fliplr(W),W(2:501)];    %将角频率范围扩展为从-到+
Xa=[fliplr(Xa),Xa(2:501)];%A = [1 3 5 7 9 ]则fliplr(A)=?[9 7 5 3 1 ]
subplot(2,2,1);
plot(t*1000,xa);  %画出模拟信号，横坐标为时间（毫秒），纵坐标为幅度
xlabel('time(millisecond)');ylabel('xa(t)');
title('anolog signal');
subplot(2,2,2);
plot(W/(2*pi*1000),Xa*1000);%画出连续时间傅立叶变换 
xlabel('frequency(kHZ)'); %横坐标为频率（kHz）
ylabel('xa(jw)');             %纵坐标为幅度
title('FT');
%% 下面为采样频率5kHz时的程序
Ts=0.0002;   %采样间隔为
n=-25:1:25;
x=exp(-1000*abs(n*Ts));  %离散时间信号
K=500;k=0:1:K;w=pi*k/K;  %w为数字频率
X=x*exp(-j*n'*w); %计算离散时间傅立叶变换（序列的傅立叶变换）
X=real(X);
w=[-fliplr(w),w(2:K+1)];
X=[fliplr(X),X(2:K+1)];
subplot(2,2,3);
stem(n*Ts*1000,x);    %画出采样信号（离散时间信号）
xlabel('time(millisecond)');
ylabel('x1(n)');
title('discrete signal');
subplot(2,2,4);
plot(w/pi,X);        %画出离散时间傅立叶变换
xlabel('frequency(radian)');   %横坐标为弧度
ylabel('x1(jw)');title('DTFT');
