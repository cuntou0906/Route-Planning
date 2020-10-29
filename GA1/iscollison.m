function [ output ] = iscollison( genxx,genyy,xobs,yobs,robs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscollison()：用于判断是否与障碍物碰撞
% genx geny为种群
% xobs，yobs，robs为障碍物圆心和半径
% xs ys,xt,yt分别为起始点和目标点
% output 返回一个（gensize，1）数组为1 发生碰撞 为0不碰撞
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx);
output = 1*ones(sizex,1);
for i = 1:sizex         % 循环每个个体
    for j = 1:sizey-1   % 循环每条路径的分段
        if(output(i)==0)
            break;
        end
        for t=1:length(xobs) %遍历每一个障碍物
            fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
            if(strcmp(iscoll(fcoll,[genxx(i,j) genyy(i,j)],...
                    [genxx(i,j+1),genyy(i,j+1)]),'yes'))
                output(i)=0;%产生碰撞
                break;
            end
        end
    end
end

end

