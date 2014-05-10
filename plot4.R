power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
power2 <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
fdate <- as.POSIXct(strptime(paste(power2$Date, power2$Time), format = "%d/%m/%Y %H:%M:%S"))
a <- as.numeric(as.character(power2$Sub_metering_1))
activepower <- power2$Global_active_power
png(filename="plot4.png", width=480, height=480, bg="transparent")
par(mfrow = c(2,2), cex=0.77)
with (power2, {
plot(fdate,activepower, type="l",xlab = "", ylab= "Global Active Power")
plot(fdate, power2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(fdate, a, col="black",type="l", xlab="", ylab = "Energy sub metering")
lines(fdate, as.numeric(as.character(power2$Sub_metering_2)), type="l", col="red")
lines(fdate, as.numeric(as.character(power2$Sub_metering_3)), type="l", col="blue")
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(fdate, power2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()