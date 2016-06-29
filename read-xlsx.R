fileName <-"/Volumes/MANSOUR/FIA project/Earlyemployee/2012 Banco Funcionarios Final 2012-05-24.xlsx"
library(openxlsx)
data<-read.xlsx(fileName,colNames=T,startRow=2)
firmName <-"/Volumes/MANSOUR/FIA project/Firm-2012-with-descriptions-Jun-22.xlsx"
firmData <-read.xlsx(firmName,colNames=T)
findCNPJ <-function(x){
  idx <- which(firmData["CODIGO"]==x)
    return(firmData[idx,2])
}
CnpjCode<-data.frame(sapply(data[,1],findCNPJ))