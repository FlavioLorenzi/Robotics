%% FIND ROLL - PITCH - YAW given rotation matrix
clc;
singular_case = false;

% INPUT matrix 
Ri = [-0.1161   -0.8797    0.4612 ; -0.3416    0.4714    0.8131 ;  -0.9326   -0.0632   -0.3553 ];

% first check for singularities
disp("...check for singularity");
cos2pitch = sqrt((Ri(3,2))^2 + (Ri(3,3))^2) ;

if ( cos2pitch ) ~= 0
    singular_case = true;
    disp("SINGULAR CASE");
    
end

if singular_case 
    disp("FIRST solution");
    eul= rotm2eul(Ri,'ZYX');

    % roll1 = eul(3)
    % pitch1 = eul(2)
    % yaw1 = eul(1)

    roll1 = atan2( Ri(3,2)/cos2pitch , Ri(3,3)/cos2pitch)
    pitch1 = atan2( (-Ri(3,1)) , (cos2pitch) )
    yaw1 = atan2( Ri(2,1)/cos2pitch , Ri(1,1)/cos2pitch)

    
    disp("SECOND solution");
    % [yaw_1 pitch_1 roll_1] = rotm2eul(Ri2,'ZYX')

    roll2 = atan2( Ri(3,2)/-cos2pitch , Ri(3,3)/-cos2pitch)
    pitch2 = atan2( (-Ri(3,1)) , -(cos2pitch) )
    yaw2 = atan2( Ri(2,1)/-cos2pitch , Ri(1,1)/-cos2pitch)
    
else
    roll1 = eul(3)
    pitch1 = eul(2)
    yaw1 = eul(1)
end