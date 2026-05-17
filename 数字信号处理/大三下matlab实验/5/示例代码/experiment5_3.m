xn=[0,1,2,3,4,5,6,7];
N=length(xn);
m=0:N-1;
n=0:4*N-1;
k=0:4*N-1;
xn1=xn(mod(n,N)+1);  %matlab 下标默认从1开始
Xk=xn1*exp(-j*2*pi/N).^(n'*k); %DFS
subplot(2,2,1);stem(m,xn);
title('x(n)');
subplot(2,2,2);stem(n,xn1);
title('周期序列');
subplot(2,2,3),stem(k,abs(Xk));
title('|X(k)|');axis([-1,4*N,1.1*min(abs(Xk)),1.1*max(abs(Xk))]);
subplot(2,2,4),stem(k,angle(Xk));
title('arg|X(k)|');axis([-1,4*N,1.1*min(angle(Xk)),1.1*max(angle(Xk))]);