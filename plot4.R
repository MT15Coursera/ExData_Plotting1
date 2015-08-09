## This code produces Plot 3 of the exercise

# Check if the data.table package is installed and install it if necessary
if (! is.element("data.table", installed.packages()[,1])) {
  install.packages("data.table")
}
# Load the package
library(data.table)

# Read the data from the file
originalData<-fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Extract only the data for 1-2/2/2007
scopeDates<-((originalData$Date=="1/2/2007")|(originalData$Date=="2/2/2007"))
exData<-originalData[scopeDates]

# Create the plot file
png(filename = "plot4.png")
# Change the system local time language to english 
Sys.setlocale("LC_TIME", "English")
# Paste the date and time columns to a single column
x<-paste(exData$Date, exData$Time)
# Read the unified time format to a format recognized by R 
datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")

# Define that the plot will have 2 rows and 2 columns
par(mfrow=c(2,2))    

# Draw top left plot
plot(datetime,exData$Global_active_power, type = "l",xlab="", ylab = "Global Active Power (kilowatts)")
# Draw top right plot
plot(datetime,exData$Voltage, type = "l",xlab="datetime", ylab = "Voltage")
# Draw bottom left plot
plot(datetime,exData$Sub_metering_1, type = "l",xlab="", ylab = "Energy sub metering")
lines(datetime,exData$Sub_metering_2, type = "l",col = "red")
lines(datetime,exData$Sub_metering_3, type = "l", col = "blue")
legendText=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend = legendText, lty = 1, col = c("black","red","blue"))
# Draw bottom right plot 
plot(datetime,exData$Global_reactive_power, type = "l",xlab="datetime", ylab = "Global_reactive_power")
dev.off()
