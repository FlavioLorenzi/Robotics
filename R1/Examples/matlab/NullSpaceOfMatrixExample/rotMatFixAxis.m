%% ROTATION MATRICES with values with FIXED AXIS
%quando ti chiede la rotazione iniziale dopo che hai quella finale ruotata
%su un certo asse r di un certo angolo mu
%PER ESEMPIO ESONERO:   NOVEMBRE _ 2 0 1 8

syms alfa beta gamma
clc;
% INPUT
% angles alpha-beta-gamma of rotation

%%ORA PARAMETRICI ---> se dati metterci i valori numerici
a = pi/2;           
b = -pi/4;
g = pi/4;

% Possibles rotation matrices
% Rx(a) , Ry(a) , Rz(a)
% Rx(b) , Ry(b) , Rz(b)
% Rx(g) , Ry(g) , Rz(g)

% Generic Rotation Matrices

%NB commentare/scommentare a seconda di quale matrice serve per il calcolo
%che si vede dalla richiesta Euler angles XYX,YXY,ZYX ecc.....

q1 = a;

% Rx_q1 = [1 0 0 ; 0 cos(q1) -sin(q1) ; 0 sin(q1) cos(q1) ]
Ry_q1 = [cos(q1) 0 sin(q1) ; 0 1 0 ;  -sin(q1) 0 cos(q1)]
%Rz_q1 = [cos(q1) -sin(q1) 0 ; sin(q1) cos(q1) 0 ; 0 0 1 ]

q2 = b;

Rx_q2 = [1 0 0 ; 0 cos(q2) -sin(q2) ; 0 sin(q2) cos(q2) ]
%Ry_q2 = [cos(q2) 0 sin(q2) ; 0 1 0 ;  -sin(q2) 0 cos(q2)]
% Rz_q2 = [cos(q2) -sin(q2) 0 ; sin(q2) cos(q2) 0 ; 0 0 1 ]

q3 = g;

%Rx_q3 = [1 0 0 ; 0 cos(q3) -sin(q3) ; 0 sin(q3) cos(q3) ]
Ry_q3 = [cos(q3) 0 sin(q3) ; 0 1 0 ;  -sin(q3) 0 cos(q3)]
%Rz_q3 = [cos(q3) -sin(q3) 0 ; sin(q3) cos(q3) 0 ; 0 0 1 ]


%PRODOTTO TRA I TRE
FINAL_ORIENTATION_MATRIX = (Ry_q1*Rx_q2*Ry_q3)



%% BUILD rotation matrix given AXIS-ANGLE

% INPUT
ang = -pi/6;    %angolo di cui gira il frame lungo r
%i tre valori dell'asse r
r_x = 1/sqrt(3);
r_y = -1/sqrt(3);
r_z = 1/sqrt(3);

axis_ang = [r_x r_y r_z ang];
AXIS_ANGLE_ROTATION_MATRIX = axang2rotm(axis_ang)



%% BUILD INITIAL ORIENTATION

% °Ri = °Ri,f ^T * °Rf
INITIAL_ORIENTATION = AXIS_ANGLE_ROTATION_MATRIX' * FINAL_ORIENTATION_MATRIX



%%

%ESERCIZIO CAPITATO NEL 2018

%POI given position(displacement) Pab relativa ai due frame si sa la
%matrice T_ab (transformation matrix) aggiungendo pab a Rab
%per es.
syms T_ab p_b
pab = [3; 7; -1];

%inoltre se chiede di calcolare la posizione p(a) in un punto del frame a
%rispetto una posizione data p(b) del frame b (quello ruotato) è facile :
p_a = T_ab * p_b;  %VANNO SOSTITUITI I VALORI DATI A PENNA SU CARTA

%%





