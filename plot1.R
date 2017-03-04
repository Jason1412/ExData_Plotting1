# Plot 1

# Read in data 
data = read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE)

# subset the data by the date
sub_data = data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Open the plotting device
png("plot1.png", width = 480, height = 480)

# plot the histogram of the data
with(sub_data, hist(as.numeric(Global_active_power), col = 'red', 
     xlab = 'Global Active Power (kilowatts)', 
     ylab = 'Frequency', 
     main = paste('Global Active Power')))

dev.off()








