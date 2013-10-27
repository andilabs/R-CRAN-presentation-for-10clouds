#windows user should run x64 version of R because of problems with rJava package
require(XLConnect)
require(rJava)
path="http://www.users.pjwstk.edu.pl/~s8361/dane.xlsx"
download.file(path,paste(getwd(),basename(path),sep="/"),mode="wb")

workbook <- loadWorkbook(basename(path))
sheet_names <- getSheets(workbook)
print(sheet_names)

names(sheet_names) <- sheet_names
sheet_list <- lapply(sheet_names, function(.sheet){
readWorksheet(object=workbook, .sheet)})

class(sheet_list)
#[1] "list"
class(sheet_list[[1]])
#[1] "data.frame"
 