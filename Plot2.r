# Import
readFile <- read.csv(file = "household_power_consumption.txt", sep=";")

# Convert
readFile$DateTime <- strptime(paste(readFile$Date,readFile$Time), format="%d/%m/%Y %H:%M:%S")
readFile$Date <- strptime(readFile$Date,format="%d/%m/%Y")
readFile$Global_active_power <- as.numeric(readFile$Global_active_power) 

# Filter Dataframe
EPConsuption <- subset(readFile, readFile$Date >= as.POSIXct("2007-02-01") & readFile$Date <= as.POSIXct("2007-02-02")) 

png(filename="plot2.png", width = 480, height = 480)

plot(EPConsuption$DateTime,EPConsuption$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab='')

dev.off()



