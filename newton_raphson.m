function [ X, fX ] = polyfit( func, p )
%X = zeros(100,1);
%fX = zeros(100,1);
disp('===============================');
disp('     x              f(x)     i ');
disp('-------------------------------');
eps =10^-5;

for k=1:6
    
    %estimate the derivative
    x = p;
    fp = eval(func);
    x = x + eps;
    fp_eps = eval(func);
    fprime_p = (fp_eps - fp) / eps;
    
    p_next = p - (fp / fprime_p);

    fprintf('%10f %15f %3d\n', p, fp, k);
    
    X(k,1) = p;
    fX(k,1) = fp;

    if (fp == 0 || abs(fp) < eps)
        disp('-------------------------------');
        disp('*** Solution Reached! ***');
        disp('===============================');
        return;
    end
    
    p = p_next; %update p
end

disp('-------------------------------');
disp('!!! Method did not converge !!!');
disp('===============================');