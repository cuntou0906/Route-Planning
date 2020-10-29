function [ distance ] = caldis(px,py)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caldis() 信息素更新
% distance 距离
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distance = zeros(size(px,1),1);  %初始化距离
for i = 1:size(px,1)       %循环计算每一只蚂蚁的距离
    dist = 0;
    for j = 1:size(px,2)-1 %迭代计算距离
        dist =dist +sqrt((px(i,j+1)-px(i,j+1)).^2+(py(i,j+1)-py(i,j+1)).^2);
    end
    distance(i) = dist;      %保存距离值
end          
end