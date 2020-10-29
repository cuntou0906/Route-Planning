function [ newvx,newvy ] = updatev( vx,vy,w,posx,posy,pidx,pidy,pgdx,pgdy,c1,c2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% update() 更新粒子速度
% posx posy：位置 vx vy：速度
% w 权重 c1 c2 学习因子
% pidx,pidy,pgdx,pgdy个体最优和全局最优
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pgdxx = zeros(size(vx));  %初始化速度x
pgdyy = zeros(size(vx));  %初始化速度y
%为了矩阵运算，将全局最优粒子和适应度进行广播
for j = 1:size(vx,1)      
    pgdxx(j,:) = pgdx;
    pgdyy(j,:) = pgdy;
end
%%%%%%   速度更新   %%%%%%
newvx = w*vx+c1*rand(1)*(pidx-posx)+c2*rand(1)*(pgdxx-posx);
newvy = w*vy+c1*rand(1)*(pidy-posy)+c2*rand(1)*(pgdyy-posy);
end
