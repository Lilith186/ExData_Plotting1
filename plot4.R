# remove all existing parameters, variables etc.
rm(list=ls(all=TRUE))

# English weekdays
Sys.setlocale("LC_TIME", "English")

# read data 
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# transform data and time column
data$Time <- strptime(paste(data$Date,data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# subset data (only use data from 2007-02-01 and 2007-02-02)
Data2d <- subset(data, data$Date == "2007-02-01" |  data$Date == "2007-02-02")

# ensure numeric data
Data2d$Global_active_power <- as.numeric(as.character(Data2d$Global_active_power))
Data2d$Global_reactive_power <- as.numeric(as.character(Data2d$Global_reactive_power))
Data2d$Sub_metering_1 <- as.numeric(as.character(Data2d$Sub_metering_1))
Data2d$Sub_metering_2 <- as.numeric(as.character(Data2d$Sub_metering_2))
Data2d$Sub_metering_3 <- as.numeric(as.character(Data2d$Sub_metering_3))
Data2d$Voltage <- as.numeric(as.character(Data2d$Voltage))

# plot and save
png(filename="plot4.png",width = 480, height = 480)

par(mfrow = c(2, 2))

plot(Data2d$Time,Data2d$Global_active_power,xlab="",ylab="Global Active Power",type="l",col="black")
plot(Data2d$Time,Data2d$Voltage,xlab="datetime",ylab="Voltage",type="l",col="black")

plot(Data2d$Time,Data2d$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(Data2d$Time,Data2d$Sub_metering_2,col="red")
lines(Data2d$Time,Data2d$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid",bty="n")

plot(Data2d$Time,Data2d$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l",col="black")

dev.off()
