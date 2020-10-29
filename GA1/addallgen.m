function [ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addallgen()：将起始点和目标点存入种群
% genx geny为种群
% xs ys,xt,yt分别为起始点和目标点
% genxx genyy 返回包含起始点和目标点的坐标
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genx);     %获取种群维度
genxx = zeros(sizex,sizey+2);   %初始化x
genxx(:,1) = ones(sizex,1)*xs;  %加入起始点x
genxx(:,end) = ones(sizex,1)*xt;%加入目标点x
genxx(:,2:end-1)=genx;          %加入个体x
genyy = zeros(sizex,sizey+2);   %初始化y
genyy(:,1) = ones(sizex,1)*ys;  %加入起始点y
genyy(:,end) = ones(sizex,1)*yt;%加入目标点y
genyy(:,2:end-1)=geny;          %加入个体y
end