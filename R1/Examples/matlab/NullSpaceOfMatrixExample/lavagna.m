
l1= 1;
l2= 0.5;
l3= 0.25;
q1 =  pi/3;
q2 = -pi/6;
q3 = -pi/6;

J = [-(l1*sin(q1)+l2*sin(q1+q2)+l3*sin(q1+q2+q3)) -(l2*sin(q1+q2)*l3*sin(q1+q2+q3))  -l3*sin(q1+q2+q3);
    l1*cos(q1)+l2*cos(q1+q2)+l3*cos(q1+q2+q3) l2*cos(q1+q2)+l3*cos(q1+q2+q3)   l3*cos(q1+q2+q3)]



