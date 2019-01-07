clear all
close all

t=0:0.001:3;
x1=-1*exp(-1*t);
x=derivative(x1);
x_mag=(abs(x)).^2;
y1=integral(x_mag);
power1=(1/3)*(y1);

w=2*pi/3;

k=-100:100;

for j=1:length(k)
    
    fourier=exp(-1*i*w*k(j)*t);
    fourier=transpose(fourier);
    ara=x.*fourier;
    ara2=integral(ara);
    c(j)=(1/3)*(ara2);
    
end

c_mag=abs(c);
y2=power(c_mag,2);

power2=0;
for i=1:length(k)
    power2=power2+y2(i);
end


function y=derivative(x)
dt=0.001;
y=zeros(length(x),1);
for i=2:length(x)
    y(i-1)=(x(i)-x(i-1))/dt;
end
end

function y=integral(x)
dt=0.001;
sum=0;
for i=2:length(x)
    sum=sum+x(i)*dt;
end
y=sum;
end