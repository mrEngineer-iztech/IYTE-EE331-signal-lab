clear all
close all

f1=100;
f2=300;
Fs=1000;
t=0:0.001:0.5;
N=1024;
f=linspace(-Fs/2,Fs/2,N);
x=cos(2*pi*f1*t)+3*sin(2*pi*f2*t);

for i=1:length(f)
    Xf(i)=integral(x.*exp(-1*j*2*pi*f(i)*t));
end

Xf_mag=abs(Xf);

fftx=abs(fftshift(fft(x,1024))/1024);

figure(1);
subplot(2,1,1);
plot(f,Xf_mag);
subplot(2,1,2);
plot(f,fftx);

%% second part

f4=200;
Fs2=1000;
t=0:0.001:0.5;
x1=2*cos(2*pi*f4*t);
h=exp(t);

y1=conv(x1,h);

fftx1=fft(x1,1024);
ffth=fft(h,1024);

y2f=fftx1.*ffth;
y2f=ifft(y2f);
%???????
 last=0+0.001*(length(y1)-1);
 t_new=0:0.001:last;

figure(2);
subplot(2,1,1);
plot(t_new,y1);
subplot(2,1,2);
plot(t_new,y2f(1:length(y1)));


function y=integral(x)
dt=0.001;
sum=0;
for i=2:length(x)
    sum=sum+x(i)*dt;
end
y=sum;
end