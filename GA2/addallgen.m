function [ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addallgen()：将起始点和目标点存入种群
% genx geny为种群 xs ys,xt,yt分别为起始点和目标点
% genxx genyy 返回包含起始点和目标点的坐标
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genx);     %获取种群维度
genxx = zeros(sizex,sizey+2);   %初始化种群x方向
genxx(:,1) = ones(sizex,1)*xs;  %分别将目标点 起始点加入
genxx(:,end) = ones(sizex,1)*xt;%个体加入
genxx(:,2:end-1)=genx;
genyy = zeros(sizex,sizey+2);   %y方向上同操作
genyy(:,1) = ones(sizex,1)*ys;
genyy(:,end) = ones(sizex,1)*yt;
genyy(:,2:end-1)=geny;
end