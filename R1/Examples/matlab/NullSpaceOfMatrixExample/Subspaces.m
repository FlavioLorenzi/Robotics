
%%PROGRAMMA CHE DATI q1 q2 q3 E LA MATRICE f(q) 'p' ,CALCOLA LA SUA
%%JACOBIANA; INSERENDO POI LE q RICAVATE, RESTITUISCE I SOTTOSPAZI

% Subspaces (images and kernels) of the Jacobian of a robot and their dimensions


clear all
clc

syms q1 q2 q3 q4 real
syms a1 a2 a3 a4
syms d1 d2 d3 d4
syms A B C D

disp('Subspace analysis (range and null spaces): R(J), N(J), R(J^T), N(J^T)')
disp('of the robot Jacobian (a mxn matrix) in a given configuration q')

disp(' ')
disp('robot: planar 3R arm with unitary links (n=3)')
disp('task: end-effector position in the plane (m=2)')

disp(' ')
disp('direct (task) kinematics')

%inserire la matrice ottenuta dalla direct kinematics p
  p = [q4*sin(q1 + q3) + q2*sin(q1);
    -q4*cos(q1 + q3) - q2*cos(q1);
     q1 + q3]
  


q=[q1 q2 q3]';

%%CALCOLO JACOBIANA .  (derivata dip)
disp('Jacobian (a 2x3 matrix)')
Jac=jacobian(p,q)
pause

%A SECONDA DEL CASO SCOMMENTARE O COMMENTARE PRIMO O SECONDO CASO

% first case: a configuration that is regular

%disp('REGULAR CASE: in the configuration q=(0, pi/2, pi/2)') %(0, pi/2, pi/4)
%disp(' ')
%disp('a) working with the Jacobian')
%J=subs(Jac,{q1,q2,q3},{0,pi/2,pi/2}) %{0,pi/2,pi/4}
%pause

% second case: a configuration that is singular

 disp('SINGULAR CASE: in the configuration q=(pi/2, 0, pi)')
 disp(' ')
 disp('a) working with the Jacobian')
 J=subs(Jac,{q1,q2,q3},{q1,0, 0})   %{q1,pi,0}  %se q2 assume due valori!!!
 
 pause

rankJ=rank(J)
pause

NullSpaceJ=null(J)
dimNullSpaceJ=size(NullSpaceJ,2);
disp('normalizing...')
if dimNullSpaceJ>1
   NullSpaceJ(:,1)=NullSpaceJ(:,1)/norm(NullSpaceJ(:,1));
   NullSpaceJ(:,2)=NullSpaceJ(:,2)/norm(NullSpaceJ(:,2));
   NullSpaceJ
else
   NullSpaceJ=NullSpaceJ/norm(NullSpaceJ)
end
pause

dimNullSpaceJ=size(NullSpaceJ,2)
pause

disp('check null-space joint velocity: J*NullSpaceJ ?')
pause
simplify(J*NullSpaceJ)
pause

RangeJ=orth(J)
%RangeJ=simplify(orth(J))
pause

dimRangeSpaceJ=size(RangeJ,2)
pause

disp('b) working with the Jacobian transpose')
JT=J'
pause

rankJT=rank(JT)
pause

NullSpaceJT=null(JT);
dimNullSpaceJT=size(NullSpaceJT,2);
if dimNullSpaceJT>0
   NullSpaceJT=NullSpaceJT/norm(NullSpaceJT)
else
   NullSpaceJT
end
pause

dimNullSpaceJT=size(NullSpaceJT,2)
pause

RangeJT=orth(JT);
RangeJT=simplify(RangeJT)
dimRangeSpaceJT=size(RangeJT,2);
disp('de-normalizing...') %assuming that the first elements of the columns are non-zero, else...
RangeJT(:,1)=RangeJT(:,1)/RangeJT(1,1);
if dimRangeSpaceJT>1
   RangeJT(:,2)=RangeJT(:,2)/RangeJT(1,2);
end
RangeJT
pause

dimRangeSpaceJT=size(RangeJT,2)
pause

disp('c) final check on dimensions of subspaces')

disp(' ')
disp('dim Range(J) + dim Null(J^T) ?')
pause 
dimRangeSpaceJ+dimNullSpaceJT
disp('..equal to the task-space dimension')
pause

disp(' ')
disp('dim Range(J^T) + dim Null(J) ?')
pause
dimRangeSpaceJT+dimNullSpaceJ
disp('..equal to the joint-space dimension')

% end