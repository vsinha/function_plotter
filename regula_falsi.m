function [ X, fX ] = regula_falsi( func, a, b)
%X = zeros(100,1);
%fX = zeros(100,1);
disp('===============================');
disp('     x              f(x)     i ');
disp('-------------------------------');

eps =10^-5;

for k=1:100
    x=a;
    fa = eval(func);
    x=b;
    fb = eval(func);
    
    c = b - (fb*(b - a))/(fb - fa); %false position method
    
    x=c;
    fc = eval(func);

    fprintf('%10f %15f %3d\n', c, fc, k);
    
    %reassign c to either a or b depending on sign
    if (fc < 0)
        a = c;
    elseif (fc > 0)
        b = c;
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