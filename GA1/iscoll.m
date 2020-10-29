function [ output ] = iscoll( f , x1 , x2 )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscoll()用于检测每一段路径是否与障碍物相交
% f 障碍物边界隐函数  x1和x2分别为两个端点
% output输出为‘no’ 则没有碰撞；反之
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
item = 20;                       %采样数目
xx = linspace(x1(1),x2(1),item); %采样
yy = linspace(x1(2),x2(2),item);
output = 'no';
for index = 1:item
    if(f(xx(index),yy(index))<=0) %产生碰撞
        output = 'yes';
        break;
    end
end
end

