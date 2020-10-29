xs=0;   ys=0;           % start point  
xt=1.5; yt=8.9;         % Destination
xobs=[1.5 4.0 1.2];     %obstance
yobs=[6.5 3.0 1.5];
robs=[1.5 1.0 0.8];
theta=linspace(0,2*pi,100);%采样
for k=1:numel(xobs)        %绘制障碍物
fill(xobs(k)+robs(k)*cos(theta),yobs(k)+...
    robs(k)*sin(theta),[0.5 0.7 0.8]);
hold on;
end
figure(1)                  %绘制起始点和目标点
plot(xs,ys,'bs','MarkerSize',12,'MarkerFaceColor','y');
plot(xt,yt,'kp','MarkerSize',16,'MarkerFaceColor','g');
axis([0 10 0 10])
grid on;