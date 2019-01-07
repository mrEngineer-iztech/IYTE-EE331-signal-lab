clear all
close all
Fs=1000; f=50; T=0.004; n=1024;
t=0:1/Fs:0.2; 
x=sin(2*pi*f.*t); 

imp=zeros(1,201);
for t2=1:4:200
    imp(t2)=1;
end

y=imp.*x;

figure(1)

subplot(311); plot(t,x); title('Analog'); 
subplot(312); stem(t,imp); title('Imp Train');
subplot(313); stem(t,y);title('Digital');

a=zeros(1,51);
for i=1:50
    a(i)=y(i*4-3);
end

figure(2)

ta=0:0.2/50:0.2;
subplot(211);stem(ta,a);
intx=interp1(ta,a,t,'spline');
subplot(212);plot(t,intx,ta,a,'o');

figure(3)

Fs2=75; t2=0:1/Fs2:0.2; 
intx2=interp1(ta,a,t2,'spline');
f2=linspace(-Fs2/2,Fs2/2,n);  
fftx2=abs(fftshift(fft(intx2,n)/n));
subplot(311); plot(f2,fftx2);

Fs3=500; t3=0:1/Fs3:0.2; 
intx3=interp1(ta,a,t3,'spline'); 
f3=linspace(-Fs3/2,Fs3/2,n);  
fftx3=abs(fftshift(fft(intx3,n)/n));
subplot(312); plot(f3,fftx3);

Fs4=1000;  t4=0:1/Fs4:0.2; 
intx4=interp1(ta,a,t4,'spline');
fftx4=abs(fftshift(fft(intx4,n)/n));
f4=linspace(-Fs4/2,Fs4/2,n); 
subplot(313); plot(f4,fftx4);