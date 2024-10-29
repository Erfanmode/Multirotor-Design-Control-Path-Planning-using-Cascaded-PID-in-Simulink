k=4;
q=8; % It is necessary that q>k
a = 1; %in meter
b = 2*a*sqrt(k*(q-1));
T = 60; % in second
t=0:T/300:T; 
u=t/T*6.28;

x = a*((q-1)*cos(u)+ k*cos((q-1)*u)) - a*(q-1+k);
y = a*((q-1)*sin(u)- k*sin((q-1)*u));
z = b*sin(0.5*q*u) - 10;
path_table=[x;y;z]';
plot3(x,y,z)