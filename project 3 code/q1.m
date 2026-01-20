clc; clear; close all;

%% --- Step 1: Load node data ---
points = readtable('Graph_251388005.txt');  % 改成你的文件名
x = points.Var1;
y = points.Var2;
N = height(points);

RC = 0.25;  % 通信半径
RS = 0.2;   % 感知半径

%% --- Step 2: Plot connectivity and coverage ---
figure;
hold on;
axis equal;
xlim([0 1]); ylim([0 1]);
title('Network Connectivity and Coverage');
xlabel('x'); ylabel('y');
plot(x, y, 'bo', 'MarkerFaceColor','b');  % 节点

% 通信线（红线）
for i = 1:N
    for j = i+1:N
        d = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2);
        if d < RC
            plot([x(i), x(j)], [y(i), y(j)], 'r-');
        end
    end
end

% 感知圆（绿色虚线）
theta = linspace(0, 2*pi, 100);
for i = 1:N
    xc = x(i) + RS * cos(theta);
    yc = y(i) + RS * sin(theta);
    plot(xc, yc, 'g:');
end

%% --- Step 3: Voronoi + Breach Path ---
figure;
[vx, vy] = voronoi(x, y);
plot(x, y, 'bo', 'MarkerFaceColor','b'); hold on;
plot(vx, vy, 'k-');
xlim([0 1]); ylim([0 1]);
axis equal;
title('Voronoi Diagram - Click Maximal Breach Path');
xlabel('x'); ylabel('y');

% 用户点击路径
disp('Click the maximal breach path points (press Enter when done)');
[xp, yp] = ginput();  % 不限定点数，按 Enter 结束

% 绘制路径
plot(xp, yp, 'r-', 'LineWidth', 2);

% 计算 breach 路径长度（每段取与最近点的距离）
breach_cost = 0;
for i = 1:length(xp)-1
    seg_length = sqrt((xp(i+1)-xp(i))^2 + (yp(i+1)-yp(i))^2);
    breach_cost = breach_cost + seg_length;
end
disp(['Estimated breach path length: ', num2str(breach_cost)]);

%% --- Step 4: Delaunay + Support Path ---
figure;
tri = delaunay(x, y);
triplot(tri, x, y); hold on;
plot(x, y, 'ro', 'MarkerFaceColor','r');
xlim([0 1]); ylim([0 1]);
axis equal;
title('Delaunay Triangulation - Click Maximal Support Path');
xlabel('x'); ylabel('y');

% 用户点击路径
disp('Click the maximal support path points (press Enter when done)');
[xs, ys] = ginput();  % 不限定点数，按 Enter 结束

% 绘制路径
plot(xs, ys, 'b-', 'LineWidth', 2);

% 计算 support 路径的 cost（每段取 0.5 * 长度）
support_cost = 0;
for i = 1:length(xs)-1
    seg_length = sqrt((xs(i+1)-xs(i))^2 + (ys(i+1)-ys(i))^2);
    support_cost = support_cost + 0.5 * seg_length;
end
disp(['Estimated support path cost: ', num2str(support_cost)]);
