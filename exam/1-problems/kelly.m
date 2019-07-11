close all;
load('cells.mat');
t_error = zeros(1,7);
t_cells = zeros(1,7);

for t = 10:2:22
    boundaries = 0;
    good_data = 0;
    array = cells(:,:,:,(t-10)/2+1);
    array_size = size(array);
    for i = 1:array_size(3)
        for y_lim = 1:array_size(1)
            for x_lim = 1:array_size(2)
                if x_lim==1 || x_lim==array_size(2) || y_lim==1 || y_lim==array_size(1) && array(y_lim,x_lim,i)~=0
                     boundaries = boundaries + array(y_lim,x_lim,i);
                 elseif x_lim==1 || x_lim==array_size(2) || y_lim==1 || y_lim==array_size(1) && (array(y_lim,x_lim,i)==0)
                     0;
                 elseif array(y_lim,x_lim,i)~=0 && array(y_lim+1,x_lim,i)==0 || array(y_lim-1,x_lim,i)==0 || array(y_lim,x_lim+1,i)==0 || array(y_lim,x_lim-1,i)==0 || array(y_lim-1,x_lim-1,i)==0 || array(y_lim+1,x_lim+1,i)==0 || array(y_lim-1,x_lim+1,i)==0 || array(y_lim+1,x_lim-1,i)==0
                     boundaries = boundaries + array(y_lim,x_lim,i);
                end
                if array(y_lim,x_lim,i) ~= 0
                    good_data = good_data + array(y_lim,x_lim,i);
                end
            end
        end
    end
    t_error( (t-10)/2+1 ) = boundaries;
    t_cells( (t-10)/2+1 ) = good_data;
end
 
t_error=t_error*.5;
x_lim = [0,10,12,14,16,18,20,22];
y_lim = horzcat(100000,t_cells(1:7));
error = horzcat(10000,t_error(1:7));
f = figure;
errorbar(x_lim,y_lim,error,'LineWidth',2,'Marker','o','MarkerSize',4);
xlabel('Time [days]');
ylabel('Tumor Cell Count');
title('Gompertzian Fit to Rat''s Brain Tumor Growth','FontSize',10);
hold on;

%Data setup
global logNumCell time ndata logNumCellInit
load('cells.mat')
numCellInit = 100000;
logNumCellInit = log(numCellInit);
time = [0,10,12,14,16,18,20,22];
ndata = length(time);
numCell = zeros(ndata,1);
logNumCell = zeros(ndata,1);
for itime = 2:ndata
    numCell(itime) = sum(sum(sum(cells(:,:,:,itime-1))));
    logNumCell(itime) = log(numCell(itime));
    
end

%Data fitting
% Param = [Lambda, c , sigma]
Param = [10,0.1,1];
ParamOptimal = fminsearch(@getLogLike, Param);

%Plotting data
ax = gca;
new_time = 0:0.2:22;
GompModel = exp(getLogNumCell(new_time, logNumCellInit, 8.0729, 0.1102));

plot(new_time,GompModel,8,1,'LineWidth',2);