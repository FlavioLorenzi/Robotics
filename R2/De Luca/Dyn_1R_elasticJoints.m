% dynamic model of 1R robot with joint elasticity
% Lagrangian formulation in symbolic form
% A. De Luca
% 23 March 2010

clear all
clc

syms m d Im I k %symbolic variables are not explicitly defined as real (use ".'" real transpose)
syms q th dq dth g0 tau 

disp('**** dynamic model of 1R robot with elastic joint in the vertical plane ****')
disp(' ')

pause

disp('*kinetic energy of motor*')

Tm=(1/2)*Im*dth^2

pause

disp('*kinetic energy of link*')

Tl=(1/2)*(I+m*d^2)*dq^2

pause

disp('**robot kinetic energy**')

T=simplify(Tm+Tl);
T=collect(T,I+m*d^2)

pause

disp('***robot inertia matrix***')

B(1,1)=diff(T,dth,2);
B(2,2)=diff(T,dq,2);
TempB12=diff(T,dq);
B(1,2)=diff(TempB12,dth);
B(2,1)=B(1,2);
B=simplify(B)

pause

disp('*Christoffel matrices*')

qt=[th;q];
b1=B(:,1);
C1=(1/2)*(jacobian(b1,qt)+jacobian(b1,qt).'-diff(B,th))
b2=B(:,2);
C2=(1/2)*(jacobian(b2,qt)+jacobian(b2,qt).'-diff(B,q))

pause

disp('***robot Coriolis and centrifugal term***')

dqt=[dth;dq];
c1=dqt.'*C1*dqt;
c2=dqt.'*C2*dqt;
c=[c1;c2]

pause 

disp('*potential (gravitational) energy of motor*')

Um=0

pause

disp('*potential (gravitational) energy of link*')
    
Ul=-m*g0*d*cos(q)

pause

disp('*potential elastic energy (of joint)*')
    
Ue=(1/2)*k*(q-th)^2

pause

disp('**robot total potential energy**')

U=simplify(Um+Ul+Ue)

pause

disp('***robot gravity+elasticity term***')

G=jacobian(U,qt).';
G=collect(G,k);
G=simplify(G)

pause

disp('***robot external (rhs) torques***')

u=[tau;0]

disp('***end***')

% end