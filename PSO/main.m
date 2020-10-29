xs=0;      ys=0;      %起始点
xt=1.5;    yt=8.9;    %目标点
xobs=[1.5 4.0 1.2];   %障碍物（圆）
yobs=[6.5 3.0 1.5];
robs=[1.5 1.0 0.8];
possize =81;          %种群大小
gendai =200;          %演化代数
w =0.9;               %权重系数
c1= 2; c2 =2;         %学习学习因子
dim = 5;              %每个粒子维度
vmax = 1;             %速度最大值
lim = [0 6 0 10];     %空间范围限制
[posx,posy] = initpos(possize,dim,lim,xobs,yobs,robs,xs,ys,xt,yt);%初始化种群
[ vx ,vy ] = initv(possize,dim,vmax);                 %初始化速度

pbest =zeros(possize,1);  %每个粒子最优适应度
pidx =zeros(possize,dim);  %每个粒子对应的位置 x方向
pidy =zeros(possize,dim);  %每个粒子对应的位置 y方向

maxgbest = zeros(1);    %整个过程中最优适应度
maxpgdx = zeros(1,dim); %整个过程全局最优位置 x方向
maxpgdy = zeros(1,dim); %整个过程全局最优位置 y方向
maxfitvalueall = [];    %各代最优适应度

for item = 1:gendai
   [ posxx,posyy ] = addallgen( posx,posy,xs,ys,xt,yt);  %将起始点和目标点加入
   [collision] = iscollison( posxx,posyy,xobs,yobs,robs);%检测是否与障碍物相交
   [fitvalue] = fitvalue_cal( posxx,posyy,collision);    %适应度计算 
   [pbest,pidx,pidy,gbest,pgdx,pgdy ] = fit_cmp(posx,...
       posy,fitvalue,pbest,pidx,pidy);     %个体最优适应度和全局最优适应度更新
   [vx,vy] = updatev( vx,vy,w,posx,posy,pidx,pidy,...
       pgdx,pgdy,c1,c2);                   %速度更新
   [posx,posy] = updatepos( posx,posy,vx,vy);%位置更新
   if(maxgbest<gbest)                      %判断是否优于历史最优结果
       maxgbest = gbest;                   %保存历史最优适应度
       maxpgdx = pgdx;                     %保存历史最优粒子x
       maxpgdy = pgdy;                     %保存历史最优粒子y
   end
   maxfitvalueall = [maxfitvalueall,maxgbest];    %各代最优适应度
   w = w-(w-0.3)/gendai;                  %群众最优
end
theta=linspace(0,2*pi,100);             %绘图x坐标
figure(1)                               %绘图句柄
for k=1:numel(xobs)                     %循环绘制障碍物
fill(xobs(k)+robs(k)*cos(theta),yobs(k)...
    +robs(k)*sin(theta),[0.5 0.7 0.8]);
hold on;
end
plot(xs,ys,'bs','MarkerSize',12,'MarkerFaceColor','y'); %绘制起始点
plot(xt,yt,'kp','MarkerSize',16,'MarkerFaceColor','g'); %绘制目标点
plot([xs maxpgdx xt],[ys maxpgdy yt])                   %绘制最优路径
axis([0 7 0 10])                                        %设置坐标轴
title('粒子群算法-路径规划');grid on;                    %设置标题 添加网格
figure(2)
plot(maxfitvalueall)                           %绘制适应度变化曲线
title('适应度变化曲线'); grid on;               %设置标题 添加网格
xlabel('代数/n'); ylabel('适应度')              %添加轴名称
disp(['最优距离：',num2str(1/(maxgbest*10))])