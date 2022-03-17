syms x
f(x) = exp(x)

%sympref('PolynomialDisplayStyle','ascend');
sympref('default');

%T1 = taylor(f, x)

T2 = taylor(f,x,'ExpansionPoint',1, 'Order',8)


