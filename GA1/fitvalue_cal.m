function [ output ] = fitvalue_cal( genxx,genyy,collision)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fitvalue_cal() 适应度计算
% 适应度计算 定义为exp(150*1/dis*collision)-1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);   %获取种群大小和维度
dis = zeros(sizex,1);          %初始化距离
for i = 1:sizex
    for j=1:sizey-1            %迭代计算每条路径的距离
        dis(i)=dis(i)+sqrt((genxx(i,j+1)-genxx(i,j)).^2....
        +(genyy(i,j+1)-genyy(i,j)).^2);
    end
end                            %计算适应度
output = exp(150*ones(sizex,1)./dis.*collision)-1;
end

