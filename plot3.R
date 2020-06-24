df<-read.table("household_power_consumption.txt",sep=";",header = 1,na.strings = "?")
df<-df[complete.cases(df),]
library(dplyr)
df1<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")
df1$x<-paste(df1$Date,df1$Time,sep=",")
df1$x<-as.POSIXct(df1$x,format="%d/%m/%Y,%H:%M:%S")

#plot3
plot(df1$x,df1$Sub_metering_1+df1$Sub_metering_2+df1$Sub_metering_3,xlab="",ylab="Energy Sub Metering",type="n")
lines(df1$x,df1$Sub_metering_1,col="black") 
lines(df1$x,df1$Sub_metering_2,col="red") 
lines(df1$x,df1$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))


#saving the plot,default pixels is 480x480
png(file="plot3.png")
plot(df1$x,df1$Sub_metering_1+df1$Sub_metering_2+df1$Sub_metering_3,xlab="",ylab="Energy Sub Metering",type="n")
lines(df1$x,df1$Sub_metering_1,col="black") 
lines(df1$x,df1$Sub_metering_2,col="red") 
lines(df1$x,df1$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))

dev.off()