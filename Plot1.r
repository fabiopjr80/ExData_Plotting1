# Import
readFile <- read.csv(file = "household_power_consumption.txt", sep=";")

# Convert
readFile$Date <- strptime(readFile$Date,format="%d/%m/%Y")
readFile$Global_active_power <- as.numeric(readFile$Global_active_power) 

# Filter Dataframe
EPConsuption <- subset(readFile, readFile$Date >= as.POSIXct("2007-02-01") & readFile$Date <= as.POSIXct("2007-02-02")) 

png(filename="plot1.png", width = 480, height = 480)

# Histogram
hist(EPConsuption$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')

dev.off()
