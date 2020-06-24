df<-read.table("household_power_consumption.txt",sep=";",header = 1,na.strings = "?")
df<-df[complete.cases(df),]
library(dplyr)
df1<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")
df1$x<-paste(df1$Date,df1$Time,sep=",")
df1$x<-as.POSIXct(df1$x,format="%d/%m/%Y,%H:%M:%S")

#Plot2
plot(df1$x,df1$Global_active_power,type = "l",xlab="",ylab = "Global Active Power(kilowatts)")

#saving the plot,default pixels is 480x480
png(file="plot2.png")
plot(df1$x,df1$Global_active_power,type = "l",xlab="",ylab = "Global Active Power(kilowatts)")
dev.off()