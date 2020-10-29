function [ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addallgen()：将起始点和目标点存入粒子群
% genx geny为粒子群
% xs ys,xt,yt分别为起始点和目标点
% genxx genyy 返回包含起始点和目标点的坐标
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genx);     %获取粒子群大小和维度
genxx = zeros(sizex,sizey+2);   %初始化
genxx(:,1) = ones(sizex,1)*xs;  %加入起始点x
genxx(:,end) = ones(sizex,1)*xt;%加入目标点x
genxx(:,2:end-1)=genx;          %将原始点加入
genyy = zeros(sizex,sizey+2);   %初始化
genyy(:,1) = ones(sizex,1)*ys;  %加入起始点y
genyy(:,end) = ones(sizex,1)*yt;%加入目标点y
genyy(:,2:end-1)=geny;          %将原始点加入
end