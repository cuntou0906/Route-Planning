function [ newgenx,newgeny ] = bianyi( genx,geny,pc,lim,fitvalue,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bianyi（）：变异操作
% genx geny为种群    % pc 变异概率
% lim 种群范围
% newgenx newgeny 新种群
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [maxfitvalue,maxvalueindex] = max(fitvalue);%找到适应度最大的个体
    [gensizex,gensizey] = size(genx);         %获取种群的大小和维度
    newgenx = zeros(gensizex,gensizey);       %初始化新种群
    newgeny = zeros(gensizex,gensizey);       %初始化新种群
    newgenx(1,:) = genx(maxvalueindex,:);     %保留最优个体
    newgeny(1,:) = geny(maxvalueindex,:);
    genx(maxvalueindex,:) = genx(1,:);        %替换最优个体
    geny(maxvalueindex,:) = geny(1,:);
    genx(1,:) = newgenx(1,:);
    geny(1,:) = newgenx(1,:);
    for i = 2:gensizex                        %循环计算
        pat = rand(1);                        %产生随机数
        if pat<=pc                            %产生变异
            genxline = lim(1) + (lim(2)-lim(1))*rand(1,gensizey);
            genyline = lim(3) + (lim(4)-lim(3))*rand(1,gensizey);
            newgenx(i,:) = genxline;          %新产生的个体保留
            newgeny(i,:) = genyline;           
        else                                  %不变异
            newgenx(i,:) = genx(i,:);
            newgeny(i,:) = geny(i,:);
        end
    end
end