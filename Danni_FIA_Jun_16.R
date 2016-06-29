# read xls into data

# there are multiple tabs in a single xls

# for xls tab :Dados IQGP 2012
xls_name<-'Complete Data 2011 2012 2013.xlsx'
library(openxlsx)
IQGP2012<-read.xlsx(xls_name,sheet ='Dados IQGP 2012')
# V1-CNPJ V2-Nome are of interest, we subset those
CNPJandNome<-IQGP2012[c("V1","V2")]
# for Dados IQAT 2012 Nome
IQAT2012<-read.xlsx(xls_name,sheet = 'Dados IQAT 2012')
# We want to match their assigned CNPJ code with matched Nome
# X1 is the column of interest
NomeIQAT2012 <- IQAT2012["X1"]
myFindCNPJ <-function(X){
  idxOfX <- which(CNPJandNome["V2"]==X)
    return(CNPJandNome[idxOfX,"V1"])
}
CNPJname<-apply(NomeIQAT2012,1,myFindCNPJ)
df<-data.frame(CNPJname = unlist(CNPJname))
CNPJCol<-rbind(0,df)
newData <-cbind(CNPJCol,IQAT2012)
write.csv(newData,'2012IQAT.csv')