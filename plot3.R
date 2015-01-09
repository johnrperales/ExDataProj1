## This Rscript is for Coursera course Exploring Data
## uses data from the UC Irvine Machine Learning Repository specifically
## the Electric power consumption dataset
## This script is for plot 3 of project 1.
## File name plot3.R
##By Jperales

#Create file handle, read subset of data
fhandle <- file("household_power_consumption.txt")
hpcData <- read.table(text = grep("^[1,2]/2/2007", 
                                  readLines(fhandle), value = TRUE), 
                      col.names = c("Date", "Time", "Global_active_power", 
                                    "Global_reactive_power", "Voltage", "Global_intensity", 
                                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                      sep = ";", header = TRUE)

# Generate Plot #3

with(hpcData, {
        plot(Sub_metering_1, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2, col = 'Red')
        lines(Sub_metering_3, col = 'Blue')})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save to png file having issue here not sure why fixed working directory was not set
dev.copy(png, file = "plot3.png")
dev.off()