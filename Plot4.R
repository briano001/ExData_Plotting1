
# Store the Household Power Consumption file into a variable called hh_pw_c
hh_pow_c <- "./household_power_consumption.txt"

# Read the dataset into R 
hh_pc <- read.table(hh_pow_c, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Take Just data from Jan 2 through Feb 2 instead of loading everything
hh_pc_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Take out the data and time data 
hh_pc_dt <- strptime(paste(hh_pc_subset$Date, hh_pc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Store the Global Active Power data in a variable called gap
gap <- as.numeric(hh_pc_subset$Global_active_power)

#Store the Global Reactive Power data in a variable called glrp
glrp <- as.numeric(subSetData$Global_reactive_power)

#Store the sub-metering data into variables
sm1 <- as.numeric(hh_pc_subset$Sub_metering_1)
sm2 <- as.numeric(hh_pc_subset$Sub_metering_2)
sm3 <- as.numeric(hh_pc_subset$Sub_metering_3)

#Store the Voltage data into a variable called volt
volt <- as.numeric(hh_pc_subset$Voltage)

# Plot and format the data
png("plot4.png", width=490, height=490)
par(mfrow = c(2, 2)) 

plot(hh_pc_dt, gap, type="l", xlab="Date / Time", ylab="Global active Power", cex=0.2)

plot(hh_pc_dt, volt, type="l", xlab="Date / Time", ylab="Voltage")

plot(hh_pc_dt, sm1, type="l", ylab="Energy Sub-metering", xlab="Date / Time")
lines(hh_pc_dt, sm2, type="l", col="red")
lines(hh_pc_dt, sm3, type="l", col="blue")
legend("topright", c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(hh_pc_dt, glrp, type="l", xlab="Date / Time", ylab="Global reactive Power")

# Write output graph to a file rather than the screen
dev.off()