## Peer reviewd assignment course1: Exploratory data analysis: Plot3
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

# Make line plots
plot(data$Sub_metering_1 ~ data$Date_Time, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$Date_Time, col = "Red")
lines(data$Sub_metering_3 ~ data$Date_Time, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# save the plot into a png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
