function logCellNum = getLogCellLike(lambda,c,time)

logCellNum = log(100000) + (lambda*(1-exp(-c*time)));

end