% clear
% clc

% siteUrl = 'https://www.cdslab.org/';
% fid = fopen('triggerData.txt', 'w');
% % read the list event IDs
% triggerList = webread([siteUrl,'ICP2017F/homework/5-problems/triggers.txt'], 'ContentType' , 'text');
% triggerList = strsplit(triggerList,'\n')';

% missingFileCounter = 0;
% for i =1:length(triggerList)
     
    % fileID = ['GRB',triggerList{i},'_ep_flu.txt'];
        
        % try data = webread([siteUrl, 'ICP2017F/homework/5-problems/swift/', fileID]);
         % % print [data] to fid
         % % need to separate files now
        % fprintf(fid, [data(12:end)  '\n']);
        % catch
            % i = i+1;
        % end
       
% end
% close('triggerData.txt');

% format for plotting
PlotData = importdata('triggerData.txt');

% plotting
% hold on;
Mask = PlotData(:,2) < 0.;
plot( exp( PlotData(Mask,2) ) ...
    ,      PlotData(Mask,1)   ...
    , 'color', 'red' ...
    , '.' ...
    )

title('Plot of E vs. Fluence for 650 Swift GRB Events', 'fontsize', 12)
xlabel('Fluene [ergs/cm^2]', 'fontsize', 13);
ylabel('E_peak', 'fontsize', 13);
set(gca,'xscale','log');
set(gca,'yscale','log');
xlim( 1.e-8, 1.e-2 )
ylim( 1.e0, 1.e4 )

%saveas(gcf, 'E_peak vs. Fluence for 650 Swift GRB Events.png')
 