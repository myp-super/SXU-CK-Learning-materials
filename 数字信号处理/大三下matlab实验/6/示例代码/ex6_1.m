clf;						
n=0:10;
x1=[1 zeros(1,10)];x2=[zeros(1,5) 1 zeros(1,5)];
subplot(1,2,1);
stem(n,x1);xlabel ('时间序列n');ylabel('振幅');title('单位抽样序列x1');
subplot(1,2,2);
stem(n,x2); xlabel('时间序列n');ylabel('振幅');title('延时了5的单位抽样序列');
