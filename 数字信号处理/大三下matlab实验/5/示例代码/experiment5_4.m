xn=[0,1,2,3,4,5,6,7];
N=length(xn);
n=0:N-1;
w=linspace(-2*pi,2*pi,500);
X=xn*exp(-j*n'*w); %DTFT∂®“Â
subplot(3,1,1);stem(n,xn);box on;
title('x(n)');
subplot(3,1,2);plot(w,abs(X));
title('|X(e^j^\omega)|');axis([-2*pi,2*pi,1.1*min(abs(X)),1.1*max(abs(X))]);
subplot(3,1,3),plot(w,angle(X));
title('e^\phi(\omega)');axis([-2*pi,2*pi,1.1*min(angle(X)),1.1*max(angle(X))]);