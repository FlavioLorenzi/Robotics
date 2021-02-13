%Controllo cartesiano di un 2R
clc;
global l1 l2;

%lunghezza bracci robot
l1 = 1; 
l2 = 1;

%velox cartesiana desiderata (costante)
vxd = 0;
vyd = 0.5;

%Tempo totale
T = 2;

%config iniziale desiderata
q1d0 = -45*pi/180;    q2d0= 135*pi/180;
pd0 = dirkin([q1d0 q2d0]');
pxd0 = pd0(1); pyd0 = pd0(2);

%config attuale robot
q10 = -45*pi/180; q20 = 90*pi/180;
p0 = dirkin([q10 q20]');

%Matrice guadagni cartesiani
K = [20 20];
K = diag(K);

%saturazioni di velox ai giunti (input in deg/sec, convertito in rad/sec)
vmax1 = 120*pi/180;
vmax2 = 90*pi/180;








