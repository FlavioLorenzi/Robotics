%%%calcoli

syms g m1 m2 m3 l l1 l2 l3 l4 d1 d2 d3 d4 q1 q2 q3 q4 q1_p q2_p q3_p Fy real
syms I1 I2 I3 a1 a2 a3 a4 a5 h a6 real

c1 = cos(q1);
c12 = cos(q1+q2);
c123 = cos(q1+q2+q3);
c1234 = cos(q1+q2+q3+q4);
s1 = sin(q1);
s12 = sin(q1+q2);
s123 = sin(q1+q2+q3);
s1234 = sin(q1+q2+q3+q4);


%CALCOLARE g(q) data energia potenziale
U = m1*g*d1*sin(q1) + m2*g*(l1*sin(q1)+d2*sin(q1+q2));

g1 = diff(U,q1);

g2 = diff(U,q2);

g_q = [g1;g2];

%CALCOLARE g(q) data energia potenziale PER QUATTRO JOINTS
U_n = a1*sin(q1)+a2*sin(q1+q2)+a3*sin(q1+q2+q3)+a4*sin(q1+q2+q3+q4);

g1_n = diff(U_n,q1);
g2_n = diff(U_n,q2);
g3_n = diff(U_n,q3);
g4_n = diff(U_n,q4);

g_q_n = [g1_n;g2_n;g3_n;g4_n];



%Calcolare la Jacbiana che accompagna la forza nel mod dinamico
%l1 = 1
F = [0;Fy];
p =[cos(q1)+0.5*cos(q1+q2);sin(q1)+0.5*sin(q1+q2)]; 
r = [l*(c1+c12+c123+c1234);l*(s1+s12+s123+s1234);q1+q2+q3+q4];

J1 = diff(p,q1);

J2 = diff(p,q2);

J3 = diff(p,q3);

J = [J1,J2,J3];

contact_force_term = J'*F;

%NB: p primo è la velocità e si trova (da rob1): J(q)*q_p

J_r = [diff(r,q1),diff(r,q2),diff(r,q3),diff(r,q4)]




M = [-sin(q1) -sin(q2) -sin(q3); cos(q1) cos(q2) cos(q3);cos(q1) cos(q2) 0];
det(M);


%Calcolo Energia Cinetica
T1 = 1/2 * m1 * q1_p^2;

%per T2 mi serve p2 e v2

%v2 = diff(p2)
v2 = [q1+cos(q2)+cos(q3)+cos(q4);h+sin(q2)+sin(q3)+sin(q4)];
diff(v2,q1)
diff(v2,q2)
diff(v2,q3)
diff(v2,q4)


v2_norm_square = v2'*v2

T2 = 1/2*m2*v2_norm_square + 1/2 *I2*q2_p^2;

%%NB La matrice M(q) si estrae da T = 1/2 q' M(q) q_p
%la diagonale principale sono gli elementi che moltiplicano q_p(i) in T
%gli altri elementi sono simmetrici, termini comuni per q_p(i,j)




