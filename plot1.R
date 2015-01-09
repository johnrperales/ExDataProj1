# This Rscript is for Coursera course Exploring Data
# uses data from the UC Irvine Machine Learning Repository specifically
# the Electric power consumption dataset
# This script is for plot 1 of project 1.
# File name plot1.R
# By Jperales

#Create file handle, read subset of data
fhandle <- file("household_power_consumption.txt")
hpcData <- read.table(text = grep("^[1,2]/2/2007", 
                                  readLines(fhandle), value = TRUE), 
                      col.names = c("Date", "Time", "Global_active_power", 
                                    "Global_reactive_power", "Voltage", "Global_intensity", 
                                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                      sep = ";", header = TRUE)

# Generate Plot #1
hist(hpcData$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

#Save to png file having issue here not sure why fixed working directory was not set
dev.copy(png, file = "plot1.png")
dev.off()