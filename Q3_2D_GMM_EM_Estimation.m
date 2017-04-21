clear all;clc;close all;
% first distribution is centered at (0,0), second at (-1,3)
mu = [2 0; 0 5]; % mean
sigma = cat(3,[3 1;1 1],[1 0;0 1]); % covariance matrix
w = [0.95,0.05]; % weight
% Generate 300 samples of  GMM
Z = gmdistribution(mu,sigma,w);
R = random(Z,300);
n = statset('Display','final');
EM = gmdistribution.fit(R, 2, 'options',n);
% 2D projection(after convergence)
figure(1);subplot(2,2,1);
ezcontourf(@(x,y)pdf(EM,[x y]),[-4,8],[-4,8]);
title('2D Projection')
% view PDF surface plot
subplot(2,2,2); ezsurf(@(x,y)pdf(EM,[x y]),[-5 8],[-5 8]);
title('Surface Plot/3D Plot')
