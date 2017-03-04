# Plot 4

# Read in data 
data = read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE)

# subset the data by the date
sub_data = data[data$Date %in% c("1/2/2007","2/2/2007"),]


# Convert the time series
time_series <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Create the png file
png("plot4.png", width = 480, height = 480)

# Create 4 subplots 
par(mfrow = c(2,2))



# Figure 1
with(sub_data, plot(time_series, as.numeric(Global_active_power), type ='l', 
                    ylab = "Global Active Power (kilowatts)"))

# Figure 2
with(sub_data, plot(time_series, as.numeric(Voltage), type ='l', col = 'black', 
                    ylab = "Voltage", xlab = "datetime"))


# Figure 3
with(sub_data, plot(time_series, as.numeric(Sub_metering_1), type ='l', col = 'black', 
                    ylab = "Energy sub metering"))
with(sub_data, points(time_series, as.numeric(Sub_metering_2), type ='l', col = 'red'))
with(sub_data, points(time_series, as.numeric(Sub_metering_3), type ='l', col = 'blue'))
legend("topright", col = c("black",  "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




# Figure 4
with(sub_data, plot(time_series, as.numeric(Global_reactive_power), type ='l', col = 'black', 
                    ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()





