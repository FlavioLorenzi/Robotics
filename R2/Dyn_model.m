%%% DYNAMIC MODEL
% algo to compute Kinematics (T) , Inertia Matrix M(q), Coriolis C(q)
% So in the end the DYN MODEl

syms d1 d2 q1 q2 l1 l2 c1 c2 s1 s2 d_q1 d_q2 m1 m2

%2R ROBOT
R = 2;
g = [0; -9.81; 0];

%r_cm_i = [ -l_i+d_i; 0; 0 ]; 
%d_q1 = diff(q1);
%d_q2 = diff(q2);
%i = 0
w0 = 0;
v0 = 0;

%i = 1
w1 = [0; 0; d_q1];
v1 = [0; d1*d_q1; 0];

T1 = 1/2*m1*pow2(v1)

%i = 2
w2 = [0; 0; d_q1+d_q2];

v2 = v1 + cross([0;0;w2(3)],[l2*c2;l2*s2;0])




