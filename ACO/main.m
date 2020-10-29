clear all;clc;
xs=0;      ys=0;      %起始点
xt=1.5;    yt=9;    %目标点
xobs=[1.5 4.0 1.2];   %障碍物（圆）
yobs=[6.5 3.0 1.5];
robs=[1.5 1.0 0.8];

theta=linspace(0,2*pi,100);             %绘图x坐标
NC = 100;                            %迭代次数
tij_ori = 1000;                       %初始信息素
m = 1;                               %定义蚂蚁数量
p= 0.01;                              %蒸发系数
tlim =[0 1000];                       %信息素的范围
a = 1; b = 3;                         %程度
lim=[0 3 0 3];
sitaran = [0 pi/4 pi/2 3/4*pi pi 5/4*pi 3/2*pi 7/4*pi 2*pi];
jindu = 0.5;                          %分割精度
enx = lim(2)/jindu; eny = lim(4)/jindu;        %横纵分割数目
tij = tij_ori*ones(enx,eny,8);        %八个方向的信息素
nij = zeros(enx,eny,8);
nij(:,:,1:2:8) = jindu*ones(enx,eny,4);
nij(:,:,2:2:8) = sqrt(2)*jindu*ones(enx,eny,4);
nij = ones(enx,eny,8)./nij;
obs = zeros(eny+1,enx+1);   %将障碍物点置为1
for i = 1:enx+1         % 循环x方向
    for j = 1:eny+1   % 循环y方向
        x = i*jindu-jindu;
        y = j*jindu-jindu;
        for t=1:length(xobs)
            fcoll = @(x,y)((x-xobs(t)).^2+(y-yobs(t)).^2-robs(t).^2);
            if(fcoll(x,y)<=0)
              obs(j,i)=1;%产生碰撞赋值0
              break;
            end
        end
    end
end


item = 1; %计数器
while(1)
    if (item>NC)
        break;
    end;
    disp(['第',num2str(item),'迭代']);
    item = item+1;                              %迭代器加1
    [ px,py,sita ] = calculate(nij,tij,obs,xt,yt,lim,m,jindu);
    sita(:,1)=[];
    [tij ] = updatexinxisu( px,py,sita,tij,jindu,p);
%     if (sum(sum(lasttij-tij,2),1)==0)
%         break;
%     end;
end

figure(1)                               %绘图句柄
for k=1:numel(xobs)                     %循环绘制障碍物
fill(xobs(k)+robs(k)*cos(theta),yobs(k)...
    +robs(k)*sin(theta),[0.5 0.7 0.8]);
hold on;
end
plot(xs,ys,'bs','MarkerSize',12,'MarkerFaceColor','y'); %绘制起始点
plot(xt,yt,'kp','MarkerSize',16,'MarkerFaceColor','g'); %绘制目标点
axis([0 6 0 10])                                        %设置坐标轴
title('蚁群算法-路径规划');grid on;                    %设置标题 添加网格
