     %DATA LA MATRICE DI INERZIA M CALCOLO DEI TERMINI Ci
syms a1 a2 a3 a4 q1 q2 q3 q1_p q2_p real
syms I1 I2 m1 m2 a1 a2 a3 a4 a5 a6 real

l = 0.5;

%inertia matrix 2x2
M = [I1+m1*d1^2+m2*l^2 m2*l*d2*cos(q2-q1); m2*l*d2*cos(q2-q1) I2+m2*d2^2];


%inertia matrix linearizzata 3x3
Mp = [a1, -(a5*sin(q2)+a6*sin(q2+q3)), -a6*sin(q2+q3);
     -(a5*sin(q2)+a6*sin(q2+q3)), a2+2*a3*cos(q3), a4+a3*cos(q3);
     -a6*sin(q2+q3), a4+a3*cos(q3), a4];
 
 
%inertia matrix linearizzata 4x4
Mq = [a1, 0, -a6*sin(q3)-a5*sin(q3+q4), -a5*sin(q3+q4);
     0, a2, a6*cos(q3)+a5*cos(q3+q4), a5*cos(q3+q4);
     -a6*sin(q3)-a5*sin(q3+q4), a6*cos(q3)+a5*cos(q3+q4), a3+2*a5*l3*cos(q4), a4+a5*l3*cos(q4);
     -a5*sin(q3+q4), a5*cos(q3+q4),a4+a5*l3*cos(q4), a4 ];

 
%%%%%%%%%%%%%%%%%%%%% 2x2 %%%%%%%%%%%%%%%%%%%%
%C1
Primoa = [diff(M(1),q1), diff(M(2),q1) ; diff(M(1),q2),diff(M(2),q2)];
Secondoa = Primoa';
Terzoa = diff(M,q1);

C1 = 1/2*(Primoa + Secondoa - Terzoa)


%C2
Primob = [diff(M(3),q1), diff(M(4),q1) ; diff(M(3),q2),diff(M(4),q2)];
Secondob = Primob';
Terzob = diff(M,q2);

C2 = 1/2*(Primob + Secondob - Terzob)




%%%%%%%%%%%%%%%%%%%% 3x3 parametrizata %%%%%%%%%%%%%%%%%%%%

%C1
Primoaa = [diff(Mp(1),q1), diff(Mp(2),q1), diff(Mp(3),q1) ; diff(Mp(1),q2),diff(Mp(2),q2),diff(Mp(3),q2); diff(Mp(1),q3),diff(Mp(2),q3),diff(Mp(3),q3)];
Secondoaa = Primoaa';
Terzoaa = diff(Mp,q1);

C1p = 1/2*(Primoaa + Secondoaa - Terzoaa);

%C2
Primobb = [diff(Mp(4),q1), diff(Mp(5),q1), diff(Mp(6),q1) ; diff(Mp(4),q2),diff(Mp(5),q2),diff(Mp(6),q2);diff(Mp(4),q3),diff(Mp(5),q3),diff(Mp(6),q3)];
Secondobb = Primobb';
Terzobb = diff(Mp,q2);

C2p = 1/2*(Primobb + Secondobb - Terzobb);

%C3
Primocc = [diff(Mp(7),q1), diff(Mp(8),q1),diff(Mp(9),q1) ; diff(Mp(7),q2),diff(Mp(8),q2),diff(Mp(9),q2);diff(Mp(7),q3),diff(Mp(8),q3),diff(Mp(9),q3)];
Secondocc = Primocc';
Terzocc = diff(Mp,q3);

C3p = 1/2*(Primocc + Secondocc - Terzocc);


%%%%%%%%%%%%%%%%%%%% 4x4 parametrizata %%%%%%%%%%%%%%%%%%%%

%C1
Primoaaa = [diff(Mq(1),q1), diff(Mq(2),q1), diff(Mq(3),q1),diff(Mq(4),q1)  ; diff(Mq(1),q2),diff(Mq(2),q2),diff(Mq(3),q2), diff(Mq(4),q2); diff(Mq(1),q3),diff(Mq(2),q3),diff(Mq(3),q3),diff(Mq(4),q3); diff(Mq(1),q4),diff(Mq(2),q4),diff(Mq(3),q4),diff(Mq(4),q4)]
Secondoaaa = Primoaaa'
Terzoaaa = diff(Mq,q1)

C1q = 1/2*(Primoaaa + Secondoaaa - Terzoaaa)

%C2
Primobbb = [diff(Mq(5),q1), diff(Mq(6),q1), diff(Mq(7),q1),diff(Mq(8),q1);diff(Mq(5),q2), diff(Mq(6),q2), diff(Mq(7),q2),diff(Mq(8),q2);diff(Mq(5),q3), diff(Mq(6),q3), diff(Mq(7),q3),diff(Mq(8),q3);diff(Mq(5),q4), diff(Mq(6),q4), diff(Mq(7),q4),diff(Mq(8),q4)];
Secondobbb = Primobbb';
Terzobbb = diff(Mq,q2);

C2q = 1/2*(Primobbb + Secondobbb - Terzobbb)

%C3
Primoccc = [diff(Mq(9),q1), diff(Mq(10),q1),diff(Mq(11),q1),diff(Mq(12),q1);diff(Mq(9),q2), diff(Mq(10),q2),diff(Mq(11),q2), diff(Mq(12),q2); diff(Mq(9),q3), diff(Mq(10),q3),diff(Mq(11),q3), diff(Mq(12),q3);diff(Mq(9),q4), diff(Mq(10),q4),diff(Mq(11),q4), diff(Mq(12),q4);];
Secondoccc = Primoccc';
Terzoccc = diff(Mq,q3);

C3q = 1/2*(Primoccc + Secondoccc - Terzoccc)

%C4
Primod = [diff(Mq(13),q1), diff(Mq(14),q1),diff(Mq(15),q1),diff(Mq(16),q1); diff(Mq(13),q2),diff(Mq(14),q2),diff(Mq(15),q2),diff(Mq(16),q2); diff(Mq(13),q3), diff(Mq(14),q3),diff(Mq(15),q3), diff(Mq(16),q3);diff(Mq(13),q4), diff(Mq(14),q4),diff(Mq(15),q4), diff(Mq(16),q4);];
Secondod = Primod';
Terzod = diff(Mq,q3);

C4q = 1/2*(Primod + Secondod - Terzod)




