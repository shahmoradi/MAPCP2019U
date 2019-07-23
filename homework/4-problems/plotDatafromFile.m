close all;
% Now read all data files and plot the results
dataDirectory = './swift/';
triggerListDirectory = './';
triggerList = fileread([triggerListDirectory,'triggers.txt']);
triggerList = strsplit(triggerList,'\r\n');
missingFileCounter = 0;


eventCounter = 0;
figure(); hold on; %'color','none','visible','off');

for i = 1:length(triggerList)
    filename = ['GRB',triggerList{i},'_ep_flu.txt'];
    dataFile = [dataDirectory,filename];
    if exist(dataFile,'file')
        disp(['Reading data for the event number ',num2str(i)]);
        data = readtable(dataFile);
        data = table2array(data);
        if isempty(data)
            warning('data file is empty! skipping...');
        elseif all(data(:,2)<0.0)
            eventCounter = eventCounter + 1;
            scatter( exp( data(:,2) ) ...
                   , data(:,1) ...
                   , 1 ...
                   , 'MarkerFaceColor', 'red' ...
                   , 'MarkerEdgeColor', 'red' ...
                   , 'MarkerFaceAlpha', .01 ...
                   , 'MarkerEdgeAlpha', .01 ...
                   );
        end
    else
        disp('missing file encountered. Skipping...');
    end
end

xlabel( 'Fluence [ergs/cm^2]' ...
      , 'fontsize',13 ...
      );
ylabel( 'E_{peak}' ...
      , 'fontsize', 13 ...
      );
title( ['Plot of E_{peak} vs Fluence for ', num2str(eventCounter), ' Swift GRB events'] ...
     ,'fontsize',13 ...
     );
set( gca, 'xscale', 'log', 'yscale', 'log');
xlim([1.0e-8 1.0e-2]);
ylim([1 10000]);
saveas(gcf,'swiftDataPlot.png');