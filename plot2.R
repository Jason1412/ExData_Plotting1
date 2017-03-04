# Plot 2

# Read in data 
data = read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE)

# subset the data by the date
sub_data = data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Convert the time series
time_series <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)
# plot the curve
with(sub_data, plot(time_series, as.numeric(Global_active_power), type ='l', 
                                            ylab = "Global Active Power (kilowatts)"))

dev.off()


