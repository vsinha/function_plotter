syms x;
x0 = input('Enter interval x0 = ');
x1 = input('Enter interval x1 = ');
x = x0:0.01:x1;
disp('Enter function. Example: f(x)=sin(x)-.4');
func = input('Enter function: f(x)=', 's');

% Plot function
fplot(func, [x0,x1]);
grid on

%this way we only have to enter a and b once
a = input('Enter the value a = ');
disp('Leave b blank if only performing Newton-Raphson');
b = input('Enter the value b = ');

while 1
    disp('1) Do you want to plot another function?, ');
    disp('  or find the solution to f(x)=0 using ');
    disp('2) Bisection, ');
    disp('3) Regula-Falsi, ');
    disp('4) Newton-Raphson, ');
    disp('5) Secant Method., or ');
    disp('6) Exit.');

    choice = input ('Enter the number: ');
    
    switch (choice)
        case 1
            x0 = input('Enter interval x0 = ');
            x1 = input('Enter interval x1 = ');
            x = x0:0.01:x1;
            func = input('Enter function: f(x)=', 's');
            
        case 2
            %bisection method
            [X, fX] = bisection(func, a, b);
            plot_iterations(func,x0,x1,X,fX);
            
        case 3
            %regula falsi
            [X, fX] = regula_falsi(func, a, b);
            plot_iterations(func,x0,x1,X,fX);    
            
        case 4
            %newton-raphson
            [X, fX] = newton_raphson(func, a);
            plot_iterations(func,x0,x1,X,fX);
            
        case 5
            %secant
            [X, fX] = secant(func, a, b);
            plot_iterations(func,x0,x1,X,fX); 
            
        case 6
            disp ('bye');
            break;
    end
end