# Store the Household Power Consumption file into a variable called hh_pw_c
hh_pow_c <- "./household_power_consumption.txt"

# Read the dataset into R 
hh_pc <- read.table(hh_pow_c, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Take Just data from Jan 2 through Feb 2 instead of loading everything
hh_pc_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Extract and standardize the date and time data 
hh_pc_dt <- strptime(paste(hh_pc_subset$Date, hh_pc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Store the Global Active Power data in a variable called gap
gap <- as.numeric(hh_pc_subset$Global_active_power)

#Store the sub-metering data into variables
sm1 <- as.numeric(hh_pc_subset$Sub_metering_1)
sm2 <- as.numeric(hh_pc_subset$Sub_metering_2)
sm3 <- as.numeric(hh_pc_subset$Sub_metering_3)

# Plot and format data 
png("plot3.png", width=490, height=490)
plot(hh_pc_dt, sm1, type="l", ylab="Energy sub-metering", xlab="Date / Time")
lines(hh_pc_dt, sm2, type="l", col="red")
lines(hh_pc_dt, sm3, type="l", col="blue")

legend("topright", c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Write output graph to a file rather than the screen
dev.off()