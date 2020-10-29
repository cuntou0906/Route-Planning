function [ newgenx,newgeny ] = jiaocha( genx,geny,pa,fitvalue,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jiaocha（）：交叉操作
% genx geny为种群
% pa 交叉概率
% newgenx newgeny返回新种群
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
    for i = 2:2:gensizex-1
        pat = rand(1);             %产生随机数
        if pat<=pa                 %产生交叉
            a = rand(1);           %交叉比率
            xx1 = a*genx(i,:)+(1-a)*genx(i+1,:);
            xx2 = a*genx(i+1,:)+(1-a)*genx(i,:);
            yy1 = a*geny(i,:)+(1-a)*geny(i+1,:);
            yy2 = a*geny(i+1,:)+(1-a)*geny(i,:);
            while(1)   %交叉后与障碍物碰撞 则重新交叉
                if (iscollison([xs xx1 xt],[ys yy1 yt],xobs,yobs,robs)~=0)
                    if (iscollison([xs xx2 xt],[ys yy2 yt],xobs,yobs,robs)~=0)
                        break;
                    end
                end
                a = rand(1);           %交叉比率
                xx1 = a*genx(i,:)+(1-a)*genx(i+1,:);
                xx2 = a*genx(i+1,:)+(1-a)*genx(i,:);
                yy1 = a*geny(i,:)+(1-a)*geny(i+1,:);
                yy2 = a*geny(i+1,:)+(1-a)*geny(i,:);
            end
            newgenx(i,:) = xx1;       %保留交叉后的结果
            newgenx(i+1,:) = xx2;
            newgeny(i,:) = yy1;
            newgeny(i+1,:) = yy2;
        else                          %不交叉
            newgenx(i,:) = genx(i,:); %直接保留个体
            newgenx(i+1,:) = genx(i+1,:);
            newgeny(i,:) = geny(i,:);
            newgeny(i+1,:) = geny(i+1,:);
        end
    end
end