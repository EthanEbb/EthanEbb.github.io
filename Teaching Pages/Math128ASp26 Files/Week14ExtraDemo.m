%% Multi-Step Methods in Matlab

%
tspan = [0,5];
y0 = 4;
%f = @(t,y) 3*t*y;
f = @(t,y) 3*t*sin(y);
h=0.1;
steps=(tspan(2)-tspan(1))/h;

%%Runge Kutta

[t,y] = ode23(f,tspan,y0);
plot(t,y)


%% Adams Bashforth
t2 = zeros(1,steps+1);
t2(1) = tspan(1);
y2 = zeros(1,steps+1);
y2(1) = y0;

%Apply RK for first few steps

for k=2:4
t2(k) = t2(k-1)+h;
k1 = f(t2(k-1),y2(k-1));
k2 = f(t2(k-1)+h,y2(k-1)+h*k1);
phi = (1/2)*(k1+k2);
y2(k) = y2(k-1) + h*phi;
end



%AB formula


for k=5:steps+1
t2(k)=t2(k-1)+h;

y2(k) = y2(k-1) + (h/24)*( -9*f(t2(k-4),y2(k-4)) +37*f(t2(k-3),y2(k-3))...
                        -59*f(t2(k-2),y2(k-2)) +55*f(t2(k-1),y2(k-1)));
end


plot(t,y)
hold on
plot(t2,y2)

hold off
%Almost identical, but RK takes more steps (and this is an adaptive RK,
%versus nonadaptive/nonpaired AB)


%% Predictor-Corrector Pair

%Start as before
t3 = zeros(1,steps+1);
t3(1) = tspan(1);
y3 = zeros(1,steps+1);
y3(1) = y0;

for k=2:4
t3(k) = t3(k-1)+h;
k1 = f(t3(k-1),y3(k-1));
k2 = f(t3(k-1)+h,y3(k-1)+h*k1);
phi = (1/2)*(k1+k2);
y3(k) = y3(k-1) + h*phi;
end


%Multistep Part

for k=5:steps+1
t3(k)=t3(k-1)+h;
%Compute by AB
y3pred = y3(k-1) + (h/24)*( -9*f(t3(k-4),y3(k-4)) +37*f(t3(k-3),y3(k-3))...
                        -59*f(t3(k-2),y3(k-2)) +55*f(t3(k-1),y3(k-1)));
%Update by AM
y3(k) = y3(k-1) + (h/720)*( -19*f(t3(k-4), y3(k-4)) + 106*f(t3(k-3),y3(k-3))...
        -264*f(t3(k-2),y3(k-2)) + 646 * f(t3(k-1),y3(k-1)) + 251*f(t3(k),y3pred));

end



plot(t,y,'green',t2,y2,'red',t3,y3,'yellow')

