datetime <- paste(power_2007$Date, power_2007$Time)
power_2007$Datetime <- as.POSIXct(datetime)

str(power_2007)
with(power_2007,plot(Datetime,Sub_metering_1, type="l",
                     ylab="Energy sub metering", xlab=""))
with(power_2007,lines(Datetime,Sub_metering_2,col = "red"))
with(power_2007,lines(Datetime,Sub_metering_3,col = "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()