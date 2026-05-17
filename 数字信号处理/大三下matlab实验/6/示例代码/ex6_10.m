n=-4:4;
x=ones(1,length(n));
x(n<0)=0;
stem(n,x);
xlabel('n')
ylabel('x(n)');
title('单位阶跃序列 u(n)');

