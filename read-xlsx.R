fileName <-"/Volumes/MANSOUR/FIA project/step 1/2013 employee.xlsx"
library(openxlsx)
data<-read.xlsx(fileName,colNames=T)
firmName <-"/Volumes/MANSOUR/FIA project/step 1/Firm-2013.xlsx"
firmData <-read.xlsx(firmName,colNames=T)
findCNPJ <-function(x){
  idx <- which(firmData["CODIGO"]==x)
    return(toString(firmData[idx,2]))
}
CnpjCode<-apply(data,1,findCNPJ)
CnpjCode<-data.frame(t(CnpjCode))
transformCnpj<-t(CnpjCode)
fullData<-data.frame(cbind(transformCnpj,data))
write.xlsx(fullData,"/Volumes/MANSOUR/FIA project/step 1/2013-June-29-with-cnpj.xlsx")