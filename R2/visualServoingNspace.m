% null space of point feature interaction matrix
   clear all
   clc
   syms lam u v Z real
   
  
J=[ -lam/Z, 0, u/Z, (u*v)/lam, - u^2/lam - lam, v; 0, -lam/Z, v/Z, v^2/lam + lam, -(u*v)/lam, -u];
N=null(J)

% check special case for u=v=0 (point at the center of the image plane)
Norigin=subs(N,[u,v],[0,0])

% check alternative solution (a pure rotation with v = 0) that Matlab does not provide as such
nrot=simplify(u*N(:,2)+v*N(:,3)+lam*N(:,4))
verifynrot=simplify(J*nrot)

%note that a pure translation is verified in the first column of N where
%v = 0 (last element w = 0)