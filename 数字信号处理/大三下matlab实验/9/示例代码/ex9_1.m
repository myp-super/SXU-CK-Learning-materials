%% 1.(1) N=40的FFT
N=40;n=0:N-1;   %设置FFT点数
t=0.01*n;
x=2*sin(4*pi*t)+5*cos(8*pi*t); %模拟信号的表达式
k=0:N/2;w=2*pi/N*k;
X=fft(x,N);
magX=abs(X(1:N/2+1));
subplot(2,2,1);stem(n,x,'.');title('signal x(n)');
xlabel('n');ylabel('x(n)');
subplot(2,2,2);plot(w,magX);title('FFT N=40');
xlabel('\omega(rad)');ylabel('|X|');grid
%(2)N=128的FFT
N=128;n=0:N-1;   %设置FFT点数
t=0.01*n;
x=2*sin(4*pi*t)+5*cos(8*pi*t); %模拟信号的表达式
k=0:N/2;w=2*pi/N*k;
X=fft(x,N);
magX=abs(X(1:N/2+1));
subplot(2,2,3);stem(n,x,'.');title('signal x(n)');
xlabel('n');ylabel('x(n)');
subplot(2,2,4);plot(w,magX);title('FFT N=128');
xlabel('\omega(rad)');ylabel('|X|');grid
hold on
figure