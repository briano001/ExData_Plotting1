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

#Plot and format the data
png("plot2.png", width=490, height=490)

plot(hh_pc_dt, gap, type="l", xlab="Date / Time", ylab="Global active Power (Kilowatts)")

#Write the data to a file called Plot 2 rather than the screen
dev.off()