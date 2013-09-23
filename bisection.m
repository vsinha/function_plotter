function [ X, fX ] = bisection( func, a, b)
%X = zeros(100,1);
%fX = zeros(100,1);
disp('===============================');
disp('     x              f(x)     i ');
disp('-------------------------------');

eps =10^-5;

for k=1:100
    
    
    c = (a+b)/2;
    x=a;
    fa = eval(func);
    x=b;
    fb = eval(func);
    x=c;
    fc = eval(func);

    fprintf('%10f %15f %3d\n', c, fc, k);
    
    if fb*fc > 0
        b = c;
    else
        a = c;
    end
    
    X(k,1) = c;
    fX(k,1) = fc;

    if (fc == 0 || abs(fc) < eps)
        disp('-------------------------------');
        disp('*** Solution Reached! ***');
        disp('===============================');
        return;
    end
end

disp('-------------------------------');
disp('!!! Method did not converge !!!');
disp('===============================');