x = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
x$Date = as.Date(x$Date, "%d/%m/%Y")
x = x[x$Date >= as.Date("01-02-2007", "%d-%m-%Y"),]
x = x[x$Date <= as.Date("02-02-2007", "%d-%m-%Y"),]
x$Global_active_power = as.numeric(x$Global_active_power)
png(filename = "plot1.png")
hist(x$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()