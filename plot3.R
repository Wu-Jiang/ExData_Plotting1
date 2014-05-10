totalpc<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
                    sep=";", header=TRUE,as.is=T)

#subset the data based on the provided date
pc<-subset(totalpc, Date=="1/2/2007"|Date=="2/2/2007")

#create a new column to merge date and time
DateTime<-paste(pc$Date,pc$Time)
#convert them into strptime format
pc$DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")

#convert character column to numeric ones
pc$Sub_metering_1<-as.numeric(pc$Sub_metering_1)
pc$Sub_metering_2<-as.numeric(pc$Sub_metering_2)
pc$Sub_metering_3<-as.numeric(pc$Sub_metering_3)

png(filename="plot3.png",width=480,height=480,units="px")
plot(pc$DateTime,pc$Sub_metering_1,type="l",xlab="", 
     ylab="Energy sub metering")
lines(pc$DateTime,pc$Sub_metering_2,col="red")
lines(pc$DateTime,pc$Sub_metering_3,col="blue")
legend("topright", lwd=1,col=c("black","blue","red"), 
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

