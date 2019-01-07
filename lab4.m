close all
clear all
figure(1)
t=-5:5;
y1=exp(t-2);
x1=exp(t);
plot(t,x1,t,y1,':','LineWidth',2);
grid on
xlabel('Time ,t');
ylabel('I');
title('y1');
axis([-5 5 0 3])

figure(2)
t=-5:0.01:5;
N=4;
y2=rectpuls(2*t,N);
x2=rectpuls(t,N);
plot(t,y2,t,x2,':', 'LineWidth',2);
grid on
xlabel('Time ,t');
ylabel('I');
title('y2');
axis([-5 5 -0.3 1.3])

figure
t=-5:0.0001:5;
u=heaviside(t+0.5)-heaviside(t-1.5);
u2=heaviside(t/2+0.5)-heaviside(t/2-1.5);

plot(t,u,t,u2,':', 'LineWidth',2);
grid on
xlabel('Time ,t');
ylabel('I');
title('y3');
axis([-5 5 -0.3 1.3])


figure(4)
t=-5:0.01:5;
x1=sin(t);
x2=exp(t);
a=1;
b=3;
x3=a*x1+b*x2;
y1=t.*sin(t);
y2=t.*exp(t);
y3=t.*(a*sin(t)+b*exp(t));

y=a*y1+b*y2;
plot(t,y,t,y3,':','Linewidth',3);
ylim([-100 100 ]);



