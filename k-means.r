library("party")
head(iris)
summary(iris)


ird<-matrix(c(iris$Sepal.Length,iris$Sepal.Width, iris$Petal.Length,iris$Petal.Width), ncol=4)
plot(ird)
rezultaty<-kmeans(ird,3)
rezultaty
plot(ird, col=rezultaty$cluster)
points(rezultaty$centers, col=6,pch=10,cex=3)
table(rezultaty$cluster)