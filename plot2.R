## This code produces Plot 2 of the exercise

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
png(filename = "plot2.png")
# Change the system local time language to english 
Sys.setlocale("LC_TIME", "English")
# Paste the date and time columns to a single column
x<-paste(exData$Date, exData$Time)
# Read the unified time format to a format recognized by R 
datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")
# Plot the figure
plot(datetime,exData$Global_active_power, type = "l",xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
