totalpc<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
                    sep=";", header=TRUE,as.is=T)

#subset the data based on the provided date
pc<-subset(totalpc, Date=="1/2/2007"|Date=="2/2/2007")

#create a new column to merge date and time
DateTime<-paste(pc$Date,pc$Time)
#convert them into strptime format
pc$DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")
pc$Global_active_power<-as.numeric(pc$Global_active_power)

#open png file and draw the plot
png(filename="plot2.png",width=480,height=480,units="px")
plot(pc$DateTime,pc$Global_active_power,type="l",xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
