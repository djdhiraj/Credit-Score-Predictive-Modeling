Data<-read.csv(file.choose())
View(Data)
summary(Data)
str(Data)
Data$ property <-as.factor(Data$ property)
Data$credit_amount
Data$credit_amount<-as.factor(ifelse(Data$credit_amount<=2500,"0-2500",
                                     ifelse(Data$credit_amount>=2500,"2500-5000","5000+")))
str(Data$credit_amount)
View(Data$credit_amount)
summary(Data$credit_amount)
d = sort(sample(nrow(Data), nrow(Data)*.6))
View(d)
train<-Data[d,]
test<-Data[-d,]
Model<-glm(good_bad~.,data=train,family = binomial())
train<-subset(train,select=-default)
train$good_bad<-NULL
Model<-glm(good_bad~.,data=train,family = binomial())
train$good_bad<-1
Model
test$score<-predict(Model,test)
install.packages("ROCR")
pred<-prediction(test$score,test$good_bad)
#pred<-prediction(test$score,test$good_bad)
#perf <- performance(pred,"tpr","fpr")
#plot(perf)
