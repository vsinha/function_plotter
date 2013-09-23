function [ X, fX ] = secant( func, p, p1)
%X = zeros(100,1);
%fX = zeros(100,1);
disp('===============================');
disp('     x              f(x)     i ');
disp('-------------------------------');

eps =10^-5;

for k=1:100
    
    x = p;
    fp = eval(func);
    x = p1;
    fp1 = eval(func);
    
    p2 = p1 - ((fp1)/(fp1-fp))*(p1-p);
   
    fprintf('%10f %15f %3d\n', p, fp, k);
    
    X(k,1) = p;
    fX(k,1) = fp;

    if (fp == 0 || abs(fp) < eps)
        disp('-------------------------------');
        disp('*** Solution Reached! ***');
        disp('===============================');
        return;
    end
    
    p = p1;
    p1 = p2;
    
end

disp('-------------------------------');
disp('!!! Method did not converge !!!');
disp('===============================');