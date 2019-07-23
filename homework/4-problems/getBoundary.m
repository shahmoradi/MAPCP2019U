load('data3D.mat')
BData = data;
BData(BData~=0) = 1;

izslice = 10;
BCell = bwboundaries(BData(:,:,izslice));
imagesc(BData(:,:,izslice))
hold on;
error = 0;
for iobject = 1:length(BCell)
    plot( BCell{iobject}(:,2) , BCell{iobject}(:,1) ...
        , 'linewidth' , 7 ...
        , 'color' , 'red' ...
        )
    error = error + sum ( data(BCell{iobject}(:,2) , data(BCell{iobject}(:,1) );
end

