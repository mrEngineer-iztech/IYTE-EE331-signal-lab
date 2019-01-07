x=[0 1 1 1 0 0];
t=0:5;
h=[0 1 0.5 0.5 1 0];
m=length(x);
n=length(h);
y=zeros(1,m+n-1);

y= myconvo(x,h);
figure;subplot(2,2,1)
stem(t,x);
title('x[n]');
grid on; axis([0 5 0 1.2]);
subplot(2,2,3);
stem(t,h);
title('h[n]');
grid on; axis([0 5 0 1.2]);
subplot(2,2,[2 4]);
stem(y,'s');
axis
grid on;
stem(y);
axis([0 10 0 2.1]);

function y=myconvo(x,h)
m=length(x);
n=length(h);
x=[x zeros(1,n)];
h=[h zeros(1,m)];
y=zeros(1,m+n-1);
for i=1:m+n-1
    for j=1:i
        y(i)=y(i)+x(j)*h(i+1-j);
    end
end
end