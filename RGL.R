install.packages("rgl") 
library(rgl) 
emoji <- read.csv('C:\\Users\\Janani\\Desktop\\Janani\\PG Books\\Visualization\\Practical\\Emoji.csv')
plot3d(x = emoji$Context,y = emoji$Age, z = emoji$Gender,col = "blue",size = 3,type = "s",xlab = "Context",ylab = "Age",zlab = "Gender")
text3d(x = emoji$Context,y = emoji$Age,z = emoji$Gender,texts = emoji$Platform,adj = 1)
bar_data <- t(as.matrix(covid[, c("Context", "Age", "Gender")]))

str(emoji)
emoji$Context <- as.numeric(as.factor(emoji$Context))
emoji$Age <- as.numeric(emoji$Age)
emoji$Gender <- as.numeric(as.factor(emoji$Gender))
str(emoji)
head(emoji)
sum(is.na(emoji$Age))
sum(is.na(emoji$Gender))
plot3d(x = emoji$Context,y = emoji$Age, z = emoji$Gender,col = "blue",size = 3,type = "s",xlab = "Context",ylab = "Age",zlab = "Gender")
summary(emoji$Context)
summary(emoji$Age)
summary(emoji$Gender)
colnames(emoji)

library(rgl) 
emoji <- read.csv('C:\\Users\\Janani\\Desktop\\Janani\\PG Books\\Visualization\\Practical\\Emoji.csv')
plot3d(x = emoji$Context,y = emoji$Age, z = emoji$Gender,col = "blue",size = 3,type = "s",xlab = "Context",ylab = "Age",zlab = "Gender")
text3d(x = emoji$Context,y = emoji$Age,z = emoji$Gender,texts = emoji$Platform,adj = 1)


str(emoji)
emoji$Age <- ifelse(is.null(emoji$Age), 1, emoji$Age)
emoji$Gender <- ifelse(is.null(emoji$Gender), 1, emoji$Gender)


data("Titanic")
str(Titanic)
