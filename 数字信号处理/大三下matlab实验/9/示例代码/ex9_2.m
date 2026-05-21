%% 2(1)N=64,df=1/16
N=64;n=0:N-1;
t=n;
df=1/16;
x=sin(2*pi*0.15*t)+cos(2*pi*(0.15+df)*t)+cos(2*pi*(0.15+2*df)*t);
k=0:N/2;w=2*pi/N*k;
X=fft(x,N);
magX=abs(X(1:N/2+1));
subplot(3,2,1);stem(n,x,'.');title('Signal x(n)');
xlabel('n');ylabel('x(n)');
subplot(3,2,2);plot(w,magX);title('FFT N=64 df=1/16');
xlabel('\omega(rad)');ylabel('|X|');grid;
% N=64 df=1/64
N=64;n=0:N-1;
t=n;
df=1/64;
x=sin(2*pi*0.15*t)+cos(2*pi*(0.15+df)*t)+cos(2*pi*(0.15+2*df)*t);
k=0:N/2;w=2*pi/N*k;
X=fft(x,N);
magX=abs(X(1:N/2+1));
subplot(3,2,3);stem(n,x,'.');title('Signal x(n)');
xlabel('n');ylabel('x(n)');
subplot(3,2,4);plot(w,magX);title('FFT N=64 df=1/64');
xlabel('\omega(rad)');ylabel('|X|');grid;
% N=128 df=1/64
N=128;n=0:N-1;
t=n;
df=1/64;
x=sin(2*pi*0.15*t)+cos(2*pi*(0.15+df)*t)+cos(2*pi*(0.15+2*df)*t);
k=0:N/2;w=2*pi/N*k;
X=fft(x,N);
magX=abs(X(1:N/2+1));
subplot(3,2,5);stem(n,x,'.');title('Signal x(n)');
xlabel('n');ylabel('x(n)');
subplot(3,2,6);plot(w,magX);title('FFT N=128 df=1/64');
xlabel('\omega(rad)');ylabel('|X|');grid;
hold on 
figure