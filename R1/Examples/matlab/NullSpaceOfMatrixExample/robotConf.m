robot = robotics.RigidBodyTree('DataFormat', 'column'); % robot configuration as column vector 
syms a
a=0.1;
% add first body (fixed, with an offset from ICS)   %X Y Z DI PARTENZA
body1 = robotics.RigidBody('body1');
body1.Joint = robotics.Joint('joint1', 'revolute');
T = trvec2tform([-0.5, 0 0.2])*eul2tform([pi/2 0 0]);
body1.Joint.setFixedTransform(T);
robot.addBody(body1, robot.BaseName);


% add second body (revolute joint)
body2 = robotics.RigidBody('body2');
body2.Joint = robotics.Joint('joint2', 'revolute');
body2.Joint.setFixedTransform([pi/2 a 0 pi], 'mdh');
robot.addBody(body2, 'body1');

% add third body (revolute joint)
body3 = robotics.RigidBody('body3');
body3.Joint = robotics.Joint('joint3', 'revolute');
body3.Joint.setFixedTransform([0 a 0 pi/2], 'mdh');
robot.addBody(body3, 'body2');

% add 4 body (revolute joint)
body4 = robotics.RigidBody('body4');
body4.Joint = robotics.Joint('joint4', 'revolute');
body4.Joint.setFixedTransform([0 a 0 pi], 'mdh');
robot.addBody(body4, 'body3');


robot.show