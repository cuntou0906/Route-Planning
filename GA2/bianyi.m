function [ newgenx,newgeny ] = bianyi( genx,geny,pc,lim,fitvalue,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bianyi（）：变异操作 genx geny为种群
% pc 变异概率 lim 种群范围
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [maxfitvalue,maxvalueindex] = max(fitvalue);
    [gensizex,gensizey] = size(genx);         %获取种群的维度 genx 种群个数
    newgenx = zeros(gensizex,gensizey);       %初始化新种群
    newgeny = zeros(gensizex,gensizey);       %初始化新种群
    newgenx(1,:) = genx(maxvalueindex,:);     %保留最优个体
    newgeny(1,:) = geny(maxvalueindex,:);     
    genx(maxvalueindex,:) = genx(1,:);        %替换最优个体
    geny(maxvalueindex,:) = geny(1,:);
    genx(1,:) = newgenx(1,:);
    geny(1,:) = newgenx(1,:);
    for i = 2:gensizex
        pat = rand(1);               %产生随机数
        if pat<=pc                   %产生变异
            genxline = lim(1) + (lim(2)-lim(1))*rand(1,gensizey);
            genyline = lim(3) + (lim(4)-lim(3))*rand(1,gensizey);
            while(1)                %变异后结果发生碰撞 则重新变异
              if(iscollison([xs genxline xt],[ys genyline yt],xobs,yobs,robs)~=0)
                 break;
              end                   %重新变异
              genxline = lim(1) + (lim(2)-lim(1))*rand(1,gensizey);
              genyline = lim(3) + (lim(4)-lim(3))*rand(1,gensizey);
            end
            newgenx(i,:) = genxline; %保留变异后的个体
            newgeny(i,:) = genyline;           
        else                         %不变异
            newgenx(i,:) = genx(i,:);%直接保留个体
            newgeny(i,:) = geny(i,:);
        end
    end
end