clc;clear all;close all;
duration = load('duration_data.mat');
duration = duration.duration;
waiting = load('waiting_data.mat');
waiting = waiting.waiting;
scatter(duration,waiting);
X =[duration,waiting];
title('without k-means clustering')
xlabel('duration'); ylabel('waiting');
%cascade data points
X = [duration,waiting];
%shuffle
X = X(randperm(size(X,1)),:);
%kmeans 
[y,C] = kmeans(X,2);
figure(2)
plot(X(y==1,1),X(y==1,2), 'x');
hold on;
plot(X(y==2,1),X(y==2,2), 'o');
plot(C(1,1),C(1,2), 'rx','LineWidth',2);
plot(C(2,1),C(2,2), 'ro','LineWidth',2);
legend('Points of cluster 1','Points of cluster 2')
title('Data Points with Labels by K-means Clustering')
hold off;
% GMM Distribution
EM = gmdistribution.fit(X,2);
% 2D projection
figure;
hold on
ezcontourf(@(x,y) pdf(EM,[x y]),[1.5 5.5, 40 100]);

plot(X(y==1,1),X(y==1,2),'^');
plot(X(y==2,1),X(y==2,2),'+');
title('2D contour plot overlaid with dataset');
xlabel('eruptions');
ylabel('waiting');


