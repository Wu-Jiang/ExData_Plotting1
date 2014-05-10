#read in the data, the columns are separated by ;
#as.is=T,convert all the columns to character
totalpc<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
                    sep=";", header=TRUE,as.is=T)
names(totalpc)
#subset the data based on the provided date
pc<-subset(totalpc, Date=="1/2/2007"|Date=="2/2/2007")


pc$Date<-as.Date(pc$Date,"%d/%m/%Y")

#convert pc$Global_active_power from factor to numeric
#pc$Global_active_power<-as.numeric(type.convert(pc$Global_active_power,dec="."))
#the above copmlex convert method should be applied when the pc$Global_active_power is the factor data
#I avoided this by reading the data using as.is=T
pc$Global_active_power<-as.numeric(pc$Global_active_power)

#open png file and draw the plot
png(filename="plot1.png",width=480,height=480,units="px")
hist(pc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",col="red")
dev.off()
