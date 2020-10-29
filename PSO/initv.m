function [ vx ,vy ] = initv(possize,dim,vmax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initv():初始化速度 dim:每个粒子的维度
%possize:粒子群大小 vmax 速度限制
%vx\vy：初始化种群 每一行为一个个体(genx 和 geny)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vx = vmax*rand(possize,dim);  %粒子群x
vy = vmax*rand(possize,dim);  %粒子群y
end