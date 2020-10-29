function [ output ] = select( fitvalue )
  %%%%%%%  轮盘赌选择方法  %%%%%%
  totalfit = sum(fitvalue);        %计算适应度总和
  p_fitvalue = fitvalue/totalfit;  %计算每个个体的适应度概率
  p_fitvalue = cumsum(p_fitvalue); %累加函数
  randdata = rand(1);              %随机选择一个数
  newin = 1;
  fitindex = 1;
  while newin<=length(fitvalue)    %循环轮盘赌法选择个体    
    if(randdata)<p_fitvalue(fitindex)
        output = fitindex;
        break;
    else
        fitindex = fitindex+1;
    end
  end
end