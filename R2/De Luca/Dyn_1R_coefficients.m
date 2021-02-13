%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise on identification of robot dynamic coefficients 
% by Claudio Gaz (gaz@diag.uniroma1.it)
% April 18, 2018

% hint: run the file in cell mode (showing successive results in progress!)
% otherwise in two parts with two pauses in between

% 1R robot under gravity (vertical plane)

clear all
close all
clc

deltat = 0.01; % [s]
t = 0:deltat:5;
g0 = 9.81; % [m/s^2]

L1 = 3; % [m]
m1 = 10; % [kg]
I1zz = 1/12*m1*L1^2; % [kg*m^2] 
d1 = L1/2; % [m] (...we do not need to suppose a uniform mass distribution!)

%%
% exciting trajectory for identification (pos, vel, acc)

q1 = sin(3*t);
dq1 = 3*cos(3*t);
ddq1 = -9*sin(3*t);

% note: in case symbolic differentiation is not possible,
% obtain velocity and acceleration from numerical derivation as:
% dq1 = diff(q1)/deltat; 
% dq1 = [dq1 , dq1(end)];
% ddq1 = diff(dq1)/deltat;
% ddq1 = [ddq1 , ddq1(end)];

% plot trajectories

figure;
plot(t,q1,t,dq1,t,ddq1);
grid;
legend('pos [rad]','vel [rad/s]','acc [rad/s^2]');
xlabel('time [s]');title('reference motion used for identification');

%%
% compute the inverse dynamics torque according to the 
% symbolic dynamic model of the 1R robot under gravity

% additive random noise to torque signal (with average approx = 0)
% (note that every run will be different!!)

noise1 = 3*rand(1,length(t)); 
noise2 = -3*rand(1,length(t));
tau1 = ddq1*(I1zz + m1*d1^2) + g0*m1*d1*sin(q1) + noise1 + noise2; 

% in alternative: multiplicative random noise (proportional by max 5% to tau)
% tau1 = (ddq1*(I1zz + m1*d1^2) + g0*m1*d1*sin(q1)).*(1+0.05*rand(1,length(t))); 

figure
plot(t,tau1);
grid;
xlabel('time [s]');ylabel('\tau_1 [Nm]');
title('nominal torque (with added noise)');

%%
% CASE 1 - REGRESSOR IS NOT FULL RANK 
% (non-minimal parametrization)
% Y1 = [ddq1 , ddq1 , sin(q1)]    a1 = [I1zz; m1*d1^2; g0*m1*d1]

Y1_stack = []; % stacked regressor (numerical)
tau_meas_1 = []; % stacked torque measures (numerical)
for i=1:length(t)
    Y1_stack = [Y1_stack ; ddq1(i) , ddq1(i) , sin(q1(i))];
    tau_meas_1 = [tau_meas_1 ; tau1(i)];
end
a1_est = pinv(Y1_stack)*tau_meas_1; % compute dynamic coefficients by pseudoinversion
a1_real = [I1zz ; m1*d1^2; g0*m1*d1]; % real values of dynamic coefficients

disp('CASE 1: non-minimal parametrization')
disp(' ')
disp('real coefficients:');
disp(a1_real);
disp('estimated coefficients:');
disp(a1_est);
disp('...only the last coefficient has been reasonably estimated! why?');
pause

%%
disp(' ')
disp('rank regressor Y1_stack:');
disp(rank(Y1_stack))
disp('the regressor is not full rank: estimated values are (typically) not meaningful...');

%%
% even when using a deficient rank regressor for obtaining (wrong) estimates 
% of dynamic coefficients, the estimated torques will be computed correctly!

% validation trajectory (different from the one used for identification)

q1_val = -sin(2*t);
dq1_val = -2*cos(2*t);
ddq1_val = 4*sin(2*t);

% compute the torques for the validation trajectory

tau1_val_real = ddq1_val*(I1zz + m1*d1^2) + g0*m1*d1*sin(q1_val);

% compute the estimated torques, given by Y*(pi_hat)

tau_val_est = zeros(1,length(t));
for i=1:length(t)
    tau1_val_est(i) = [ddq1_val(i) , ddq1_val(i) , sin(q1_val(i))] * a1_est;
end

figure
plot(t,tau1_val_real,t,tau1_val_est);
grid;
xlabel('time [s]');title('real versus estimated torques (despite bad coefficient estimations)');
legend('real \tau_1','estimated \tau_1');
annotation('textarrow',[0.48,0.54],[0.85,0.8],'String','profiles are practically overlapping')
disp(' ')
disp('however, despite wrong estimations of coefficients,') 
disp('we correctly estimate the torque profile!');

pause % can be eliminated when running in cell mode...
%clc

%%
% CASE 2 - REGRESSOR IS FULL RANK
% (minimal parametrization)
% Y1 = [ddq1 , sin(q1)]    a1 = [I1zz + m1*d1^2; g0*m1*d1]

% if a full-rank regressor is used, the estimated
% dynamic coefficients will be correct

Y1_stack = [];
tau_meas_1 = [];
for i=1:length(t)
    Y1_stack = [Y1_stack ; ddq1(i) , sin(q1(i))];
    tau_meas_1 = [tau_meas_1 ; tau1(i)];
end
a1_est_new = pinv(Y1_stack)*tau_meas_1;
a1_real = [I1zz + m1*d1^2; g0*m1*d1];

disp(' ')
disp('CASE 2: minimal parametrization')
disp(' ')
disp('real coefficients:');
disp(a1_real);
disp('estimated coefficients:');
disp(a1_est_new);
disp('...now the two coefficients have been correctly estimated');

%%
tau_val_est_new = zeros(1,length(t));
for i=1:length(t)
    tau1_val_est_new(i) = [ddq1_val(i) , sin(q1_val(i))] * a1_est_new;
end

figure
plot(t,tau1_val_real,t,tau1_val_est);
grid;
xlabel('time [s]');title('real versus estimated torques');
legend('real \tau_1','estimated \tau_1');
annotation('textarrow',[0.48,0.54],[0.85,0.8],'String','profiles are again overlapping')
disp(' ')
disp('conclusion: using a minimal parametrization (and a full-rank regressor),')
disp('dynamic coefficients as well as torque profiles are correctly estimated');

% end