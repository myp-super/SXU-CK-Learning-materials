%% DTFT
n=0:4;
x=[ones(1,5)];   %产生矩形序列
k=0:999;w=(pi/500)*k;
X=x*(exp(-j*pi/500)).^(n'*k);  %计算离散时间傅立叶变换DFT
Xe=abs(X);    %取模
subplot(3,2,1);stem(n,x);ylabel('x(n)'); %画出矩形序列
subplot(3,2,2);plot(w/pi,Xe);ylabel('|X(ejw)|'); %画出离散时间傅立叶变换DTFT
%% 补零到10点的DFT
N=10;x=[ones(1,5),zeros(1,N-5)]; %将原序列补零为10长序列
n=0:1:N-1;
X=dft(x,N);  %进行DFT
magX=abs(X);
k=(0:length(magX)'-1)*N/length(magX);
subplot(3,2,3);stem(n,x);ylabel('x(n)');   %画出补零序列
subplot(3,2,4);stem(k,magX);  %画出DFT结果
axis([0,10,0,5]);ylabel('|X(k)|');
%% 补零到20点的DFT
N=20;x=[ones(1,5),zeros(1,N-5)]; %将原序列补零为20长序列
n=0:1:N-1;
X=dft(x,N);  %进行DFT
magX=abs(X);
k=(0:length(magX)'-1)*N/length(magX);
subplot(3,2,5);stem(n,x);ylabel('x(n)');   %画出补零序列
subplot(3,2,6);stem(k,magX);  %画出DFT结果
axis([0,20,0,5]);ylabel('|X(k)|');