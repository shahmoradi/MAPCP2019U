
% define URL variables
siteUrl = 'http://www.shahmoradi.org/';
dataRepos = [siteUrl,'ICP2017F/homework/5-problems/swift/'];

% create data directory
dataDirectory = 'swift/';
mkdir(dataDirectory);

% read the list event IDs
triggerList = webread([siteUrl,'ICP2017F/homework/5-problems/triggers.txt'], 'ContentType' , 'text');
triggerList = strsplit(triggerList,'\n')';

missingFileCounter = 0;
for i = 1:length(triggerList)
    filename = ['GRB',triggerList{i},'_ep_flu.txt'];
    myUrl = [dataRepos,filename];
    disp(['Fetching file ',filename,'...']);
    try
        data = webread(myUrl);
    catch
        missingFileCounter = missingFileCounter + 1;
        warning('file not found');
        continue;
    end
    fid = fopen([dataDirectory,filename],'w');
    fprintf(fid,'%s',data);
    fclose(fid);
end

disp(['There were a total of ', num2str(missingFileCounter), ' files missing in this repository.']);