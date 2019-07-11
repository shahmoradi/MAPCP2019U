load('cells.mat');
data = cells;

% Graphing Actual Tumor Cell Count

global y
global tumorPlot

y = [0,10,12,14,16,18,20,22];

tumorCnt = 0;
tumorPlot(1) = 100000;
for k = 1:length(data(1,1,1,:))
for i = 1:length(data(1,1,:,k))
    tumorCntInverted = sum(data(:,:,i,k))';
    tumorCnt = tumorCnt + sum(tumorCntInverted);
end
tumorPlot(k+1) = tumorCnt;
tumorCnt = 0;
end

% Gompertzian Fit

input = [10,.1,1];

params = fminsearch(@getLogLike,input);

Time = 0:.1:25;
a = 100000*exp(params(1)*(1-exp(-1 * params(2)*Time)));


% Ploting

figure();
plot( y, tumorPlot, 'marker', '.', 'linewidth', 2, 'markersize', 30, 'color', 'blue');
hold on;
plot( Time, a, 'linewidth',2,'color','red');
xlabel('Time[days]');
ylabel('Tumor Cell Count');
title('Gompertzian Fit to Rat''s Brain Tumor Growth');
legend('Experimental Data','Gompertzian Fit', 'location', 'northwest');