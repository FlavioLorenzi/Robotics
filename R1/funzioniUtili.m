syms l1 q1 q2 q3 l2;
syms A B C D;

%Calcola la derivata e quella parziale
F1 = A*cos(q1) + D*cos(q1 +q2);
diff(F1); 
PARZIALE1 = diff(F1,q1) %elementi della prima riga
PARZIALE2 = diff(F1,q2)

F2 = A*sin(q1) + D*sin(q1 +q2);
diff(F2); 
PARZIALE3 = diff(F2,q1) %elementi seconda riga
PARZIALE4 = diff(F2,q2)


%Calcola l'integrale
Y = l1*cos(q1) + l2*cos(q1+q2);
int(Y)   %se lo si vuole definito : q=int(FUN,a,b)           


%Data una matrice
A = [-2*sin(q1), -sin(q1);
     2*cos(q1), cos(q1)];
 
%Calcola la matrice trasposta
TRASPOSTA = A.'

%Calcola la matrice inversa
INVERSA = A^(-1); %in questo caso da FAIL perche il det = 0;

%Rango e determinante
RANGO = rank(A)
DETERMINANTE = det(A)

%Atangente2
atangentedue = atan2(4,5)



%DA ANGOLI A RADIANTI(VALORE MATLAB) e viceversa
%NB: quando trovo con atan2(x,y) un certo valore per ottenere il grado devo
%fare grado = val*180/pi
val = 0.7; %val  sarebbe pi/4 che matlab legge in val
grad = val * 180/pi; %gradi

valn = 135; %gradi
angn = valn * pi/180;  %val



