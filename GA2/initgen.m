function [ genx ,geny ] = initgen(sizegen,n,lim,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initgen():初始化个体 sizegen:种群大小
% xobs，yobs，robs为障碍物圆心和半径
%n:每个个体的染色体数目lim:范围[xmin xmax ymin ymax]
%genx\geny：初始化种群 每一行为一个个体(genx 和 geny)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
genx = zeros(sizegen,n);            %初始化种群
geny = zeros(sizegen,n);
for tt = 1:sizegen
  genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,n);
  genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,n);
  while(1)                  %初始化结果与障碍物碰撞则重新生成
      if(iscollison([xs genxx1 xt],[ys genyy1 yt],xobs,yobs,robs)~=0)
          break;
      end                   %重新生成个体
      genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,n);
      genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,n);
  end
  genx(tt,:) = genxx1;      %保留个体
  geny(tt,:) = genyy1;
end
end

