%(2)
t=0:0.001:0.8;%fs=1000Hz Ts=0.001s
x=sin(2*pi*50*t)+cos(2*pi*120*t);
y=x+1.5*randn(1,length(t));%t的长度为801
subplot(3,1,1);plot(t,x);
title('Signal x(t)');
xlabel('t');ylabel('x(t)');
subplot(3,1,2);plot(t,y);%title('press any key,continue...');
title('被噪声污染的Signal x(t)');
xlabel('t');ylabel('被噪声污染的x(t)');
%pause;N=512
Y=fft(y,512);
P=Y.*conj(Y)/512;%计算共轭和功率谱密度Y^2/N
f=1000*(0:255)/512;%f=fs/N*(0:255)=F0*(0:255)
subplot(3,1,3);plot(f,P(1:256));
title('功率谱密度');
xlabel('Hz');ylabel('PSD(dB)');
