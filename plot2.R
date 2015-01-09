## This Rscript is for Coursera course Exploring Data
## uses data from the UC Irvine Machine Learning Repository specifically
## the Electric power consumption dataset
## This script is for plot 2 of project 1.
## ## File name plot2.R
##By Jperales

#Create file handle, read subset of data
fhandle <- file("household_power_consumption.txt")
hpcData <- read.table(text = grep("^[1,2]/2/2007", 
                                  readLines(fhandle), value = TRUE), 
                      col.names = c("Date", "Time", "Global_active_power", 
                                    "Global_reactive_power", "Voltage", "Global_intensity", 
                                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                      sep = ";", header = TRUE)

## Generate Plot 2
plot(hpcData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Save to png file 
dev.copy(png, file = "plot2.png")
dev.off()