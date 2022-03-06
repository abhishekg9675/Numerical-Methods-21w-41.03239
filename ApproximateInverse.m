a = [1, 5, 7; 5, 6, 3; 9, 2, 3]

b = inv(a)

I = eye(size(a,1))
c = I + (I-a) + (I-a)^2 + (I-a)^3 + (I-a)^4 + (I-a)^5

 