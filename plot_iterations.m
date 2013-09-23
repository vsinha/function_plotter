function plot_iterations(func ,x0 ,x1 ,X ,fX)           
    fplot(func, [x0, x1]);
    hold all
    plot(X, fX, 'r+')
    hold off
    grid on