power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
power2 <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
fdate <- as.POSIXct(strptime(paste(power2$Date, power2$Time), format = "%d/%m/%Y %H:%M:%S"))
activepower <- power2$Global_active_power
png(filename="plot2.png", width=480, height=480, bg="transparent")
plot(fdate,activepower, type="l",xlab = "", ylab= "Global Active Power (kilowatts)")
dev.off()