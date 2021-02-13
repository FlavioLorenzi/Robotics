%%ULIVI
%%
% calcolo iterativo cinematica inversa
% 2 link planare con inv(Jac)

clear all
l1=1; l2=0.5;

q(1,1)=pi/6; q(1,2)=pi/3;

% Cinemeatica diretta
p=[l1*cos(q(1))+l2*cos(q(1)+q(2));...
   l1*sin(q(1))+l2*sin(q(1)+q(2))]; 

target=p; % calcolato tramite cinem. diretta perché sia nel WS

q(1,1)=0.1; q(1,2)=0.1;   %valori iniziali
for i=1:100
    p(:,i)=[l1*cos(q(i,1))+l2*cos(q(i,1)+q(i,2));...
       l1*sin(q(i,1))+l2*sin(q(i,1)+q(i,2))];
   
    Jac=[-l1*sin(q(i,1))-l2*sin(q(i,1)+q(i,2)), -l2*sin(q(i,1)+q(i,2));...
         l1*cos(q(i,1))+l2*cos(q(i,1)+q(i,2)), l2*cos(q(i,1)+q(i,2))];
    invJac=Jac^(-1);
    q(i+1,:)=q(i,:)+(invJac*[target-p(:,i)])';
    if norm(target-p(:,i))<= 0.01, break, end
end
i