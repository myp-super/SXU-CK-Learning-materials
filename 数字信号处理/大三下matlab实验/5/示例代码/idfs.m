function[xn]=idfs(Xk,N)
n=0:N-1;
k=0:N-1;
WN=exp(j*2*pi/N);
nk=n'*k;
xn=(Xk*WN.^nk)/N;
end


