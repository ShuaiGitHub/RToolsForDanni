fileName <-"/Volumes/MANSOUR/FIA project/Earlyemployee/2012 Banco Funcionarios Final 2012-05-24.xlsx"
library(openxlsx)
data<-read.xlsx(fileName,colNames=T,startRow=2)
firmName <-"/Volumes/MANSOUR/FIA project/Firm-2012-with-descriptions-Jun-22.xlsx"
firmData <-read.xlsx(firmName,colNames=T)
findCNPJ <-function(x){
  idx <- which(firmData["CODIGO"]==x)
    return(as.numeric(firmData[idx,2]))
}
CnpjCode<-lapply(data[,1],findCNPJ)
CnpjCode<-data.frame(t(CnpjCode))
transformCnpj<-t(CnpjCode)
transformCnpj<-as.numeric(transformCnpj)
fullData<-data.frame(cbind(transformCnpj,data))
write.xlsx(fullData,"/Volumes/MANSOUR/FIA project/2012-June-28-with-cnpj.xlsx")