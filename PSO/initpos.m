function [ genx ,geny ] = initpos(possize,dim,lim,xobs,yobs,robs,xs,ys,xt,yt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initgen():初始化个体   possize:粒子群大小
% xobs，yobs，robs为障碍物圆心和半径
%n:每个个体的染色体数目  dim每个粒子的维度
%lim:范围[xmin xmax ymin ymax]
%genx\geny：初始化粒子群 每一行为一个个体(genx 和 geny)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
genx = zeros(possize,dim);      %初始化粒子群x
geny = zeros(possize,dim);      %初始化粒子群y
for tt = 1:possize              %随机获取粒子群
  genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,dim);
  genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,dim);
  while(1)                      %循环生成粒子
      if(iscollison([xs genxx1 xt],[ys genyy1 yt],xobs,yobs,robs)~=0)
          break;
      end    %如果随机生成的粒子路径与障碍物相交，则重新生成
      genxx1 = lim(1) + (lim(2)-lim(1))*rand(1,dim);
      genyy1 = lim(3) + (lim(4)-lim(3))*rand(1,dim);
  end
  genx(tt,:) = genxx1;          %保存粒子x
  geny(tt,:) = genyy1;          %保存粒子y
end
end

