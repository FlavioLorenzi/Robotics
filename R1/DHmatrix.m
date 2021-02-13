 %%PROGRAMMA CHE CALCOLA LA MATRICE DH FINALE DATI N JOINTS E DHTABLE

%% DH transformation matrices and direct kinematics of a serial robot

clear all
clc

%% Define symbolic variables

syms alpha d a theta 
syms a1 a2 a3 a4 a5 a6 d1 d2 d3 d4 d5 d6
syms L1 L2 L3 L4
syms q1 q2 q3 q4 q5 q6
syms A B C D E F G H I L M N O P Q R S T U V Z
syms L1 L2 L3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% number of joints of ROBOT! ! ! ! ! ! ! ! 

N=2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Insert DH table of parameters of robot: [alfa, a, d, theta].

%2 giunti
if N==2


DHTABLE = [ 0       a1        0         q1;
             0       a2        0        q2];
            
end

%3 giunti
if N==3


DHTABLE = [ 0       0        q1-d1         0;
             -q2       L2       0         q2;
             q3       L3         0        q3];            
end

%4 giunti
if N==4


DHTABLE = [pi/2       a1        d1        q1;
            0          a2        0         q2;
            pi/2       0        0         q3;
              pi/2       0        d4         q4];
            
end

%6 giunti
if N==6


DHTABLE = [ pi/2       a1        d1        q1;
            0          a2        0         q2;
            pi/2       0        0         q3;
            pi/2       0        d4         q4;
            pi/2       a5       d5         q5;
             0         0       0         q6];
            
end



         
%% Build the general Denavit-Hartenberg trasformation matrix

TDH = [ cos(theta) -cos(alpha)*sin(theta)  sin(theta)*sin(alpha) a*cos(theta);
        sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
          0             sin(alpha)             cos(alpha)            d;
          0               0                      0                   1];
   


%% Build transformation matrices for each link
% First, we create an empty cell array

A = cell(1,N);

% For every row in 'DHTABLE' we substitute the right value inside
% the general DH matrix

for i = 1:N
    alpha = DHTABLE(i,1);
    a = DHTABLE(i,2);
    d = DHTABLE(i,3);
    theta = DHTABLE(i,4);
    A{i} = subs(TDH);
end

%% Direct kinematics

disp('Direct kinematics of robot in symbolic form (simplifications may need some time)')

disp(['Number of joints N=',num2str(N)])

disp('T0N(q) is the final t. matrix')
disp('NB. poi bisognerà trovare la matrice Tee-world(q)=T0world*T0N*TeeN')

disp('--------------------')
disp('NB. SE POI CHIEDE: ')
disp('?compute in an efficient way the direct kinematics p4 = p4(q) ? R3 for the position of the origin O4?')
disp('MOLTIPLICARE LA DH FINALE PER IL VETTORE COLONNA [0 0 0 1] ')


% Note: 'simplify' may need some time

T = eye(4);

for i=1:N 
    T = T*A{i};
    T = simplify(T);
end

% output TN matrix

T0N = T

% output position!!!

position = T(1:3,4)

H = T(1:4,4);

% output xN axis

n=T(1:3,1);

% output yN axis

s=T(1:3,2);

% output zN axis

a=T(1:3,3);

%Jacobiana
analyticJacobian = jacobian(position)
disp('occhio alla jacobiana che è solo quella analitica ... calcolare ogni riga con diff(riga,qi) e vedere se combacia')


%% end