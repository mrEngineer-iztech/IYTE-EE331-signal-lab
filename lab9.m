Fs=1000;
Wn=100/(Fs/2);
[b1,a1]=butter(5,Wn,'low');
h1=freqz(b1,a1);
[b2,a2]=butter(25,Wn,'low');
h2=freqz(b2,a2);
figure(1)
plot(abs(h1));
hold;
plot(abs(h2));
Wn1=300/(Fs/2);
[b3,a3]=butter(5,Wn1,'high');
h3=freqz(b3,a3);
[b4,a4]=butter(25,Wn1,'high');
h4=freqz(b4,a4);
figure(2)
plot(abs(h3),'g');
hold;
plot(abs(h4));
t=0:0.001:0.5;
x=cos(2*pi*50*t)+sin(2*pi*75*t)+cos(2*pi*120*t)+sin(2*pi*385*t);


y1=filter(b2,a2,x);
y2=filter(b4,a4,x);


N=1024;
f=linspace(-Fs/2,Fs/2,N);
fftx=abs(fftshift(fft(x,N))/N);
ffty1=abs(fftshift(fft(y1,N))/N);
ffty2=abs(fftshift(fft(y2,N))/N);

figure(3)
subplot(311);
plot(f,fftx);
subplot(312);
plot(f,ffty1);
subplot(313);
plot(f,ffty2);