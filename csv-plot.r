#wczytanie plikow z danymi ocen workerow
message("Wskaz plik z wynikami z systemu MACE")
mace=read.csv(file.choose(),header=FALSE,sep="")
message("Wskaz plik z wynikami z systemu TROIA v. mincost")
troia=read.csv(file.choose(),header=FALSE,sep="\t")
 
 
 
#wyliczenie względnej oceny dla workerów. 1=najlepszy worker
mace$relaive_score<-mace$V1/max(mace$V1)
troia$relaive_score<-troia$V2/max(troia$V2)
 
 
#wyświetlenie wykresów z ocenami jakości dla platform
plot(sort(mace$V1),type="l",col="red", ylab="Quality in different platforms",xlab=paste("Correlation bettwen troia minCost and mace scores=",cor(mace$V1,troia$V2)))
lines(sort(troia$V2),col="green")
legend("topleft", legend = c("troia","mace"), pch=1, col=c("green","red"))
