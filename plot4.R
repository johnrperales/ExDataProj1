## This Rscript is for Coursera course Exploring Data
## uses data from the UC Irvine Machine Learning Repository specifically
## the Electric power consumption dataset
## This script is for plot 4 of project 1.
## File name plot4.R
##By Jperales

#Create file handle, read subset of data
fhandle <- file("household_power_consumption.txt")
hpcData <- read.table(text = grep("^[1,2]/2/2007", 
                                  readLines(fhandle), value = TRUE), 
                      col.names = c("Date", "Time", "Global_active_power", 
                                    "Global_reactive_power", "Voltage", "Global_intensity", 
                                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                      sep = ";", header = TRUE)

# Generate Plot #4

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(hpcData, {
        plot(Global_active_power, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(Sub_metering_2, col = 'Red')
        lines(Sub_metering_3, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power, type = "l", 
             ylab = "Global_rective_power", xlab = "datetime")})

#Save to png file having issue here not sure why fixed working directory was not set
dev.copy(png, file = "plot4.png")
dev.off()