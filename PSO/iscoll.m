function [ output ] = iscoll( f , x1 , x2 )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscoll()用于检测每一段路径是否与障碍物相交
% f 障碍物边界隐函数  x1和x2分别为两个端点
% output输出为'no' 则没有碰撞；反之
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
item = 20;                 %采样取点数目
xx = linspace(x1(1),x2(1),item); %采样x
yy = linspace(x1(2),x2(2),item); %采样y
output = 'no';                   %初始化
for index = 1:item               %循环
    if(f(xx(index),yy(index))<=0)%产生碰撞
        output = 'yes';          %赋值结果
        break;
    end
end
end

