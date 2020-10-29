function [ newgenx,newgeny ] = seclect( genx,geny,fitvalue,method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% seclect()：选择操作 genx geny为种群
% fitvalue 种群适应度 method 选择方法
% newgenx newgeny ：选择后的种群
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  轮盘赌选择方法  %%%%%%%
if strcmp(method,'lunpan')
  [gensizex,gensizey] = size(genx);%获取种群的维度 genx 种群个数
  totalfit = sum(fitvalue);        %计算适应度总和
  p_fitvalue = fitvalue/totalfit;  %计算每个个体的适应度概率
  p_fitvalue = cumsum(p_fitvalue); %累加函数
  randdata = sort(rand(gensizex,1));   %从小到大排列 %sort是排序函数
  newgenx = zeros(gensizex,gensizey);       %初始化新种群
  newgeny = zeros(gensizex,gensizey);       %初始化新种群
  fitindex = 1;                    %循环索引
  newin = 1;                       %循环索引
  while newin<=gensizex                %循环 轮盘赌法选择个体    
    if(randdata(newin))<p_fitvalue(fitindex)
        newgenx(newin,:) = genx(fitindex,:);
        newgeny(newin,:) = geny(fitindex,:);
        newin = newin+1;
    else
        fitindex = fitindex+1;
    end
  end

%%%%%%%  锦标赛选择方法  %%%%%%%
elseif strcmp(method,'jinbiao')  %锦标赛法
  [gensizex,gensizey] = size(genx);    %获取种群的维度 genx 种群个数 
  newgenx = zeros(gensizex,gensizey);  %初始化新种群
  newgeny = zeros(gensizex,gensizey);  %初始化新种群
  sizeindex = round(0.5*gensizex);     %抽取样本数为种群大小的一半
  for i = 1:gensizex                   %循环抽取新的种群
    indext = round(1+rand(sizeindex,1)*(gensizex-1));%随机选择一定数量的个体
    [maxgen,indexmax] = max(fitvalue(indext));%找到适应度最大的个体
    newgenx(i,:) = genx(indexmax,:);
    newgeny(i,:) = geny(indexmax,:);
  end

end
end