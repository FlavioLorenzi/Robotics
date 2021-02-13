syms g m1 m2 m3 l l1 l2 l3 l4 d d1 d2 d3 d4 q1 q2 q3 q4 q1_p q2_p Fy real
syms I1 I2 I3 a1 a2 a3 a4 a5 a6 lambda X Y Z real
syms Fk

clear,clc
sz = [1 100];

for tries = 1:10000
    x = unifrnd(0,1,sz); %distribuzione uniforme
    sum = 0;
    for i = 1:100
        sum = sum + (2*x(i)^2 + 1);  
    end
    sums(tries) = sum;
    % disp(sums(tries))
end

minimum = min(sums)
maximum = max(sums)





sz = [1 100];
for samples = 1:10000
    x = normrnd(0,1,sz); %distribuzione normale
    sum = 0;
    for i = 1:100
        sum = sum + (x(i))^2;  
    end
    su(samples) = sum;
end
minimum = min(su)
maximum = max(su)












