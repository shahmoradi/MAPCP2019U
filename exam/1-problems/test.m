clc;clear;
%script requires cells.mat data file to be pre-downloaded from assignment
%webpage: http://www.shahmoradi.org/ICP2017F/exam/1-semester-project
load('cells.mat')

for k = 1:7
    for frame = 1:16
        figure(k)
        sp(frame) = subplot(4,4,frame);
        imagesc(cells(:,:,frame,k));
        j=title(['Z = ',num2str(frame)]);
       set(j,'FontSize',8,'FontWeight','normal')
        if frame ~= 1
            if frame ~= 5
                if frame ~= 9
                    if frame ~= 13
                        set(sp(frame),'YTickLabel',[])
                    end
                end
            end
        end
    end
    
    h = title(['Time = ',num2str([((k*2)+8)]),' days. Brain MRI slices along Z-direction, Rat W09. No radiation treatment.']);
    set(h,'FontSize',10,'FontWeight','normal')
    for frame = 1:12
        set(sp(frame),'XTickLabel',[])
    end
    
end