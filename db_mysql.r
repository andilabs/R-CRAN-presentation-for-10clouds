install.packages("RMySQL")
library(RMySQL)
NAZWA_TABELI = "andi"
#połączenie
mydb = dbConnect(MySQL(), user='andi_10c',password='########',dbname='andi_10c',host='##################')
#tworzymy w bazie nowa tabele o nazwie iris_table, zapisujac do niej data frame iris (defaultowo dostępny w R)
dbWriteTable(mydb, name=NAZWA_TABELI, value=iris)
#listujemy tabele w bazie
dbListTables(mydb)
#listujemy pola tabeli iris_table
dbListFields(mydb, NAZWA_TABELI)
#zapuszczamy sobie dowolne pożądane queries
rs=dbSendQuery(mydb, paste('select * from ',NAZWA_TABELI,' iris where Species = "setosa"'))
#przechwytujemy z querysetu dane do data framu
dane<-fetch(rs, n=-1)