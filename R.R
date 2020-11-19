df=read.csv("listings.csv")

head(df)

library(caTools) 
set.seed(1000) 
split = sample.split(df$price, SplitRatio=0.7) 
Train = subset(df, split ==TRUE) 
Test = subset(df, split ==FALSE) 

nrow(Train)
nrow(Test)

model1=lm(price~., data=df)

summary(model1)

model1$residuals

SSE=sum(model1$residuals^2)

PredictTest=predict(model2, newdata=Test)

Plot(Test$price, Test$number_of_reviews) 

SSE=sum((Test$price-PredictTest)^2)
SST=sum((Test$price-mean(df$price))^2)
1-SSE/SST

