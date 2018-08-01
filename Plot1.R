## Peer reviewd assignment course1: Exploratory data analysis: Plot1
library(data.table)
#setwd("C:/Users/212396399/Desktop/R_practice/Exploratory_data_analysis")

# read the input text file
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings = "?")

#subset data for the dates Feb01,2007 to Feb02,2007
data <- subset(data,data$Date =="1/2/2007" | data$Date == "2/2/2007")

#change date and time formats to classes date and time
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data$Date_Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$Date_Time <- as.POSIXct(data$Date_Time)

# Plot the histogram
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# save the histogram into a png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
