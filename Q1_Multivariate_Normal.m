clc;clear all;
N=1000; %Length of array of each RV
%given mu and sigma matrices
mu = [1,2,3]; sigma = [3,-1,1;-1,5,3;1,3,4];
A = chol(sigma); %Choleski lower dia matrix
X = randn(N,3)*A + repmat(mu,N,1);
M = mean(X)
C = cov(X)
plotmatrix(X,'*r')
title('Scatter plot & Histogram of Random Data')