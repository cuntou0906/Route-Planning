function [ px,py,sita ] = calculate(nij,tij,obs,xt,yt,lim,m,jindu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate() 用于计算每一个周游
% nij 距离的倒数 tij 信息素  a 信息素重要程度 b 启发因子重要程度
% tabu 禁忌表 newtabu 路径（禁忌表）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
px = zeros(m,1);py=zeros(m,1); %初始化当前点
sitaran = [0 pi/4 pi/2 3/4*pi pi 5/4*pi 3/2*pi 7/4*pi 2*pi];
sita = zeros(m,1);
while(1)
    genx = (px(:,end)==xt*ones(m,1));
    geny = (py(:,end)==yt*ones(m,1));
    if(sum(genx)+sum(geny)==2*m)   %所有蚂蚁都到终点
        break;
    end
    sita = [sita,zeros(m,1)];
    px = [px ,zeros(m,1)];
    py = [py ,zeros(m,1)];
    for i = 1:m                %循环每一只蚂蚁
        disp(['第',num2str(i),'蚂蚁']);
        while(1)
            if((px(i,end-1)==xt)&&(py(i,end-1)==yt)) %已经到达终点
                px(i,end) = px(i,end-1); %保持不动
                py(i,end) = py(i,end-1);
                sita(i,end) = sita(i,end-1);
                disp(['第',num2str(i),'蚂蚁到达终点']);
                break;
            end
            lasttx =  px(i,end-1)/jindu+1;
            lastty =  py(i,end-1)/jindu+1;
            ttij = reshape(tij(lasttx,lastty,:),1,8);
            nnij = reshape(nij(lasttx,lastty,:),1,8);
            pij = ttij.*nnij/sum(ttij.*nnij); % 计算八个方向选择概率
            nextsita =  select(pij);          % 选择角度
            ppx = px(i,end-1)+jindu*design(cos(sitaran(nextsita)));
            ppy = px(i,end-1)+jindu*design(sin(sitaran(nextsita)));
            ab = [px(i,:);py(i,:)];           % 第i只蚂蚁走过的路径
            abc =  [ppx;ppy];                 % 下一步的点
            for mt = 1:size(ab,2)
                set = (sum(ab(:,mt)-abc));   % set =0 表示走过 1没走过
                if(set==0)
                break
                end
            end
            if((ppx>lim(1))&&(ppy>lim(3))&&(ppx<lim(2))&&(ppy<lim(4))&&set)
                tx = ppx/jindu+1;             % 计算坐标位置
                ty = ppy/jindu+1;
                if(obs(ty,tx)==0)             % 不碰撞
                   px(i,end) = ppx;
                   py(i,end) = ppy;
                   [px;py]
                   sita(i,end) = nextsita;
                   break;
                end
            end
        end
    end
end

