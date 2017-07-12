# remove all existing parameters, variables etc.
rm(list=ls(all=TRUE))

# read data 
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# transform data and time column
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# subset data (only use data from 2007-02-01 and 2007-02-02)
Data2d <- subset(data, data$Date == "2007-02-01" |  data$Date == "2007-02-02")

# create histogram and save in png
HistData <- as.numeric(as.character(Data2d$Global_active_power))

png(filename="plot1.png",width = 480, height = 480)
hist(HistData[HistData!="?"],breaks=15,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()