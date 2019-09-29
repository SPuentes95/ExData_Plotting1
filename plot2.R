x = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
x$Date = as.Date(x$Date, "%d/%m/%Y")
x = x[x$Date >= as.Date("01-02-2007", "%d-%m-%Y"),]
x = x[x$Date <= as.Date("02-02-2007", "%d-%m-%Y"),]
x$DateTime = paste(x$Date, x$Time)
x$DateTime = strptime(x$DateTime, format = "%Y-%m-%d %H:%M:%S")
x$Global_active_power = as.numeric(x$Global_active_power)
png(filename = "plot2.png")
par(mar = c(3,5,2,2))
plot(x$DateTime, x$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)")
lines(x$DateTime, x$Global_active_power)
dev.off()