xs=0;      ys=0;      %起始点
xt=1.5;    yt=8.9;    %目标点
xobs=[1.5 4.0 1.2];   %障碍物（圆）
yobs=[6.5 3.0 1.5];
robs=[1.5 1.0 0.8];
gensize =31;          %种群大小
gendai =50;          %演化代数
pa =0.7;              %交叉概率
pc= 0.07;             %变异概率
dim = 4;              %染色体数目
lim = [0 6 0 10];     %空间范围限制
[genx,geny] = initgen(gensize,dim,lim,xobs,yobs,robs,xs,ys,xt,yt);%初始化种群
[ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt);  %将起始点和目标点加入
[collision] = iscollison( genxx,genyy,xobs,yobs,robs);%检测是否与障碍物相交
[fitvalue] = fitvalue_cal( genxx,genyy,collision);    %适应度就算
maxfitvalue = 0;
maxfitvalueall=[];
for index = 1:gendai
 pa = pa -pa/gendai*0.1;                            %交叉概率更新
[ genx,geny ] = seclect( genx,geny,fitvalue,'lunpan');%选择操作
[ genx,geny ] = jiaocha( genx,geny,pa,fitvalue,xobs,yobs,robs,xs,ys,xt,yt);%交叉操作
[ genx,geny ] = bianyi( genx,geny,pc,lim,fitvalue,xobs,yobs,robs,xs,ys,xt,yt);%变异操作
[ genxx,genyy ] = addallgen( genx,geny,xs,ys,xt,yt);  %将起始点和目标点加入
[collision] = iscollison( genxx,genyy,xobs,yobs,robs);%检测是否与障碍物相交
[fitvalue] = fitvalue_cal( genxx,genyy,collision);%适应度计算
[tt,ttt] = max(fitvalue);               %找到最优个体
if(maxfitvalue<tt)                      %保留最优个体
    maxfitvalue=tt;                     %适应度
    maxgenx = genx(ttt,:);              %个体x
    maxgeny = geny(ttt,:);              %个体y
end
maxfitvalueall=[maxfitvalueall,tt];     %保留各代最优的适应度
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
[maxfitvalue,maxvalueindex] = max(fitvalue);            %获取适应度最大的路径
plot(genxx(maxvalueindex,:),genyy(maxvalueindex,:))     %绘制最优路径
axis([0 7 0 10])                               %设置坐标轴
title('遗传算法-路径规划');grid on;             %设置标题
figure(2)
plot(maxfitvalueall)                           %绘制适应度变化曲线
title('适应度变化曲线'); grid on;               %设置标题 添加网格
xlabel('代数/n'); ylabel('适应度')              %添加轴名称
disp(['最优距离：',num2str(1/(maxfitvalue*10))])%输出最短距离