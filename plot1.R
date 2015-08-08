data <- read.table("household_power_consumption.txt", header=TRUE , sep=";", stringsAsFactors=FALSE , dec=".", na.strings="?")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

data.sub <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
data.sub$DateTime <- strptime(paste(data.sub$Date, data.sub$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
hist(data.sub$Global_active_power, main="Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency" )
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
