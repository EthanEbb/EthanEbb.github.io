
%First Plot
x = 0:2*pi/3:2*pi;
y = sin(x);
plot(x,y)

%Second
x = 0:2*pi/10:2*pi;
y = sin(x);
plot(x,y)

%Third
x = 0:2*pi/100:2*pi;
y = sin(x);
plot(x,y)


%Alternative way to write x
x = linspace(0, 2*pi, 100);
% lower bound, upper bound, number of points)


%Pretty It Up
figure
%figure labels out plot so we can make several
plot(x,y,'Color',[0,0.7,0.9])
%Color denotes what we are changing and the vector is an RGB value

title('Graph of Sin(x)')
xlabel('x')
ylabel('sin(x)')


figure(2)
z = cos(5*x);
plot(x,z,'Color',[0,0.5,0.5])

%To put them on the same graph...
    %Method 1:
    figure
    plot(x,y,'g',x,z,'b') %The g and b also give colors for the lines
    legend('sin(x)','cos(5*x)')

    %Method 2
    figure(2)
    plot(x,y,'r')
    hold on; % Keep the current plot so we can add to it
    y2 = sin(2*x); % Calculate a second sine wave with a higher frequency
    plot(x, y2, 'o'); % Plot the second sine wave
    legend('sin(x)', 'sin(2x)'); % Add a legend to differentiate the plots
    hold off


%Evil Script
x = linspace(1,10,100);
for i=1:20
    figure(i)
    y = sin(i*x);
    plot(x,y,'Color',[0,0.5,1/i]) 
end

%Close all to get rid of them