clear all
close all

% t=-2:0.001:2;
% for l=1:1001
%     x(l)=heaviside(t(l)+1);
% end
% for l=1002:2001
%     x(l)=1+exp(t(l));
% end
% for l=2002:3001
%     x(l)=1+exp(-1*t(l));
% end
% for l=3002:4001
%     x(l)=heaviside(-1*t(l)+1);
% end
dt=0.001;
t3=-2:dt:-1;
x3=heaviside(t3+1);

t1=-1:dt:0;
x1=1+exp(t1);

t2=0:dt:1;
x2=1+1./exp(t2);

t4=1:dt:2;
x4=heaviside(-1*t4+1);

x=[x3 x1 x2 x4];
t=[t3 t1 t2 t4];

plot(t,x);
axis([-2 2 -0.5 2.5]);

T=4;
w=2*pi/T;

K=50;
ak=zeros(1,K);
bk=zeros(1,K);
for j=1:K
    
    a=x.*(sin(j*w*t));
    c=x;
    b=x.*(cos(j*w*t));
    
    ak(j)=(2/T)*(integral(a));
    bk(j)=(2/T)*(integral(b));
       
end
ck=(1/T)*(integral(c));

  x2=zeros(1,length(x));
 
 
for j=1:K
   si=ak(j)*sin(j*w*t);
   co=bk(j)*cos(j*w*t);
   x2=x2+(si+co);
  
end
 x2=x2+ck;

figure(2);
plot(t,x2);

function y=integral(x)
dt=0.001;
sum=0;
for i=2:length(x)
    sum=sum+x(i)*dt;
end
y=sum;
end