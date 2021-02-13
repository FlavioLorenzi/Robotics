%Script che plotta il grafico di un robot dati i giunti
%e dati i [valori a alpha d theta] della DH

%INOLTRE E' IN GRADO DI CALCOLARE IL JACOBIANO GEOMETRICO PER LA INVERSE K.

syms l1 l2 l3 l4
syms q1 q2 q3 q4
syms a1 a2 a3 a4
syms 
syms a alpha d theta
clc;

robot = robotics.RigidBodyTree('DataFormat', 'column'); % robot configuration as column vector 

% add first body (fixed, with an offset from ICS)
body1 = robotics.RigidBody('body1');
body1.Joint = robotics.Joint('joint1', 'revolute');
T = trvec2tform([-0.5, 0 0.2])*eul2tform([pi/2 pi 0]);
body1.Joint.setFixedTransform(T);
robot.addBody(body1, robot.BaseName);


% add second body (revolute joint)
body2 = robotics.RigidBody('body2');
body2.Joint = robotics.Joint('joint2', 'revolute');
body2.Joint.setFixedTransform([0.5 pi/2 0 pi], 'mdh');
robot.addBody(body2, 'body1');

body3 = robotics.RigidBody('body3');
body3.Joint = robotics.Joint('joint3', 'revolute');
body3.Joint.setFixedTransform([0.5 0 pi pi/2], 'mdh');
robot.addBody(body3, 'body2');

body4 = robotics.RigidBody('body4');
body4.Joint = robotics.Joint('joint4', 'revolute');
body4.Joint.setFixedTransform([0.5 0 0 pi], 'mdh');
robot.addBody(body4, 'body3');






robot.show

%calcolo J
%Jac = robot.geometricJacobian([0; 0], 'body4');