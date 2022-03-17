syms x
f(x) = log(x)
disp(f)
h = 0.5;
value_of_x = 1
disp('%------------------------------------------------------%')
disp('First Forward Approximation')
result = (f(x+h) - f(x))/h;
disp(result)
disp(subs(result,x,value_of_x))
disp('%------------------------------------------------------%')
disp('First Backward Approximation')
result = (f(x) - f(x-h))/h;
disp(result)
disp(subs(result,x,value_of_x))
disp('%------------------------------------------------------%')
disp('First Centered Approximation')
result = (f(x+h) - f(x-h))/(2*h);
disp(result)
disp(subs(result,x,value_of_x))
disp('%------------------------------------------------------%')


