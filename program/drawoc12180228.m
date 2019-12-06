%Author:Tanglei
%Date:2017\8\10
%Modify date:
%version:v1
%Abstract:
%1...This code is to find the offsets between key points and target
%curves.And then find the factors that will have influence on offsets
%2...Because of unsmooth of Velocity curve, I try to interploted between
%the points
%Date:2018\february\28
%Modify date:
%version:v2
%Abstract:
%1...This code is to find the offsets between key points and target
%curves.And then find the factors that will have influence on offsets
%2...Because of unsmooth of Velocity curve, I try to interploted between
%the points
%Date:2018\April\24
function [LengthOfCables,KeyPoint,KeyPointM]=drawoc12180228(theta1x,theta1y,theta2x,theta2y,theta3x,theta3y,theta4x,theta4y,theta5x,theta5y,theta6x,theta6y, ...
                                   theta7x,theta7y,theta8x,theta8y,theta9x,theta9y,theta10x,theta10y,theta11x,theta11y,theta12x,theta12y,Pbx,Pby,Pbz,thetaPB)
% view1=55;
% view2=35;
view1=70;
view2=35;
% view1=90;
% view2=90;
  axisxN=-600; axisxP=800;
  axisyN=-600; axisyP=600;
  axiszN=-650; axiszP=2200;                                              
                               
%--------------------------------基座运动-----------------------------------          
T1=[cos(thetaPB) -sin(thetaPB) 0 Pbx
    sin(thetaPB) cos(thetaPB) 0 Pby
    0 0 1 Pbz
    0 0 0 1]; 
%--------------------------------基座运动-----------------------------------  
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                  %变换矩阵
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% theta1x=0;theta1y=1;%万向节1角度
% 
% theta2x=0;theta2y=2;%万向节2角度
% 
% theta3x=0;theta3y=3;%万向节3角度
% 
% theta4x=0;theta4y=4;%万向节4角
% 
% theta5x=0;theta5y=5;%万向节5角度
% 
% theta6x=0;theta6y=6;%万向节6角度
% 
% theta7x=0;theta7y=7;%万向节1角度
% 
% theta8x=0;theta8y=8;%万向节2角度
% 
% theta9x=0;theta9y=9;%万向节3角度
% 
% theta10x=0;theta10y=10;%万向节4角
% 
% theta11x=0;theta11y=11;%万向节5角度
% 
% theta12x=0;theta12y=12;%万向节6角度
jointl=6.5;
linkl=84.5;
T121=[cosd(theta1y)  0   sind(theta1y)  0
              0     1     0           0
     -sind(theta1y)  0   cosd(theta1y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵         
        
T112=T1*T121; 
% T112=T121; 
%------------------------------------1---------------------------------------%          

T132=[1        0               0        0
      0    cosd(theta1x)  -sind(theta1x)  0
      0    sind(theta1x)   cosd(theta1x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T113=T112*T132;%关节1中，3相对于1的变换坐标          
%------------------------------------1---------------------------------------%        
T21=[1 0 0 0
    0 1 0 0
    0 0 1 linkl
    0 0 0 1];%%-----------------------------------------------------------------------------T21与后面的重复-------------------------------------%

T211=T113*T21;%第二节基座标相对于第一节基座标
%------------------------------------2---------------------------------------%

T221=[cosd(theta2y)  0   sind(theta2y)  0
              0     1     0           0
     -sind(theta2y)  0   cosd(theta2y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵       
T212=T211*T221;
%------------------------------------2---------------------------------------%

T232=[1        0               0        0
      0    cosd(theta2x)  -sind(theta2x)  0
      0    sind(theta2x)   cosd(theta2x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T213=T212*T232;
%------------------------------------2---------------------------------------%

T311=T213*T21;%T21=T32

%------------------------------------3---------------------------------------%

T321=[cosd(theta3y)  0   sind(theta3y)  0
              0     1     0           0
     -sind(theta3y)  0   cosd(theta3y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵
T312=T311*T321;          
%------------------------------------3---------------------------------------%

T332=[1        0               0        0
      0    cosd(theta3x)  -sind(theta3x)  0
      0    sind(theta3x)   cosd(theta3x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T313=T312*T332;
%------------------------------------3---------------------------------------%

T411=T313*T21;

%------------------------------------4---------------------------------------%

T421=[cosd(theta4y)  0   sind(theta4y)  0
              0     1     0           0
     -sind(theta4y)  0   cosd(theta4y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵         
T412=T411*T421;
%------------------------------------4---------------------------------------%

T432=[1        0               0        0
      0    cosd(theta4x)  -sind(theta4x)  0
      0    sind(theta4x)   cosd(theta4x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T413=T412*T432;
%------------------------------------4---------------------------------------%

T511=T413*T21;

%------------------------------------5---------------------------------------%

T521=[cosd(theta5y)  0   sind(theta5y)  0
              0     1     0           0
     -sind(theta5y)  0   cosd(theta5y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵
T512=T511*T521;          
%------------------------------------5---------------------------------------%

T532=[1        0               0        0
      0    cosd(theta5x)  -sind(theta5x)  0
      0    sind(theta5x)   cosd(theta5x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T513=T512*T532;
%------------------------------------5---------------------------------------%
 
T611=T513*T21;

%------------------------------------6---------------------------------------%

T621=[cosd(theta6y)  0   sind(theta6y)  0
              0     1     0           0
     -sind(theta6y)  0   cosd(theta6y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵
T612=T611*T621;
%------------------------------------6---------------------------------------%          

T632=[1        0               0        0
      0    cosd(theta6x)  -sind(theta6x)  0
      0    sind(theta6x)   cosd(theta6x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T613=T612*T632;
%------------------------------------6---------------------------------------%   


T711=T613*T21;


%------------------------------------7---------------------------------------%   

T721=[cosd(theta7y)  0   sind(theta7y)  0
              0     1     0           0
     -sind(theta7y)  0   cosd(theta7y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵
T712=T711*T721; 
%------------------------------------7---------------------------------------%          

T732=[1        0               0        0
      0    cosd(theta7x)  -sind(theta7x)  0
      0    sind(theta7x)   cosd(theta7x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T713=T712*T732;%关节1中，3相对于1的变换坐标          
%------------------------------------7---------------------------------------%        
T811=T713*T21;%第二节基座标相对于第一节基座标
%------------------------------------8---------------------------------------%

T821=[cosd(theta8y)  0   sind(theta8y)  0
              0     1     0           0
     -sind(theta8y)  0   cosd(theta8y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵       
T812=T811*T821;
%------------------------------------8---------------------------------------%

T832=[1        0               0        0
      0    cosd(theta8x)  -sind(theta8x)  0
      0    sind(theta8x)   cosd(theta8x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T813=T812*T832;
%------------------------------------8---------------------------------------%
T911=T813*T21;
%------------------------------------9---------------------------------------%

T921=[cosd(theta9y)  0   sind(theta9y)  0
              0     1     0           0
     -sind(theta9y)  0   cosd(theta9y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵
T912=T911*T921;          
%------------------------------------9 --------------------------------------

T932=[1        0               0        0
      0    cosd(theta9x)  -sind(theta9x)  0
      0    sind(theta9x)   cosd(theta9x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T913=T912*T932;
%------------------------------------9---------------------------------------%

T1011=T913*T21;
%------------------------------------10---------------------------------------%

T1021=[cosd(theta10y)  0   sind(theta10y)  0
              0     1     0           0
     -sind(theta10y)  0   cosd(theta10y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵         
T1012=T1011*T1021;
%------------------------------------10---------------------------------------%

T1032=[1        0               0        0
      0    cosd(theta10x)  -sind(theta10x)  0
      0    sind(theta10x)   cosd(theta10x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T1013=T1012*T1032;
%------------------------------------10---------------------------------------%

T1111=T1013*T21;
%------------------------------------11---------------------------------------%

T1121=[cosd(theta11y)  0   sind(theta11y)  0
              0     1     0           0
     -sind(theta11y)  0   cosd(theta11y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵
T1112=T1111*T1121;          
%------------------------------------11---------------------------------------%

T1132=[1        0               0        0
      0    cosd(theta11x)  -sind(theta11x)  0
      0    sind(theta11x)   cosd(theta11x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T1113=T1112*T1132;
%------------------------------------11---------------------------------------%

T1211=T1113*T21;
%------------------------------------12---------------------------------------%

T1221=[cosd(theta12y)  0   sind(theta12y)  0
              0     1     0           0
     -sind(theta12y)  0   cosd(theta12y)  jointl
              0     0     0           1];%坐标系1相对于坐标系0的过渡矩阵
T1212=T1211*T1221;
%------------------------------------12---------------------------------------%          

T1232=[1        0               0        0
      0    cosd(theta12x)  -sind(theta12x)  0
      0    sind(theta12x)   cosd(theta12x)  0
      0        0               0        1];%坐标系1相对于坐标系0的过渡矩阵
T1213=T1212*T1232;
% p=[0;0;0;1];
% p=T1213*p
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                  %绘图
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

clf;%%清除上一帧
%% get midpoint positions
% T113*[0;0;0;1]
% T213*[0;0;0;1]
% T313*[0;0;0;1]
%% ====================================%cardan11=========================================
[cardancy111,cardancy1111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan112]=cubefun(12,2,jointl,0,14,jointl/2);%分别为长宽高及中心点坐标，背景
[cardanx113]=cubefun(12,2,jointl,0,-14,jointl/2);%分别为长宽高及中心点坐标，背景
[tube11,tube12]=cyfun(22.5,linkl-jointl-8,0,0,-(linkl-jointl-4));%管1半径和高及底面坐标

i=1:21;f(i)=i;
face=[1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];%按顶点顺序选择绘图面

cardancy111=T1*cardancy111;
cardancy1111=T1*cardancy1111;
cardan112=T1*cardan112';
cardan113=T1*cardanx113';
tube11=T1*tube11;
tube12=T1*tube12;%坐标变换


[cardancy111x,cardancy111y,cardancy111z]=extract(cardancy111,cardancy1111);
[tube1x,tube1y,tube1z]=extract(tube11,tube12);
cardancyf1111=[cardancy1111(1,:);cardancy1111(2,:);cardancy1111(3,:)]';
cardanface112=[cardan112(1,:);cardan112(2,:);cardan112(3,:)]';
cardanface113=[cardan113(1,:);cardan113(2,:);cardan113(3,:)]';%提取绘图坐标

surf(tube1x,tube1y,tube1z,'FaceColor',[0 0.2 0.2],'facealpha',0.7,'EdgeColor','none');%管1圆柱部分/去除网格线
 hold on;
surf(cardancy111x,cardancy111y,cardancy111z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');%绘制万向节11的圆柱部分/去除网格线
patch('Faces',f,'Vertices',cardancyf1111,'FaceColor',[0 0 0],'facealpha',1);%画万向节11底面
patch('Faces',face,'Vertices',cardanface112,'FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface113,'FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%====================================%虚拟绝对零点平面=========================================
% pan=[300 300 -300 -300
%     -300 300  300 -300
%     -151 -151 -151 -151
%       1   1    1    1];
% pan=T1*pan;
% panf=[pan(1,:);pan(2,:);pan(3,:)]';
% patch('Faces',[1 2 3 4],'Vertices',panf,'FaceColor',[0.2 0.2 0.2],'facealpha',.3);%虚拟绝对零点平面
% axiss=[-300 300   0    0
%        0     0   -300  300
%     -151   -151  -151 -151
%        1     1    1    1];
% axiss=T1*axiss;
% 
% line(axiss(1,1:2),axiss(2,1:2),axiss(3,1:2),'LineWidth',1,'Color',[0 0 0]);
% line(axiss(1,3:4),axiss(2,3:4),axiss(3,3:4),'LineWidth',1,'Color',[0 0 1]);%坐标轴

%====================================%驱动后座=========================================
[PackageBase]=cubefun(400,250,450,0,110,-330);%分别为长宽高及中心点坐标，背景
[PackageBack,PackageForward]=cyfun(190,500,0,0,-575);%管1半径和高及底面坐标
PackageBase=T1*PackageBase';
PackageBack=T1*PackageBack;
PackageForward=T1*PackageForward;%坐标变换

PackageForwardf=PackageForward;
PackageBackf=PackageBack;
[Px,Py,Pz]=extract(PackageBack,PackageForward);
Pff=[PackageForwardf(1,:);PackageForwardf(2,:);PackageForwardf(3,:)]';
Pbf=[PackageBackf(1,:);PackageBackf(2,:);PackageBackf(3,:)]';
PB=[PackageBase(1,:);PackageBase(2,:);PackageBase(3,:)]';

surf(Px,Py,Pz,'FaceColor',[0 0.2 0.2],'facealpha',1,'EdgeColor','none');%管1圆柱部分/去除网格线
hold on;
patch('Faces',f,'Vertices',Pff,'FaceColor',[0 0.8 0.2],'facealpha',1);%画万向节11底面
patch('Faces',f,'Vertices',Pbf,'FaceColor',[0 0.2 0.2],'facealpha',1);%画万向节11底面
patch('Faces',face,'Vertices',PB,'FaceColor',[0 0.1 0.1],'facealpha',1);%绘图-颜色-透明度,背景
%====================================%驱动后座=========================================
%====================================%导轨=========================================
[MoveBase]=cubefun(400,300,1800,0,400,-900);%分别为长宽高及中心点坐标，背景
MoveBase=MoveBase';
MB = [MoveBase(1,:);MoveBase(2,:);MoveBase(3,:)]';
patch('Faces',face,'Vertices',MB,'FaceColor',[0.5 0.9 0.5],'facealpha',0.2,'EdgeColor','none');%绘图-颜色-透明度,背景
%====================================%导轨=========================================
%====================================%升降台=========================================
% face=[1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];%按顶点顺序选择绘图面
% [MoveBase]=cubefun(300,200,Pbz,0,0,-575+Pbz/2);%分别为长宽高及中心点坐标，背景
% MoveBase=MoveBase';
% MB = [MoveBase(1,:);MoveBase(2,:);MoveBase(3,:)]';
% patch('Faces',face,'Vertices',MB,'FaceColor',[0.4 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% %====================================%升降台=========================================
% %====================================%注水站=========================================
% [WaterBaseBack,WaterBaseForward]=cyfun(150,700,500,0,-575);%管1半径和高及底面坐标
% WaterBaseForwardf=WaterBaseForward;
% WaterBaseBackf=WaterBaseBack;
% [Wx,Wy,Wz]=extract(WaterBaseBack,WaterBaseForward);
% Wff=[WaterBaseForwardf(1,:);WaterBaseForwardf(2,:);WaterBaseForwardf(3,:)]';
% Wbf=[WaterBaseBackf(1,:);WaterBaseBackf(2,:);WaterBaseBackf(3,:)]';
% % PB=[PackageBase(1,:);PackageBase(2,:);PackageBase(3,:)]';
% 
% surf(Wx,Wy,Wz,'FaceColor','k','facealpha',1,'EdgeColor','none');%管1圆柱部分/去除网格线
% hold on;
% patch('Faces',f,'Vertices',Wff,'FaceColor',[0 0.8 0.2],'facealpha',1);%画万向节11底面
% patch('Faces',f,'Vertices',Wbf,'FaceColor',[0 0.2 0.2],'facealpha',1);%画万向节11底面
% % patch('Faces',face,'Vertices',PB,'FaceColor',[0 0.1 0.1],'facealpha',1);%绘图-颜色-透明度,背景
% %====================================%注水站=========================================
% %====================================%注水管=========================================
% [Watertube]=cubefun(300,20,20,300,0,-525+Pbz);%分别为长宽高及中心点坐标，背景
% Watertube=T1*Watertube';
% WT = [Watertube(1,:);Watertube(2,:);Watertube(3,:)]';
% patch('Faces',face,'Vertices',WT,'FaceColor','k','facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% %====================================%注水管=========================================

% % %====================================%补给点=========================================
% [Replanlish1]=cubefun(60,100,810,380,0,955);%分别为长宽高及中心点坐标，背景
% Replanlish1=Replanlish1';
% Re1 = [Replanlish1(1,:);Replanlish1(2,:);Replanlish1(3,:)]';
% patch('Faces',face,'Vertices',Re1,'FaceColor',[0.8 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% [Replanlish2]=cubefun(40,100,1150,430,0,1125);%分别为长宽高及中心点坐标，背景
% Replanlish2=Replanlish2';
% Re2 = [Replanlish2(1,:);Replanlish2(2,:);Replanlish2(3,:)]';
% patch('Faces',face,'Vertices',Re2,'FaceColor',[0.8 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% [Replanlish3]=cubefun(60,100,180,380,0,1610);%分别为长宽高及中心点坐标，背景
% Replanlish3=Replanlish3';
% Re3 = [Replanlish3(1,:);Replanlish3(2,:);Replanlish3(3,:)]';
% patch('Faces',face,'Vertices',Re3,'FaceColor',[0.8 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% [Replanlish4]=cubefun(60,100,810,-380,0,955);%分别为长宽高及中心点坐标，背景
% Replanlish4=Replanlish4';
% Re4 = [Replanlish4(1,:);Replanlish4(2,:);Replanlish4(3,:)]';
% patch('Faces',face,'Vertices',Re4,'FaceColor',[0.8 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景[Replanlish2]=cubefun(40,100,1150,430,0,575);%分别为长宽高及中心点坐标，背景
% [Replanlish5]=cubefun(40,100,1150,-430,0,1125);%分别为长宽高及中心点坐标，背景
% Replanlish5=Replanlish5';
% Re5 = [Replanlish5(1,:);Replanlish5(2,:);Replanlish5(3,:)]';
% patch('Faces',face,'Vertices',Re5,'FaceColor',[0.8 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景[Replanlish2]=cubefun(40,100,1150,430,0,575);%分别为长宽高及中心点坐标，背景
% [Replanlish6]=cubefun(60,100,180,-380,0,1610);%分别为长宽高及中心点坐标，背景
% Replanlish6=Replanlish6';
% Re6 = [Replanlish6(1,:);Replanlish6(2,:);Replanlish6(3,:)]';
% patch('Faces',face,'Vertices',Re6,'FaceColor',[0.8 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% [Replanlish7]=cubefun(60,100,40,380,0,1440);%分别为长宽高及中心点坐标，背景
% Replanlish7=Replanlish7';
% Re7 = [Replanlish7(1,:);Replanlish7(2,:);Replanlish7(3,:)]';
% patch('Faces',face,'Vertices',Re7,'FaceColor','c','facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% [Replanlish8]=cubefun(60,100,40,-380,0,1440);%分别为长宽高及中心点坐标，背景
% Replanlish8=Replanlish8';
% Re8 = [Replanlish8(1,:);Replanlish8(2,:);Replanlish8(3,:)]';
% patch('Faces',face,'Vertices',Re8,'FaceColor','c','facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景

% % %====================================%补给点=========================================
% %====================================%升降台=========================================
% face=[1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];%按顶点顺序选择绘图面
% [MoveBase]=cubefun(300,200,Pbz,0,0,-575+Pbz/2);%分别为长宽高及中心点坐标，背景
% MoveBase=MoveBase';
% MB = [MoveBase(1,:);MoveBase(2,:);MoveBase(3,:)]';
% patch('Faces',face,'Vertices',MB,'FaceColor',[0.4 0.2 0.8],'facealpha',0.5,'EdgeColor','none');%绘图-颜色-透明度,背景
% %====================================%升降台=========================================
% axis equal;
view(view1,view2);
axis([axisxN axisxP axisyN axisyP axiszN axiszP]);%坐标轴确定
xlabel('X(mm)','FontSize',12)
ylabel('Y(mm）','FontSize',12)
zlabel('Z(mm）','FontSize',12)
%%%set(gca,'ZTick',[0, 1088, 1200]);
%====================================%cardan12=========================================
[cardan12]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景
cardan12=T112*cardan12';%坐标变换
cardanface12=[cardan12(1,:);cardan12(2,:);cardan12(3,:)];
patch('Faces',face,'Vertices',cardanface12','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
hold on;
%====================================%cardan13=========================================
[cardancy131,cardancy1311]=cyfun(22.5,4,0,0,jointl);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan132]=cubefun(2,12,jointl,14,0,jointl/2);%分别为长宽高及中心点坐标，背景
[cardan133]=cubefun(2,12,jointl/2,-14,0,jointl/2);%分别为长宽高及中心点坐标，背景
[tube21,tube22]=cyfun(22.5,linkl-jointl-8,0,0,jointl+4);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy131=T113*cardancy131;
cardancy1311=T113*cardancy1311;
cardan132=T113*cardan132';
cardan133=T113*cardan133';
tube21=T113*tube21;
tube22=T113*tube22;%坐标变换

[tube2x,tube2y,tube2z]=extract(tube21,tube22);
cardancyf1311=[cardancy131(1,:);cardancy131(2,:);cardancy131(3,:)]';
cardanface132=[cardan132(1,:);cardan132(2,:);cardan132(3,:)];
cardanface133=[cardan133(1,:);cardan133(2,:);cardan133(3,:)];
[cardancy131x,cardancy131y,cardancy131z]=extract(cardancy131,cardancy1311);

surf(cardancy131x,cardancy131y,cardancy131z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube2x,tube2y,tube2z,'FaceColor',[0 0.3 0.3],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf1311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface132','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface133','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan21===============================================================
[cardancy211,cardancy2111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan212]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan213]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy211=T211*cardancy211;
cardancy2111=T211*cardancy2111;
cardan212=T211*cardan212';
cardan213=T211*cardan213';

cardanface212=[cardan212(1,:);cardan212(2,:);cardan212(3,:)];
cardanface213=[cardan213(1,:);cardan213(2,:);cardan213(3,:)];
[cardancy211x,cardancy211y,cardancy211z]=extract(cardancy211,cardancy2111);
cardancyf2111=[cardancy211(1,:);cardancy211(2,:);cardancy211(3,:)]';

surf(cardancy211x,cardancy211y,cardancy211z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf2111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface212','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface213','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan22===============================================================
[cardan22]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan22=T212*cardan22';

cardanface22=[cardan22(1,:);cardan22(2,:);cardan22(3,:)];
patch('Faces',face,'Vertices',cardanface22','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan23===============================================================
[cardancy231,cardancy2311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan232]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan233]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube31,tube32]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy231=T213*cardancy231;
cardancy2311=T213*cardancy2311;
cardan232=T213*cardan232';
cardan233=T213*cardan233';
tube31=T213*tube31;
tube32=T213*tube32;

[tube3x,tube3y,tube3z]=extract(tube31,tube32);
cardancyf2311=[cardancy231(1,:);cardancy231(2,:);cardancy231(3,:)]';
cardanface232=[cardan232(1,:);cardan232(2,:);cardan232(3,:)];
cardanface233=[cardan233(1,:);cardan233(2,:);cardan233(3,:)];
[cardancy231x,cardancy231y,cardancy231z]=extract(cardancy231,cardancy2311);

surf(cardancy231x,cardancy231y,cardancy231z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube3x,tube3y,tube3z,'FaceColor',[0 0.4 0.4],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf2311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface232','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface233','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan31===============================================================
[cardancy311,cardancy3111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan312]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan313]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy311=T311*cardancy311;
cardancy3111=T311*cardancy3111;
cardan312=T311*cardan312';
cardan313=T311*cardan313';

cardanface312=[cardan312(1,:);cardan312(2,:);cardan312(3,:)];
cardanface313=[cardan313(1,:);cardan313(2,:);cardan313(3,:)];
[cardancy311x,cardancy311y,cardancy311z]=extract(cardancy311,cardancy3111);
cardancyf3111=[cardancy311(1,:);cardancy311(2,:);cardancy311(3,:)]';

surf(cardancy311x,cardancy311y,cardancy311z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf3111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface312','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface313','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan32===============================================================
[cardan32]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan32=T312*cardan32';

cardanface32=[cardan32(1,:);cardan32(2,:);cardan32(3,:)];
patch('Faces',face,'Vertices',cardanface32','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan33===============================================================
[cardancy331,cardancy3311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan332]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan333]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube41,tube42]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy331=T313*cardancy331;
cardancy3311=T313*cardancy3311;
cardan332=T313*cardan332';
cardan333=T313*cardan333';
tube41=T313*tube41;
tube42=T313*tube42;

[tube4x,tube4y,tube4z]=extract(tube41,tube42);
cardancyf3311=[cardancy331(1,:);cardancy331(2,:);cardancy331(3,:)]';
cardanface332=[cardan332(1,:);cardan332(2,:);cardan332(3,:)];
cardanface333=[cardan333(1,:);cardan333(2,:);cardan333(3,:)];
[cardancy331x,cardancy331y,cardancy331z]=extract(cardancy331,cardancy3311);

surf(cardancy331x,cardancy331y,cardancy331z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube4x,tube4y,tube4z,'FaceColor',[0 0.5 0.5],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf3311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface332','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface333','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan41===============================================================
[cardancy411,cardancy4111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan412]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan413]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy411=T411*cardancy411;
cardancy4111=T411*cardancy4111;
cardan412=T411*cardan412';
cardan413=T411*cardan413';

cardanface412=[cardan412(1,:);cardan412(2,:);cardan412(3,:)];
cardanface413=[cardan413(1,:);cardan413(2,:);cardan413(3,:)];
[cardancy411x,cardancy411y,cardancy411z]=extract(cardancy411,cardancy4111);
cardancyf4111=[cardancy411(1,:);cardancy411(2,:);cardancy411(3,:)]';

surf(cardancy411x,cardancy411y,cardancy411z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf4111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface412','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface413','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan42===============================================================
[cardan42]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景
       
cardan42=T412*cardan42';

cardanface42=[cardan42(1,:);cardan42(2,:);cardan42(3,:)];
patch('Faces',face,'Vertices',cardanface42','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan43===============================================================
[cardancy431,cardancy4311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan432]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan433]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube51,tube52]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy431=T413*cardancy431;
cardancy4311=T413*cardancy4311;
cardan432=T413*cardan432';
cardan433=T413*cardan433';
tube51=T413*tube51;
tube52=T413*tube52;

[tube5x,tube5y,tube5z]=extract(tube51,tube52);
cardancyf4311=[cardancy431(1,:);cardancy431(2,:);cardancy431(3,:)]';
cardanface432=[cardan432(1,:);cardan432(2,:);cardan432(3,:)];
cardanface433=[cardan433(1,:);cardan433(2,:);cardan433(3,:)];
[cardancy431x,cardancy431y,cardancy431z]=extract(cardancy431,cardancy4311);

surf(cardancy431x,cardancy431y,cardancy431z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube5x,tube5y,tube5z,'FaceColor',[0 0.6 0.6],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf4311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface432','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface433','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan51===============================================================
[cardancy511,cardancy5111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan512]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan513]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy511=T511*cardancy511;
cardancy5111=T511*cardancy5111;
cardan512=T511*cardan512';
cardan513=T511*cardan513';

cardanface512=[cardan512(1,:);cardan512(2,:);cardan512(3,:)];
cardanface513=[cardan513(1,:);cardan513(2,:);cardan513(3,:)];
[cardancy511x,cardancy511y,cardancy511z]=extract(cardancy511,cardancy5111);
cardancyf5111=[cardancy511(1,:);cardancy511(2,:);cardancy511(3,:)]';

surf(cardancy511x,cardancy511y,cardancy511z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf5111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface512','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface513','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan52===============================================================
[cardan52]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan52=T512*cardan52';

cardanface52=[cardan52(1,:);cardan52(2,:);cardan52(3,:)];
patch('Faces',face,'Vertices',cardanface52','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan53===============================================================
[cardancy531,cardancy5311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan532]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan533]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube61,tube62]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy531=T513*cardancy531;
cardancy5311=T513*cardancy5311;
cardan532=T513*cardan532';
cardan533=T513*cardan533';
tube61=T513*tube61;
tube62=T513*tube62;

[tube6x,tube6y,tube6z]=extract(tube61,tube62);
cardancyf5311=[cardancy531(1,:);cardancy531(2,:);cardancy531(3,:)]';
cardanface532=[cardan532(1,:);cardan532(2,:);cardan532(3,:)];
cardanface533=[cardan533(1,:);cardan533(2,:);cardan533(3,:)];
[cardancy531x,cardancy531y,cardancy531z]=extract(cardancy531,cardancy5311);

surf(cardancy531x,cardancy531y,cardancy531z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube6x,tube6y,tube6z,'FaceColor',[0 0.7 0.7],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf5311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface532','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface533','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背
%======================================================================%cardan61===============================================================
[cardancy611,cardancy6111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan612]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan613]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy611=T611*cardancy611;
cardancy6111=T611*cardancy6111;
cardan612=T611*cardan612';
cardan613=T611*cardan613';

cardanface612=[cardan612(1,:);cardan612(2,:);cardan612(3,:)];
cardanface613=[cardan613(1,:);cardan613(2,:);cardan613(3,:)];
[cardancy611x,cardancy611y,cardancy611z]=extract(cardancy611,cardancy6111);
cardancyf6111=[cardancy611(1,:);cardancy611(2,:);cardancy611(3,:)]';

surf(cardancy611x,cardancy611y,cardancy611z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf6111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface612','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface613','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan62===============================================================
[cardan62]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan62=T612*cardan62';

cardanface62=[cardan62(1,:);cardan62(2,:);cardan62(3,:)];
patch('Faces',face,'Vertices',cardanface62','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan63===============================================================
[cardancy631,cardancy6311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan632]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan633]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube71,tube72]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy631=T613*cardancy631;
cardancy6311=T613*cardancy6311;
cardan632=T613*cardan632';
cardan633=T613*cardan633';
tube71=T613*tube71;
tube72=T613*tube72;

[tube7x,tube7y,tube7z]=extract(tube71,tube72);
cardancyf6311=[cardancy631(1,:);cardancy631(2,:);cardancy631(3,:)]';
cardanface632=[cardan632(1,:);cardan632(2,:);cardan632(3,:)];
cardanface633=[cardan633(1,:);cardan633(2,:);cardan633(3,:)];
[cardancy631x,cardancy631y,cardancy631z]=extract(cardancy631,cardancy6311);

surf(cardancy631x,cardancy631y,cardancy631z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube7x,tube7y,tube7z,'FaceColor',[0 0.8 0.8],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf6311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface632','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface633','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%======================================================================%cardan71===============================================================
[cardancy711,cardancy7111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan712]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan713]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy711=T711*cardancy711;
cardancy7111=T711*cardancy7111;
cardan712=T711*cardan712';
cardan713=T711*cardan713';

cardanface712=[cardan712(1,:);cardan712(2,:);cardan712(3,:)];
cardanface713=[cardan713(1,:);cardan713(2,:);cardan713(3,:)];
[cardancy711x,cardancy711y,cardancy711z]=extract(cardancy711,cardancy7111);
cardancyf7111=[cardancy711(1,:);cardancy711(2,:);cardancy711(3,:)]';

surf(cardancy711x,cardancy711y,cardancy711z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf7111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface712','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface713','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan72===============================================================
[cardan72]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan72=T712*cardan72';

cardanface72=[cardan72(1,:);cardan72(2,:);cardan72(3,:)];
patch('Faces',face,'Vertices',cardanface72','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan73===============================================================
[cardancy731,cardancy7311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan732]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan733]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube81,tube82]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy731=T713*cardancy731;
cardancy7311=T713*cardancy7311;
cardan732=T713*cardan732';
cardan733=T713*cardan733';
tube81=T713*tube81;
tube82=T713*tube82;

[tube8x,tube8y,tube8z]=extract(tube81,tube82);
cardancyf7311=[cardancy731(1,:);cardancy731(2,:);cardancy731(3,:)]';
cardanface732=[cardan732(1,:);cardan732(2,:);cardan732(3,:)];
cardanface733=[cardan733(1,:);cardan733(2,:);cardan733(3,:)];
[cardancy731x,cardancy731y,cardancy731z]=extract(cardancy731,cardancy7311);

surf(cardancy731x,cardancy731y,cardancy731z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube8x,tube8y,tube8z,'FaceColor',[0 0.8 0.8],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf7311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface732','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface733','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%======================================================================%cardan81===============================================================
[cardancy811,cardancy8111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan812]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan813]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy811=T811*cardancy811;
cardancy8111=T811*cardancy8111;
cardan812=T811*cardan812';
cardan813=T811*cardan813';

cardanface812=[cardan812(1,:);cardan812(2,:);cardan812(3,:)];
cardanface813=[cardan813(1,:);cardan813(2,:);cardan813(3,:)];
[cardancy811x,cardancy811y,cardancy811z]=extract(cardancy811,cardancy8111);
cardancyf8111=[cardancy811(1,:);cardancy811(2,:);cardancy811(3,:)]';

surf(cardancy811x,cardancy811y,cardancy811z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf8111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface812','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface813','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan82===============================================================
[cardan82]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan82=T812*cardan82';

cardanface82=[cardan82(1,:);cardan82(2,:);cardan82(3,:)];
patch('Faces',face,'Vertices',cardanface82','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan83===============================================================
[cardancy831,cardancy8311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan832]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan833]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube91,tube92]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy831=T813*cardancy831;
cardancy8311=T813*cardancy8311;
cardan832=T813*cardan832';
cardan833=T813*cardan833';
tube91=T813*tube91;
tube92=T813*tube92;

[tube9x,tube9y,tube9z]=extract(tube91,tube92);
cardancyf8311=[cardancy831(1,:);cardancy831(2,:);cardancy831(3,:)]';
cardanface832=[cardan832(1,:);cardan832(2,:);cardan832(3,:)];
cardanface833=[cardan833(1,:);cardan833(2,:);cardan833(3,:)];
[cardancy831x,cardancy831y,cardancy831z]=extract(cardancy831,cardancy8311);

surf(cardancy831x,cardancy831y,cardancy831z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube9x,tube9y,tube9z,'FaceColor',[0 0.8 0.8],'facealpha',0.8,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf8311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface832','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface833','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%======================================================================%cardan91===============================================================
[cardancy911,cardancy9111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan912]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan913]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy911=T911*cardancy911;
cardancy9111=T911*cardancy9111;
cardan912=T911*cardan912';
cardan913=T911*cardan913';

cardanface912=[cardan912(1,:);cardan912(2,:);cardan912(3,:)];
cardanface913=[cardan913(1,:);cardan913(2,:);cardan913(3,:)];
[cardancy911x,cardancy911y,cardancy911z]=extract(cardancy911,cardancy9111);
cardancyf9111=[cardancy911(1,:);cardancy911(2,:);cardancy911(3,:)]';

surf(cardancy911x,cardancy911y,cardancy911z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf9111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface912','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface913','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan92===============================================================
[cardan92]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan92=T912*cardan92';

cardanface92=[cardan92(1,:);cardan92(2,:);cardan92(3,:)];
patch('Faces',face,'Vertices',cardanface92','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan93===============================================================
[cardancy931,cardancy9311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan932]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan933]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube101,tube102]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy931=T913*cardancy931;
cardancy9311=T913*cardancy9311;
cardan932=T913*cardan932';
cardan933=T913*cardan933';
tube101=T913*tube101;
tube102=T913*tube102;

[tube10x,tube10y,tube10z]=extract(tube101,tube102);
cardancyf9311=[cardancy931(1,:);cardancy931(2,:);cardancy931(3,:)]';
cardanface932=[cardan932(1,:);cardan932(2,:);cardan932(3,:)];
cardanface933=[cardan933(1,:);cardan933(2,:);cardan933(3,:)];
[cardancy931x,cardancy931y,cardancy931z]=extract(cardancy931,cardancy9311);

surf(cardancy931x,cardancy931y,cardancy931z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube10x,tube10y,tube10z,'FaceColor',[0 0.8 0.8],'facealpha',0.8,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf9311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface932','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface933','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%======================================================================%cardan101===============================================================
[cardancy1011,cardancy10111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan1012]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan1013]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy1011=T1011*cardancy1011;
cardancy10111=T1011*cardancy10111;
cardan1012=T1011*cardan1012';
cardan1013=T1011*cardan1013';

cardanface1012=[cardan1012(1,:);cardan1012(2,:);cardan1012(3,:)];
cardanface1013=[cardan1013(1,:);cardan1013(2,:);cardan1013(3,:)];
[cardancy1011x,cardancy1011y,cardancy1011z]=extract(cardancy1011,cardancy10111);
cardancyf10111=[cardancy1011(1,:);cardancy1011(2,:);cardancy1011(3,:)]';

surf(cardancy1011x,cardancy1011y,cardancy1011z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf10111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface1012','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface1013','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan102===============================================================
[cardan102]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan102=T1012*cardan102';

cardanface102=[cardan102(1,:);cardan102(2,:);cardan102(3,:)];
patch('Faces',face,'Vertices',cardanface102','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan103===============================================================
[cardancy1031,cardancy10311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan1032]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan1033]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube111,tube112]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy1031=T1013*cardancy1031;
cardancy10311=T1013*cardancy10311;
cardan1032=T1013*cardan1032';
cardan1033=T1013*cardan1033';
tube111=T1013*tube111;
tube112=T1013*tube112;

[tube11x,tube11y,tube11z]=extract(tube111,tube112);
cardancyf10311=[cardancy1031(1,:);cardancy1031(2,:);cardancy1031(3,:)]';
cardanface1032=[cardan1032(1,:);cardan1032(2,:);cardan1032(3,:)];
cardanface1033=[cardan1033(1,:);cardan1033(2,:);cardan1033(3,:)];
[cardancy1031x,cardancy1031y,cardancy1031z]=extract(cardancy1031,cardancy10311);

surf(cardancy1031x,cardancy1031y,cardancy1031z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube11x,tube11y,tube11z,'FaceColor',[0 0.8 0.8],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf10311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface1032','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface1033','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%======================================================================%cardan111===============================================================
[cardancy1111,cardancy11111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan1112]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan1113]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy1111=T1111*cardancy1111;
cardancy11111=T1111*cardancy11111;
cardan1112=T1111*cardan1112';
cardan1113=T1111*cardan1113';

cardanface1112=[cardan1112(1,:);cardan1112(2,:);cardan1112(3,:)];
cardanface1113=[cardan1113(1,:);cardan1113(2,:);cardan1113(3,:)];
[cardancy1111x,cardancy1111y,cardancy1111z]=extract(cardancy1111,cardancy11111);
cardancyf11111=[cardancy1111(1,:);cardancy1111(2,:);cardancy1111(3,:)]';

surf(cardancy1111x,cardancy1111y,cardancy1111z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf11111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface1112','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface1113','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan112===============================================================
[cardan112]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan112=T1112*cardan112';

cardanface112=[cardan112(1,:);cardan112(2,:);cardan112(3,:)];
patch('Faces',face,'Vertices',cardanface112','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan113===============================================================
[cardancy1131,cardancy11311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan1132]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan1133]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube121,tube122]=cyfun(22.5,70,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy1131=T1113*cardancy1131;
cardancy11311=T1113*cardancy11311;
cardan1132=T1113*cardan1132';
cardan1133=T1113*cardan1133';
tube121=T1113*tube121;
tube122=T1113*tube122;

[tube12x,tube12y,tube12z]=extract(tube121,tube122);
cardancyf11311=[cardancy1131(1,:);cardancy1131(2,:);cardancy1131(3,:)]';
cardanface1132=[cardan1132(1,:);cardan1132(2,:);cardan1132(3,:)];
cardanface1133=[cardan1133(1,:);cardan1133(2,:);cardan1133(3,:)];
[cardancy1131x,cardancy1131y,cardancy1131z]=extract(cardancy1131,cardancy11311);

surf(cardancy1131x,cardancy1131y,cardancy1131z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube12x,tube12y,tube12z,'FaceColor',[0 0.8 0.8],'facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf11311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface1132','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface1133','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%======================================================================%cardan121===============================================================
[cardancy1211,cardancy12111]=cyfun(22.5,4,0,0,-4);%半径和高，底面圆心相对于坐标原点的位置
[cardan1212]=cubefun(12,2,6.5,0,14,3.25);%分别为长宽高及中心点坐标，背景
[cardan1213]=cubefun(12,2,6.5,0,-14,3.25);%分别为长宽高及中心点坐标，背景

cardancy1211=T1211*cardancy1211;
cardancy12111=T1211*cardancy12111;
cardan1212=T1211*cardan1212';
cardan1213=T1211*cardan1213';

cardanface1212=[cardan1212(1,:);cardan1212(2,:);cardan1212(3,:)];
cardanface1213=[cardan1213(1,:);cardan1213(2,:);cardan1213(3,:)];
[cardancy1211x,cardancy1211y,cardancy1211z]=extract(cardancy1211,cardancy12111);
cardancyf12111=[cardancy1211(1,:);cardancy1211(2,:);cardancy1211(3,:)]';

surf(cardancy1211x,cardancy1211y,cardancy1211z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf12111,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface1212','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface1213','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan122===============================================================
[cardan122]=cubefun(26,26,2,0,0,0);%分别为长宽高及中心点坐标，背景

cardan122=T1212*cardan122';

cardanface122=[cardan122(1,:);cardan122(2,:);cardan122(3,:)];
patch('Faces',face,'Vertices',cardanface122','FaceColor',[0 0.9 0],'facealpha',.9);%绘图-颜色-透明度,背景
%======================================================================%cardan123===============================================================
[cardancy1231,cardancy12311]=cyfun(22.5,4,0,0,6.5);%万向节13半径和高，底面圆心相对于坐标原点的位置
[cardan1232]=cubefun(2,12,6.5,14,0,3.25);%分别为长宽高及中心点坐标，背景
[cardan1233]=cubefun(2,12,6.5,-14,0,3.25);%分别为长宽高及中心点坐标，背景
[tube131,tube132]=cyfun(22.5,50,0,0,10.5);%管2半径和高，底面圆心相对于坐标原点的位置
%%%end effctor on the tip of the manipulator
[tube141,tube142]=cyfun(10,30,0,0,60.5);%管2半径和高，底面圆心相对于坐标原点的位置

cardancy1231=T1213*cardancy1231;
cardancy12311=T1213*cardancy12311;
cardan1232=T1213*cardan1232';
cardan1233=T1213*cardan1233';
tube131=T1213*tube131;
tube132=T1213*tube132;
tube141=T1213*tube141;
tube142=T1213*tube142;

[tube13x,tube13y,tube13z]=extract(tube131,tube132);
[tube14x,tube14y,tube14z]=extract(tube141,tube142);
cardancyf12311=[cardancy1231(1,:);cardancy1231(2,:);cardancy1231(3,:)]';
cardanface1232=[cardan1232(1,:);cardan1232(2,:);cardan1232(3,:)];
cardanface1233=[cardan1233(1,:);cardan1233(2,:);cardan1233(3,:)];
[cardancy1231x,cardancy1231y,cardancy1231z]=extract(cardancy1231,cardancy12311);

surf(cardancy1231x,cardancy1231y,cardancy1231z,'FaceColor',[0 0 0],'facealpha',1,'EdgeColor','none');
surf(tube13x,tube13y,tube13z,'FaceColor',[0 0.8 0.8],'facealpha',0.7,'EdgeColor','none');
surf(tube14x,tube14y,tube14z,'FaceColor','b','facealpha',0.7,'EdgeColor','none');
patch('Faces',f,'Vertices',cardancyf12311,'FaceColor',[0 0 0],'facealpha',1);
patch('Faces',face,'Vertices',cardanface1232','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背景
patch('Faces',face,'Vertices',cardanface1233','FaceColor',[0.9 0.9 0.9],'facealpha',.9);%绘图-颜色-透明度,背

hold on;


%% ======================================================================%计算绳长度===============================================================

%-------------角度分布(Angle_distribution)----------
A_d=zeros(3,12);

% A_d(1,1)=270;
% A_d(1,2)=280;
% A_d(1,3)=290;
% A_d(1,4)=300;
% A_d(1,5)=310;
% A_d(1,6)=320;
% 
% A_d(1,7)=330;
% A_d(1,8)=340;
% A_d(1,9)=350;
% A_d(1,10)=360;
% A_d(1,11)=10;
% A_d(1,12)=20;


A_d(1,1)=264;
A_d(1,2)=282;
A_d(1,3)=291;
A_d(1,4)=314;
A_d(1,5)=330;
A_d(1,6)=325;

A_d(1,7)=352;
A_d(1,8)=1;
A_d(1,9)=19.25;
A_d(1,10)=23.5;
A_d(1,11)=30.25;
A_d(1,12)=37.75;%joint12=45-7.5


%间隔120度分布
A_d(2,:)=A_d(1,:)+120;
A_d(3,:)=A_d(1,:)-120;
%小圆孔所在大圆的半径
R_ad=19;

%第一组绳在上下两个坐标系中的表达

coor_d=zeros(4,36);%组绳在下坐标系的分布



for ii=1:3
     
    for jj=1:12
      
        kk=(ii-1)*12+jj;
        coor_d(:,kk)=[R_ad*cosd(A_d(ii,jj));R_ad*sind(A_d(ii,jj));0;1];%组绳在下坐标系的分布
       
    end
    
end

coor_u=coor_d;
coor_u(3,:)=coor_u(3,:)+6.5;%在第二个坐标中的位置上移动6.5

%--------------------------------在第1个关节处，绳长的变化；

LengthOfCable1=zeros(36,12);

coor_dif1=T121*T132*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,1)=norm(coor_dif1(:,ii));
    
end


%--------------------------------在第2个关节处，绳长的变化；
%将第1,13,25绳去掉

for ii=1:3
    
    coor_d(:,(1+12*(ii-1)))=0;
    coor_u(:,(1+12*(ii-1)))=0;   
end

coor_dif2=T221*T232*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,2)=norm(coor_dif2(:,ii));
    
end

%--------------------------------在第3个关节处，绳长的变化；
%将第2,14,26绳去掉

for ii=1:3
    
    coor_d(:,(2+12*(ii-1)))=0;
    coor_u(:,(2+12*(ii-1)))=0;   
end

coor_dif3=T321*T332*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,3)=norm(coor_dif3(:,ii));
    
end

%--------------------------------在第4个关节处，绳长的变化；
%将第3,15,27绳去掉

for ii=1:3
    
    coor_d(:,(3+12*(ii-1)))=0;
    coor_u(:,(3+12*(ii-1)))=0;   
end

coor_dif4=T421*T432*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,4)=norm(coor_dif4(:,ii));
    
end

%--------------------------------在第5个关节处，绳长的变化；
%将第4,16,28绳去掉

for ii=1:3
    
    coor_d(:,(4+12*(ii-1)))=0;
    coor_u(:,(4+12*(ii-1)))=0;   
end

coor_dif5=T521*T532*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,5)=norm(coor_dif5(:,ii));
    
end

%--------------------------------在第6个关节处，绳长的变化；
%将第5,17,29绳去掉

for ii=1:3
    
    coor_d(:,(5+12*(ii-1)))=0;
    coor_u(:,(5+12*(ii-1)))=0;   
end

coor_dif6=T621*T632*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,6)=norm(coor_dif6(:,ii));
    
end
 
%--------------------------------在第7个关节处，绳长的变化；
%将第6,18,30绳去掉

for ii=1:3
    
    coor_d(:,(6+12*(ii-1)))=0;
    coor_u(:,(6+12*(ii-1)))=0;   
end

coor_dif7=T721*T732*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,7)=norm(coor_dif7(:,ii));
    
end

%--------------------------------在第8个关节处，绳长的变化；
%将第7,19,31绳去掉

for ii=1:3
    
    coor_d(:,(7+12*(ii-1)))=0;
    coor_u(:,(7+12*(ii-1)))=0;   
end

coor_dif8=T821*T832*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,8)=norm(coor_dif8(:,ii));
    
end

%--------------------------------在第9个关节处，绳长的变化；
%将第8,20,32绳去掉

for ii=1:3
    
    coor_d(:,(8+12*(ii-1)))=0;
    coor_u(:,(8+12*(ii-1)))=0;   
end

coor_dif9=T921*T932*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,9)=norm(coor_dif9(:,ii));
    
end

%--------------------------------在第10个关节处，绳长的变化；
%将第9,21,33绳去掉

for ii=1:3
    
    coor_d(:,(9+12*(ii-1)))=0;
    coor_u(:,(9+12*(ii-1)))=0;   
end

coor_dif10=T1021*T1032*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,10)=norm(coor_dif10(:,ii));
    
end

%--------------------------------在第11个关节处，绳长的变化；
%将第10,22,34绳去掉

for ii=1:3
    
    coor_d(:,(10+12*(ii-1)))=0;
    coor_u(:,(10+12*(ii-1)))=0;   
end

coor_dif11=T1121*T1132*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,11)=norm(coor_dif11(:,ii));
    
end

%--------------------------------在第12个关节处，绳长的变化；
%将第11,23,35绳去掉

for ii=1:3
    
    coor_d(:,(11+12*(ii-1)))=0;
    coor_u(:,(11+12*(ii-1)))=0;   
end

coor_dif12=T1221*T1232*coor_u-coor_d;

for ii=1:36
    
    LengthOfCable1(ii,12)=norm(coor_dif12(:,ii));
    
end




%总绳长度

for iii=1:36
    
    LengthOfCables(iii,1)=sum(LengthOfCable1(iii,:));

    
end

 %绳长度变化         
 LengthOfCables=LengthOfCables-[13;26;39;52;65;78;91;104;117;130;143;156;13;26;39;52;65;78;91;104;117;130;143;156;13;26;39;52;65;78;91;104;117;130;143;156];
 LengthOfCables=-LengthOfCables';
 
 %% 计算各个关节点的坐标
 KeyPoint(:,1)=T113*[0;0;0;1];
 KeyPoint(:,2)=T213*[0;0;0;1];
 KeyPoint(:,3)=T313*[0;0;0;1];
 KeyPoint(:,4)=T413*[0;0;0;1];
 KeyPoint(:,5)=T513*[0;0;0;1];
 KeyPoint(:,6)=T613*[0;0;0;1];
 KeyPoint(:,7)=T713*[0;0;0;1];
 KeyPoint(:,8)=T813*[0;0;0;1];
 KeyPoint(:,9)=T913*[0;0;0;1];
 KeyPoint(:,10)=T1013*[0;0;0;1];
 KeyPoint(:,11)=T1113*[0;0;0;1];
 KeyPoint(:,12)=T1213*[0;0;0;1];
 KeyPoint(:,13)=T1213*[0;0;80.5;1];
 
  %% 计算各个关节点的坐标，修正后
 KeyPointM(:,1)=T113*[0;0;0;1];
 KeyPointM(:,2)=T213*[0;0;0;1];
 KeyPointM(:,3)=T313*[0;0;0;1];
 KeyPointM(:,4)=T413*[0;0;0;1];
 KeyPointM(:,5)=T513*[0;0;0;1];
 KeyPointM(:,6)=T613*[0;0;0;1];
 KeyPointM(:,7)=T713*[0;0;0;1];
 KeyPointM(:,8)=T813*[0;0;0;1];
 KeyPointM(:,9)=T913*[0;0;0;1];
 KeyPointM(:,10)=T1013*[0;0;0;1];
 KeyPointM(:,11)=T1113*[0;0;0;1];
 KeyPointM(:,12)=T1213*[0;0;0;1];
 KeyPointM(:,13)=T1213*[0;0;91;1];
 KeyPointM(:,14)=T1213*[0;0;182;1];%延伸出去一个关节
 keyppp=T113*[0;0;-91;1];%初始端反向延伸一个关节；
 
 KeyPointM=[keyppp,KeyPointM];

end

