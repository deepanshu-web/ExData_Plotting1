df<-read.table("household_power_consumption.txt",sep=";",header = 1,na.strings = "?")
df<-df[complete.cases(df),]
library(dplyr)
df1<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")


#plot 1

hist(df1$Global_active_power,col ="red",xlab = "Global Active Power(kilowatts)",
     main="Global Active Power")

#saving the plot
png(file="plot1")
hist(df1$Global_active_power,col ="red",xlab = "Global Active Power(kilowatts)",
     main="Global Active Power")
dev.off()