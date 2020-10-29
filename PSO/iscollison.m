function [ output ] = iscollison( genxx,genyy,xobs,yobs,robs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iscollison() 是否与障碍物碰撞 xs ys,xt,yt为起始点和目标点
% genx geny为种群  xobs，yobs，robs为障碍物圆心和半径
% output 返回一个（gensize，1）数组为0.1 发生碰撞 为0不碰撞
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sizex,sizey] = size(genxx); %获取粒子维度
output = 0.1*ones(sizex,1);  %初始化
for i = 1:sizex              % 循环每个个体
    for j = 1:sizey-1        % 循环每条路径的分段
        if(output(i)==0)
            break;
        end
        for t=1:length(xobs) %与每个障碍物是否相交
            % 定义路径的边缘的匿名函数
            fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
            if(strcmp(iscoll(fcoll,[genxx(i,j) genyy(i,j)],...
                    [genxx(i,j+1),genyy(i,j+1)]),'yes'))
                output(i)=0; % 相交则赋值为0
                break;
            end
        end
    end
end

end

