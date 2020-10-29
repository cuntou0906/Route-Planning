function [ output ] = fitvalue_cal( genxx,genyy,collision)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fitvalue_cal() 适应度计算
% genxx genyy 粒子群 collision 是否粒子与障碍物碰撞
% 适应度计算 定义为1/distance*collision
% output 适应度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);      %粒子群大小和维度
dis = zeros(sizex,1);             %初始化距离
for i = 1:sizex                   %循环每个粒子
    for j=1:sizey-1               %循环每段路径
        dis(i)=dis(i)+sqrt((genxx(i,j+1)-genxx(i,j)).^2....
        +(genyy(i,j+1)-genyy(i,j)).^2); %累加计算路径
    end
end
output = ones(sizex,1)./dis.*collision; %计算适应度
end

