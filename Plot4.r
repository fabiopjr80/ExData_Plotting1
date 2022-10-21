# Import
readFile <- read.csv(file = "household_power_consumption.txt", sep=";")

# Convert
readFile$DateTime <- strptime(paste(readFile$Date,readFile$Time), format="%d/%m/%Y %H:%M:%S")
readFile$Date <- strptime(readFile$Date,format="%d/%m/%Y")
readFile$Global_active_power <- as.numeric(readFile$Global_active_power)
readFile$Global_reactive_power <- as.numeric(readFile$Global_reactive_power)  
readFile$Voltage <- as.numeric(readFile$Voltage)  
readFile$Sub_metering_1 <- as.numeric(readFile$Sub_metering_1) 
readFile$Sub_metering_2 <- as.numeric(readFile$Sub_metering_2)
readFile$Sub_metering_3 <- as.numeric(readFile$Sub_metering_3)

# Filter Dataframe
EPConsuption <- subset(readFile, readFile$Date >= as.POSIXct("2007-02-01") & readFile$Date <= as.POSIXct("2007-02-02")) 

png(filename="plot4.png", width = 480, height = 480)

# Combining Plots
par(mfrow=c(2,2))

# 1
plot(EPConsuption$DateTime,EPConsuption$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab='')

# 2
plot(EPConsuption$DateTime,EPConsuption$Voltage, type="l", ylab = "Voltage", xlab='datetime')

# 3
plot(EPConsuption$DateTime,EPConsuption$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab='')
lines(EPConsuption$DateTime,EPConsuption$Sub_metering_2, type="l", col='red')
lines(EPConsuption$DateTime,EPConsuption$Sub_metering_3, type="l", col='blue')
legend(x = "topright",col=c("black","red","blue"),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1)

# 4
plot(EPConsuption$DateTime,EPConsuption$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab='datetime')

dev.off()