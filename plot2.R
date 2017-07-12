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

# plot global active power as a function of time (weekday) and save
Data2d$Global_active_power <- as.numeric(as.character(Data2d$Global_active_power))

png(filename="plot2.png",width = 480, height = 480)
plot(Data2d$Time,Data2d$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l",col="black")
dev.off()
