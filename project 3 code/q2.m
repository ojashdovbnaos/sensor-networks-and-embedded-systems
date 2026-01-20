clear all; close all; clc;
points = readtable('Graph_251388005.txt');  % 读取数据表
x = points.Var1;
y = points.Var2;
N = height(points);  % 节点数
RC = 0.25;  % 通信半径
RS = 0.2;   % 感知半径
deepGreen = [0, 0.5, 0];  % 森林绿

figure; hold on;

% 绘制感知范围（半透明绿色填充圆）
theta = linspace(0, 2*pi, 100);
for i = 1:N
    xc = x(i) + RS*cos(theta);
    yc = y(i) + RS*sin(theta);
    fill(xc, yc, deepGreen, 'FaceAlpha', 0.2, 'EdgeColor', 'none');
end

% 绘制节点（实心蓝点，稍大）
plot(x, y, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 4);
 plot(x(26), y(26), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 4);

% 绘制通信连接（加粗的蓝色虚线）
for i = 1:N
    for j = i+1:N
        d = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2);
        if d < RC
            plot([x(i), x(j)], [y(i), y(j)], 'b:', 'LineWidth', 1.2);
        end
    end
end

xlim([0 1]); ylim([0 1]);
xlabel('x Coordinate [L]');
ylabel('y Coordinate [L]');
title('Connectivity and Coverage');



figure; hold on;
[vx, vy] = voronoi(x, y);
plot(vx, vy, 'r:');  % 红色虚线 Voronoi 边

% 改成较小的实心蓝点
plot(x, y, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 4);

xlim([0 1]); ylim([0 1]);
xlabel('x Coordinate [L]');
ylabel('y Coordinate [L]');
title('Voronoi Tessellation');

% [xp, yp] = ginput();  % 不限定点数，按 Enter 结束
% plot(xp, yp, 'r-', 'LineWidth', 2);
% [xq, yq] = ginput(2);
% 
% %用绿色画第二条线段
% plot(xq, yq, 'y-', 'LineWidth', 2);

% 构建德劳内三角剖分
DT = delaunayTriangulation(x, y);

% 绘图
figure; hold on;

% 绘制三角剖分边（红色虚线）
triplot(DT, 'r:');

% 绘制节点（蓝色实心圆点）
plot(x, y, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 4);

xlim([0 1]); ylim([0 1]);
xlabel('x Coordinate [L]');
ylabel('y Coordinate [L]');
title('Delaunay Triangulation');
[xp, yp] = ginput();  % 不限定点数，按 Enter 结束
plot(xp, yp, 'r-', 'LineWidth', 2);
[xq, yq] = ginput(2);

%用绿色画第二条线段
plot(xq, yq, 'y-', 'LineWidth', 2);

