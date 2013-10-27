required_lib =c("XLConnect","igraph","ggplot2","rJava")
install_required_libs()

install_required_libs<-function(){
for(i in 1:length(required_lib)){
    if(required_lib[i] %in% rownames(installed.packages()) == FALSE)
        {install.packages(required_lib[i])}
}
}