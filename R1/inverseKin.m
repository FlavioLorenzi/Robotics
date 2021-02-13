%SCRIPT PER I CALCOLI CHE SERVONO NELLA INVERSE KINEMATICS
syms theta q1 q2 q3 q4 a1 a2 a3 a4;
syms px py;


%GIVEN THE POSITION OF THE END EFFECTOR p = {px, py}

%Operazioni metodo algebrico
s2 = sqrt{1-cos^2}
c2 = (px^2 + py^2 - a1^2 - a2^2) / (2*a1*a2);