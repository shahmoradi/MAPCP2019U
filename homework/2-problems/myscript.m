% First create an array from -2*pi to 2:pi
x = -2*pi:pi/20:2*pi;

% Calculate |sin(x)|
y = abs(sin(x));

plot(x,y);