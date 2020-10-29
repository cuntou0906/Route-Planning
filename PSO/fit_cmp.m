function [ pbest,pidx,pidy,gbest,pgdx,pgdy ] = fit_cmp(posx,posy,fitvalue,pbest,pidx,pidy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fit_cmp(）更新适应度比较
% pos 当前位置            fitvalue 当前适应度
% pbest 每个粒子最优适应度 pidx pidy 每个粒子对应的位置
% gbest 全局最优适应度     pgdx pgdy 全局最优位置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[max1,index1] = max(fitvalue); %适应度最大值
gbest = max1;                  %最优适应度
pgdx = posx(index1,:);         %最优粒子x
pgdy = posy(index1,:);         %最优粒子y
for i = 1:size(posx,1)         %循环每个粒子
    if(fitvalue(i)>pbest(i))   %找到个体最优
        pidx(i,:) = posx(i,:); %覆盖历史最优位置x
        pidy(i,:) = posy(i,:); %覆盖历史最优位置y
        pbest(i) = fitvalue(i);%每个个体最优适应度
    end
end
end