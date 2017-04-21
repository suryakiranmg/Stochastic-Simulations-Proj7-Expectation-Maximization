clc;clear all; %%---Mixture Distribution(Gaussian)---%%
N=100000;
for i=1:N
    if(rand <=0.4)
        Z(i)= normrnd(-1,1);
    else
        Z(i)= normrnd(1,1);
    end
end
histogram(Z,'BinLimits',[-4,4],'Normalization','pdf','FaceColor','g');
hold on; % overlaid the plots
%--Theoretical Distribution--%
y = -4:0.01:4;
mu1 = -1; mu2 = 1; var1 = 1; var2 = 1;
f1 = exp(-(y-mu1).^2./(2*var1))./(sqrt(2*pi*var1));
f2 = exp(-(y-mu2).^2./(2*var2))./(sqrt(2*pi*var2));
f = 0.4*f1 + 0.6*f2;
plot(y,f,'LineWidth',2,'Color','r');
legend('histogram','theoretical');title('Mixture Distribution');