firmName <-"/Volumes/MANSOUR/FIA project/step 2/FIA13-15 firm-S/2014 firm.xlsx"
library(openxlsx)
firmData<-read.xlsx(firmName,colNames=T)
LMName <-"/Volumes/MANSOUR/FIA project/step 2/FIA13-15 firm-S/FIA2014 (firm) LM.xlsx"
LMData <-read.xlsx(LMName,colNames=F)

myTransFunc<-function(x){
  return(toString(firmData[1,x]))
}
matchData<-sapply(LMData$X1,myTransFunc)
matchDataFrame<-data.frame(matchData)
fullData<-cbind(matchDataFrame,LMData)
write.xlsx(fullData,"/Volumes/MANSOUR/FIA project/step 2/FIA13-15 firm-S/2014-with-transform.xlsx")