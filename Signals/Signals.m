clear all;
close all;
clc;

pkg load signal;

#----step signal----
x = -10:10;
y = (x>=0);
subplot(3,4,1);
stem(x,y);
title('Step');
xlabel('x');
ylabel('y');
grid on;

#----ramp signal----
x = -10:10;
y = (x>=0).*x;
subplot(3,4,2);
stem(x,y);
title('Ramp');
xlabel('x');
ylabel('y');
grid on;

#----parabolic signal----
x = -10:10;
y = (x>=0).*x.*x./2;
subplot(3,4,3);
stem(x,y);
title('Parabolic');
xlabel('x');
ylabel('y');
grid on;

#----impulse signal----
x = -10:10;
y = (x==0);
subplot(3,4,4);
stem(x,y);
title('Impulse');
xlabel('x');
ylabel('y');
grid on;

#----square wave----
fs = 1000;
f = 0.25;
x = -10:1/fs:10-1/fs;
y = 0.5.*square(2*pi*f*x);
subplot(3,4,5);
plot(x,y);
title('Square');
xlabel('x');
ylabel('y');
grid on;

#----triangular wave----
fs = 100;
f = 0.5;
x = -10:1/fs:10-1/fs;
y = 0.5.*sawtooth(2*pi*f*x)
subplot(3,4,6);
plot(x,y);
title('Triangular');
xlabel('x');
ylabel('y');
grid on;

#----sin wave----
fs = 1000;
f = 0.25;
x = -10:1/fs:10-1/fs;
y = sin(2*pi*f*x);
subplot(3,4,7);
plot(x,y);
title('Sin');
xlabel('x');
ylabel('y');
grid on;

#----cos wave----
fs = 1000;
f = 0.25;
x = -10:1/fs:10-1/fs;
y = cos(2*pi*f*x);
subplot(3,4,8);
plot(x,y);
title('Cos');
xlabel('x');
ylabel('y');
grid on;

#----real exponential signal----
fs = 1000;
x = 0:1/fs:10-1/fs;
y = exp(0.25*x);
subplot(3,4,9);
plot(x,y);
title('Real exponential');
xlabel('x');
ylabel('y');
grid on;

#----complex exponential signal----
fs = 100;
x = 0:1/fs:10-1/fs;
c = -0.5+10j;
y = exp(c*x);
subplot(3,4,10);
plot(x,real(y));
title('Complex exponential');
xlabel('x');
ylabel('y');
grid on;

#----sinc wave----
fs = 1000;
x = -10:1/fs:10-1/fs;
y = sin(pi*x)./(pi*x);
subplot(3,4,11);
plot(x,y);
title('Sinc');
xlabel('x');
ylabel('y');
grid on;

#----chirp wave----
fs = 1000;
fstart = 1;
t = 10;
fend = 5;
x = 0:1/fs:10-1/fs;
y = chirp(x,fstart,t,fend);
subplot(3,4,12);
plot(x,y);
title('Chirp');
xlabel('x');
ylabel('y');
grid on;