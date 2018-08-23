data<-credit
d = sort(sample(nrow(credit), nrow(credit)*.6))
#select training sample
train<-data[d,]
#select test sample
test<-data[-d,]


train<-subset(train,select=-default)
