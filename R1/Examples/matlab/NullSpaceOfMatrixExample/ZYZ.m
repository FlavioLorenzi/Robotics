%% FIND Z'Y'Z''  given rotation matrix
%%C'è sempre una coppia di soluzioni
%%Ci sono sempre singolarità! ! ! ! ! per esempio theta = 0 oppure = +- pi
syms alpha d a theta 
syms a1 a2 a3 a4 d1 d2 d3 d4
syms L1 L2 L3 L4
syms q1 q2 q3 q4 q5 q6 q7



singular_case = false;

% INPUT matrix 
Ri = [cos(q4)*cos(q5)*cos(q6)-sin(q4)*sin(q6)   -sin(q4)*cos(q6)-cos(q4)*cos(q5)*sin(q6)    cos(q4)*sin(q5) ;
      cos(q4)*sin(q6)+sin(q4)*cos(q5)*cos(q6)    cos(q4)*cos(q6)-sin(q4)*cos(q5)*sin(q6)    sin(q4)*sin(q5) ;
      -sin(q5)*cos(q6)                              sin(q5)*sin(q6)                             cos(q5) ];

% first check for singularities
disp("...check for singularity");
radice = sqrt((Ri(1,3))^2 + (Ri(2,3))^2) ;

if ( radice ) ~= 0
    singular_case = true;
    disp("SINGULAR CASE");
    
end

if singular_case 
    disp("FIRST solution");
    

    

    psi = atan2( Ri(3,1)/sin(theta) , Ri(3,2)/sin(theta)); %?
    theta = atan2( (radice) , Ri(3,3) )                     %?
    phi = atan2( Ri(1,3)/sin(theta) , -Ri(2,3)/sin(theta))  %?

    
    disp("SECOND solution");
    % [yaw_1 pitch_1 roll_1] = rotm2eul(Ri2,'ZYX')

    psi = atan2( Ri(3,1)/sin(theta) , Ri(3,2)/sin(theta)) %?
    theta = atan2( -(radice) , Ri(3,3))
    phi = atan2( Ri(1,3)/sin(theta) , -Ri(2,3)/sin(theta))  %?
    
else
    psi
    theta
    phi
end