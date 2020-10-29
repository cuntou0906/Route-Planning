function [ output ] = iscollison( genxx,genyy,xobs,yobs,robs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscollison()：用于判断是否与障碍物碰撞
% genx geny为种群 xs ys,xt,yt分别为起始点和目标点
% xobs，yobs，robs为障碍物圆心和半径
% output 返回一个（gensize，1）数组为0.1 发生碰撞 为0不碰撞
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx); %获取种群维度
output = 0.1*ones(sizex,1);%初始化
for i = 1:sizex         % 循环每个个体
    for j = 1:sizey-1   % 循环每条路径的分段
        if(output(i)==0)
            break;
        end
        for t=1:length(xobs)
            fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
            if(strcmp(iscoll(fcoll,[genxx(i,j) genyy(i,j)],...
                    [genxx(i,j+1),genyy(i,j+1)]),'yes'))
                output(i)=0;%产生碰撞赋值0
                break;
            end
        end
    end
end

end

