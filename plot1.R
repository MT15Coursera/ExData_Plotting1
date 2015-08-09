## This code produces Plot 1 of the exercise

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
png(filename = "plot1.png")
# Produce the histogram
hist(as.numeric(exData$Global_active_power), col="red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
