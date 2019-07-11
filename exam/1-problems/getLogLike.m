function Loglike = getLogLike(Param)
Loglike  = 0;
global y tumorPlot
for i = 1:length(y)
    mean = getLogCellLike(Param(1),Param(2),y(i));
    Loglike = Loglike + log(normpdf(log(tumorPlot(i)),mean,Param(3)));
end
Loglike = -Loglike;
end