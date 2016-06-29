fileName <-"./Earlyemployee/2012 Banco Funcionarios Final 2012-05-24.xlsx"
library(openxlsx)
data<-read.xlsx(fileName,colNames=T)
firmName <-"Firm-2012-with-descriptions-Jun-22.xlsx"
firmData <-read.xlsx(firmName,colNames=T)
