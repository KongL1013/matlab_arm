
% 
thetax(1)=25;thetay(1)=0;
thetax(2)=25;thetay(2)=0;
thetax(3)=10;thetay(3)=0;
thetax(4)=-25;thetay(4)=0;
thetax(5)=-15;thetay(5)=0;
thetax(6)=10;thetay(6)=0;
thetax(7)=-10;thetay(7)=0;
thetax(8)=10;thetay(8)=0;
thetax(9)=-10;thetay(9)=0;
thetax(10)=10;thetay(10)=0;
thetax(11)=-10;thetay(11)=0; 
thetax(12)=10;thetay(12)=0;
% thetax(1)=25;thetay(1)=0;
% thetax(2)=25;thetay(2)=0;
% thetax(3)=10;thetay(3)=0;
% thetax(4)=-25;thetay(4)=0;
% thetax(5)=-15;thetay(5)=0;
% thetax(6)=4;thetay(6)=-5;
% thetax(7)=0;thetay(7)=-5;
% thetax(8)=0;thetay(8)=-5;
% thetax(9)=0;thetay(9)=-2;
% thetax(10)=0;thetay(10)=0;
% thetax(11)=-25;thetay(11)=0; 
% thetax(12)=-15;thetay(12)=0;
Pbx=0;
Pby=200;
Pbz=-150;
linkl=143.5;
jointl=6.5;
[~,~,keypointm]=drawoc12180228(thetax(1),thetay(1),thetax(2),thetay(2),thetax(3),thetay(3),thetax(4),thetay(4),thetax(5),thetay(5),thetax(6),thetay(6),...
            thetax(7),thetay(7),thetax(8),thetay(8),thetax(9),thetay(9),thetax(10),thetay(10),thetax(11),thetay(11),thetax(12),thetay(12),Pbx,Pby,Pbz,0); 
axis equal