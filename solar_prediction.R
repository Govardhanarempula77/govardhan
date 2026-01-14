
# reading dataset

solar_prediction<-read.csv('epc_all-domestic-certificates_Manchester.csv', header=TRUE)
names(solar_prediction)
head(solar_prediction)
str(solar_prediction)
dim(solar_prediction)
nrow(solar_prediction)
ncol(solar_prediction)
summary(solar_prediction)
tail(solar_prediction)
#plot(solar_prediction$ADDRESS1, col=rainbow(8))
#plot(solar_prediction$CO2_EMISSIONS_CURRENT)
solar_prediction[2,]
library(dplyr)

solar_prediction %>% select_if(is.numeric)
solar_prediction %>% select(2,62)
cor(solar_prediction$NUMBER_OPEN_FIREPLACES, solar_prediction$PHOTO_SUPPLY, 
    method = c("pearson"),use ="complete.obs")
solar_prediction[is.na(solar_prediction)]=0
solar_prediction
#is_suitable<-c('ADDRESS1',
              # 'PROPERTY_TYPE',
              # 'TRANSACTION_TYPE',
               #'ROOF_DESCRIPTION')
#for (address in is_suitable)
#{
 # print(address)
#}
solar_prediction$ADDRESS1<-as.factor(solar_prediction$ADDRESS1)
solar_prediction$PROPERTY_TYPE<-as.factor(solar_prediction$PROPERTY_TYPE)
solar_prediction$NUMBER_OPEN_FIREPLACES<-as.factor(solar_prediction$NUMBER_OPEN_FIREPLACES)

#visualizing different property values
library(ggplot2)
ggplot(solar_prediction,aes(x=PROPERTY_TYPE))+geom_bar()
ggplot(solar_prediction,aes(x=NUMBER_OPEN_FIREPLACES))+geom_bar()
solar_prediction$ROOF_DESCRIPTION<-as.factor(solar_prediction$ROOF_DESCRIPTION)
ggplot(solar_prediction,aes(x=ROOF_DESCRIPTION))+geom_bar()
solar_prediction$TRANSACTION_TYPE<-as.factor(solar_prediction$TRANSACTION_TYPE)
ggplot(solar_prediction,aes(x=TRANSACTION_TYPE))+geom_bar()
ggplot(solar_prediction,aes(x=PHOTO_SUPPLY))+geom_bar()
ggplot(solar_prediction,aes(x=SOLAR_WATER_HEATING_FLAG))+geom_bar()
summary(solar_prediction$ROOF_DESCRIPTION)
summary(solar_prediction$PROPERTY_TYPE)
summary(solar_prediction$TRANSACTION_TYPE)

