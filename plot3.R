# Plot 3

# Read in data 
data = read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE)

# subset the data by the date
sub_data = data[data$Date %in% c("1/2/2007","2/2/2007"),]


# Convert the time series
time_series <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width = 480, height = 480)
# Active the plot device
with(sub_data, plot(time_series, as.numeric(Sub_metering_1), type ='l', col = 'black', 
                    ylab = "Energy sub metering"))
					
					
# Add two lines on top of the plot
with(sub_data, points(time_series, as.numeric(Sub_metering_2), type ='l', col = 'red'))
with(sub_data, points(time_series, as.numeric(Sub_metering_3), type ='l', col = 'blue'))


# legend setting
legend("topright", col = c("black",  "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	   
	   
dev.off()



