% time scales
t = 0:1:16;
t2 = 0:.1:16; 

% a discrete function sampled at 1 Hz
x_t = (3*t).*((0<t)&(t<5.5)) + (0).*((5.5<t)&(t<8)) + (3*(t-8)).*((8<t)&(t<13.5)) + (0).*((13.5<t)&(t<16));

% graph of signal x(t)
subplot(4,1,1);
stem(t, x_t);
axis([0,16,-2,20]);
grid on;

% determines the periodic equivalent of signal using interpolation
X_f = 0;
for n=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
    X_f = X_f + x_t(n).*(sin( pi*(t2-(n-1)) )./( pi*(t2-(n-1)) ));
end

% plots periodic equivalent of signal, as well as original signal
subplot(4,1,2);
hold on;
stem(t, x_t);
plot(t2, X_f);
hold off;
axis([0,15,-2,20]);
grid on;
