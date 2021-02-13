%% ROTATION MATRICES 
%PROGRAMMA GENERALE PER IL CALCOLO DELLE MATRICI DI ROTAZIONE (relativa ai CAPITOLI SUGLI ANGOLI...)
%%
%ANGOLI Z'Y'Z''
%%


% Generic Rotation Matrices

%NB commentare/scommentare a seconda di quale matrice serve per il calcolo
%che si vede dalla richiesta Euler angles XYX,YXY,ZYX ecc.....
alfa = pi/2;
q1 = alfa;

Rx_q1 = [1 0 0 ; 0 cos(q1) -sin(q1) ; 0 sin(q1) cos(q1) ];
Ry_q1 = [cos(q1) 0 sin(q1) ; 0 1 0 ;  -sin(q1) 0 cos(q1)];
Rz_q1 = [cos(q1) -sin(q1) 0 ; sin(q1) cos(q1) 0 ; 0 0 1 ];


beta = pi/2;
q2 = beta;

Rx_q2 = [1 0 0 ; 0 cos(q2) -sin(q2) ; 0 sin(q2) cos(q2) ];
Ry_q2 = [cos(q2) 0 sin(q2) ; 0 1 0 ;  -sin(q2) 0 cos(q2)];
Rz_q2 = [cos(q2) -sin(q2) 0 ; sin(q2) cos(q2) 0 ; 0 0 1 ];


gamma = pi/4;
q3 = gamma;

Rx_q3 = [1 0 0 ; 0 cos(q3) -sin(q3) ; 0 sin(q3) cos(q3) ];
Ry_q3 = [cos(q3) 0 sin(q3) ; 0 1 0 ;  -sin(q3) 0 cos(q3)];
Rz_q3 = [cos(q3) -sin(q3) 0 ; sin(q3) cos(q3) 0 ; 0 0 1 ];


%PRODOTTO TRA I TRE
%mettere nella parentesi ciò che serve
FINAL_ORIENTATION_MATRIX = (Ry_q1*Rx_q2*Ry_q3)



%%

%ANGOLI ROLL PITCH YAW
%qui il prodotto va rispettato nella forma Z Y X
syms phi theta psi;
%phi = 0;
Rz(phi) = [cos(phi) -sin(phi) 0 ; sin(phi) cos(phi) 0 ; 0 0 1 ]
%theta = 0;
Ry(theta) = [cos(theta) 0 sin(theta) ; 0 1 0 ;  -sin(theta) 0 cos(theta)]
%psi = 0;
Rx(psi) = [1 0 0 ; 0 cos(psi) -sin(psi) ; 0 sin(psi) cos(psi) ]


NEW_FINAL_ORIENT_MATRIX = Rz(phi)*Ry(theta)*Rx(psi)


%%
%CALCOLO INVERSO DEI VALORI PHI THETA PSI
%Vedere le formule con ATAN ---> c'è uno script apposta RPY! ! ! ! !
