require("sqldf")
file <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' or DATE = '2/2/2007'"
power <- read.csv.sql(file,sql=mySql, sep=";")
png(filename="plot1.png", width=480, height=480,bg="transparent")
hist(power$Global_active_power, xlab="Global Active Power (kilowatts)",col="red", main="Global Active Power")
dev.off()