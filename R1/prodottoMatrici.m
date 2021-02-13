%SEMPLICE PROGRAMMA CHE MOLTIPLICA LE MATRICI RIGA X COLONNA
%creazione matrici e simboli
syms d1 d2 d3 d4 q1 q2 q3 q4 q5 d5
%syms x y z
x = pi/2;
y = -pi/4;
z = pi/4;

%prima matrice
a = [sin(q1);-cos(q1);0];
 
%seconda matrice
b = [cos(q1)*(q3*sin(q2)-q5*sin(q2+q4));
    sin(q1)*(q3*sin(q2)-q5*sin(q2+q4));
    -q3*cos(q2)+q5*cos(q2+q4) - q3];
 

R1 =[
 
 cos(q1) 0                                           sin(q1);
 sin(q1)  0                                          -cos(q1);
       0                                  1 0];


R2 =[
 
 cos(q2) 0                                           sin(q2);
 sin(q2)  0                                          -cos(q2);
       0                                  1 0];
   

   
   prod = R1*R2
   
   prodNuovo = prod*[-1 0 0;0 0 1; 0 1 0]    %0 R 3
   
   
   
  
   %n = cross(a,b)
   %x = n*c;
   %x = inv(n);
   %y = O'/det(O);
  % p = a*c;
  %disp(x);

