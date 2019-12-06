%%
function main
subdata
end


%% 
function subdata
global pos 
global orient
robotpose_sub = rossubscriber('/angle_info',@callback)
pause(2)
while true
   draw()
   pause(1) %刷新等待时间
end
end

%% 
function callback(a,receive_angle_data) %/pose有两个值输入进来,一个是topic属性,一个是message信息
global data_get
data_get = receive_angle_data.Poses()
% for i = 1:12
%     data_get.Orientation.X 
end

%% 
function [] = draw()
global data_get
thetax(1)=data_get(1).Orientation.X;thetay(1)=data_get(1).Orientation.Y;
thetax(2)=data_get(2).Orientation.X;thetay(2)=data_get(2).Orientation.Y;
thetax(3)=data_get(3).Orientation.X;thetay(3)=data_get(3).Orientation.Y;
thetax(4)=data_get(4).Orientation.X;thetay(4)=data_get(4).Orientation.Y;
thetax(5)=data_get(5).Orientation.X;thetay(5)=data_get(5).Orientation.Y;
thetax(6)=data_get(6).Orientation.X;thetay(6)=data_get(6).Orientation.Y;
thetax(7)=data_get(7).Orientation.X;thetay(7)=data_get(7).Orientation.Y;
thetax(8)=data_get(8).Orientation.X;thetay(8)=data_get(8).Orientation.Y;
thetax(9)=data_get(9).Orientation.X;thetay(9)=data_get(9).Orientation.Y;
thetax(10)=data_get(10).Orientation.X;thetay(10)=data_get(10).Orientation.Y;
thetax(11)=data_get(11).Orientation.X;thetay(11)=data_get(11).Orientation.Y;
thetax(12)=data_get(12).Orientation.X;thetay(12)=data_get(12).Orientation.Y;
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
Pbz=-1500;
linkl=143.5;
jointl=6.5;
[~,~,keypointm]=drawoc12180228(thetax(1),thetay(1),thetax(2),thetay(2),thetax(3),thetay(3),thetax(4),thetay(4),thetax(5),thetay(5),thetax(6),thetay(6),...
            thetax(7),thetay(7),thetax(8),thetay(8),thetax(9),thetay(9),thetax(10),thetay(10),thetax(11),thetay(11),thetax(12),thetay(12),Pbx,Pby,Pbz,0); 
axis equal
end






















