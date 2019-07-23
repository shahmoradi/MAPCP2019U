close all;
%Drand = randn(100,1);
save('Drand.mat','Drand');
mean(Drand)
histfit(Drand)
xlabel('Random Numbers');
ylabel('Counts')
saveas(gcf,'histfit.png');