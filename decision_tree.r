required_lib =c("party","ctree","modeltools","coin","mvtnorm","zoo","sandwich","strucchange","vcd","colorspace")


install_required_libs<-function(){
for(i in 1:length(required_lib)){
    if(required_lib[i] %in% rownames(installed.packages()) == FALSE)
        {install.packages(required_lib[i])}
}
}

install_required_libs()
#################################


library("party")
head(iris)
summary(iris)


iris_ctree <- ctree(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris)

print(iris_ctree)

plot(iris_ctree)