%%PROGRAMMA SEMPLICE CHE DATA LA TABELLA DH SOSTITUISCE I VALORI E CALCOLA 
%%LA MATRICE T PER UN SINGOLO GIUNTO i
%%NB
%%CALCOLO DI A SINGOLA! ! ! 
syms alpha d a theta 
syms a1 a2 a3 a4 d1 d2 d3 d4
syms L1 L2 L3 L4
syms q1 q2 q3 q4
syms A B C D E F G H I J K


alpha = 0;
a = 0;
d= 0;
theta= -pi/2;

%calcola matrice normale
disp('matrice A');

TDH = [ cos(theta) -sin(theta)*cos(alpha)  sin(theta)*sin(alpha) a*cos(theta);
        sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
          0             sin(alpha)             cos(alpha)            d;
          0               0                      0                   1]
      
R = [ cos(theta) -sin(theta)*cos(alpha)  sin(theta)*sin(alpha) ;
        sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) ;
          0             sin(alpha)             cos(alpha)       ];
      
     
  
R = vpa(R)
%disp('trasposta');
disp(' ');
%stampa la trasposta      
%disp(TDH');    


disp('NB :per calcolare solo la matrice ROTAZIONALE R si cancellano ultima colonna e ultima riga ---> 3x3 matrix');
