x = [0 1 1 1 0 0 ];
h = [0 1 0.5 0.5 1 0];
figure
x1=length(x);
h1=length(h);
y=zeros(1,x1+h1-1);
y=fnc(x,h);
stem(y);
% y1=conv(x,h);
% stem(y1);

function y=fnc(x,h)
x1=length(x);
h1=length(h);
x=[x zeros(1,h1)];
h=[h zeros(1,x1)];
y=zeros(1,x1+h1);
for i=1:x1+h1-1
    for j=1:i
        y(i)=y(i)+x(j)*h(i+1-j);
    end
end
end