function [ output ] = fitvalue_cal( genxx,genyy,collision)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addallgenfitvalue_cal（）适应度计算
%genx geny为种群 xs ys,xt,yt分别为起始点和目标点
% genxx genyy 返回包含起始点和目标点的坐标
% 适应度计算 定义为1/distance*collision
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);
dis = zeros(sizex,1);
for i = 1:sizex
    for j=1:sizey-1
        dis(i)=dis(i)+sqrt((genxx(i,j+1)-genxx(i,j)).^2....
        +(genyy(i,j+1)-genyy(i,j)).^2);
    end
end
output = ones(sizex,1)./dis.*collision;
end

