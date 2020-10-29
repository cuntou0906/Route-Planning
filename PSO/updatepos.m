function [ posx,posy ] = updatepos( posx,posy,vx,vy )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatepos()对粒子的位置更新
% posx posy：位置 vx vy：速度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
posx = posx+vx;  %更新x方向位置
posy = posy+vy;  %更新y方向位置
end
