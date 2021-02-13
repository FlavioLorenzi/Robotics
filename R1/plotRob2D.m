% grafico semplice di un due link planare
% da usare dopo cininvJac o cinJacTra
clf

figure(3)
axis([-1.5 1.5 -1.5 1.5])
hold on
 P1=[0,0];
 for i=1:max(size(q))
     P2=[l1*cos(q(i,1)), l1*sin(q(i,1))];
     P3=P2+[l2*cos(q(i,1)+q(i,2)), l2*sin(q(i,1)+q(i,2))];
     plot([P1(1),P2(1),P3(1)],[P1(2),P2(2),P3(2)]);
     drawnow
     pause(0.2)
 end
hold off
