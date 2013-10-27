# run from Terminal with e.g:
# RScript batch.R "Jakis tytul" 1 2 3 424 242 323 2.33 323 > output.log
argv <- commandArgs(TRUE)
title <-  as.character(argv[1])
vars <- c(as.numeric(argv[2:length(argv)]))

cat("title =", title, "\n")
for (i in 1:length(vars)){ cat (i,"\n")}

today <-format(Sys.Date(), format="%d-%m-%Y")
png(paste("raport-",today,".png",sep=""))
barplot(vars,main=paste(title,today))

