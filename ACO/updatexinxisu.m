function [tij ] = updatexinxisu( px,py,sita,tij,jindu,p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% updatexinxisu() 信息素更新
% nij启发因子 tij 信息素,
% Q 初始信息素 p 蒸发系数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distance = caldis(px,py);
[mindis,minindex] = min(distance);%找到最优路径
bestpx = px(minindex,:);        %最优路径x
bestpy = py(minindex,:);        %最优路径y
bestsita = sita(minindex,:);    %最优路径角度
deta = 1/mindis;                %计算平均信息素
[sizex,sizey] = size(px);       %获取尺寸
detatij = zeros(size(tij));     %初始化信息素变化矩阵
for i = 1:sizex      %循环每一只蚂蚁          
    for j = 1:sizey-1
        ttx = find( bestpx == px(i,j));
        tty = find( bestpy == py(i,j));
        ttsita = find(bestsita == sita(i,j));
        set = isempty(ttx)&&isempty(tty)&&isempty(ttsita);
        if (~set)
            % 在最优路径里面则更新信息素
            tx = px(i,j)/jindu+1;
            ty = py(i,j)/jindu+1;
            detatij(tx,ty,sita(i,j)) = detatij(tx,ty,sita(i,j))+deta;
        end
    end
end
tij = (1-p)*tij+detatij;     %信息素更新
[a,b,c] = size(tij);
for i = 1:a
    for j =1:b
        for t =1:c
            if(isnan(tij(i,j,t)))
                tij(i,j,t)=1000;
            elseif(tij(i,j,t)>1000)
                tij(i,j,t)=1000;
            elseif(tij(i,j,t)<0)
                tij(i,j,t)=0;
            else
                tij(i,j,t)=tij(i,j,t);
            end
                
        end
    end
end
end