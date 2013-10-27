setwd("~/Desktop/10c_R/fb")
ludzie<-read.csv("osoby.csv", header=FALSE,skip=1)
relacje<-read.csv("relacje.csv", header=FALSE,skip=1)
 
for (i in 1:nrow(ludzie)){ ludzie$V1[i] <-format(ludzie$V1[i], scientific=FALSE)}
for (i in 1:nrow(relacje)){ relacje$V1[i]<-format(relacje$V1[i], scientific=FALSE); relacje$V2[i]<-format(relacje$V2[i], scientific=FALSE);}
ludzie$inicjaly<-0
for (i in 1:nrow(ludzie)) {
    ludzie$inicjaly[i] <- paste(
     
    (strsplit(as.character(ludzie$V2[i]), ' ')[[1]])[1] ,
    substring(((strsplit(as.character(ludzie$V2[i]), ' ')[[1]])[2]),1,3)
     
    ,sep="")}    
ludzie$short<-0          
for (i in 1:nrow(ludzie)) {ludzie$short[i]=i}   
 
 
getShort <-function(long) {
     
    short<-0
    L<- 1
    R<- nrow(ludzie)
    M<- floor((L+R)/2)
     
    #for (i in L:R){
    while (L<=R){    
    if(ludzie$V1[M]==long){
        short<-ludzie$short[M]
        break
    }   else
    if(long < ludzie$V1[M] ){# szukany element < od wyznaczonego przez M
        R<-(M-1)
        M<-floor((L+R)/2) 
    }   else { #szukany element > od wyznaczonego przez M
        L<-(M+1)
        M<-floor((L+R)/2) 
    }
         
    }
 
    return (short)
     
}
 
 
getShort <-function(long) {
     
    short<-0
    short<-ludzie$V1[long]
 
    return (short)
     
}
 
 
 
getShort <-function(long) {
    short<-0
short<-ludzie$short[ludzie$V1 == long]
return (short)
}
 
rl<-relacje
 
for (i in 1:nrow(rl)){
    rl$V1[i]<-getShort(rl$V1[i]); rl$V2[i]<-getShort(rl$V2[i]);
}
 
getList<-function(){
l <-vector()
for (i in 1:nrow(rl)){
l<-c(l,rl$V1[i])
l<-c(l,rl$V2[i]) 
     
}
return(l)   
}
 
 
v<-getList()
 
library(igraph)
g<-graph(v, directed=FALSE)
V(g)$label <- ludzie$inicjaly
 
 
p2<-png(filename="plocik.png",width=6500,height=6500,unit="px")
p2<-plot(g, vertex.size=1, edge.color="red")
