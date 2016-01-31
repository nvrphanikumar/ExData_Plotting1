power <- read.csv("C:\\Users\\dell\\Documents\\R\\household_power_consumption.txt",
                  sep=';',
                  header = TRUE,
                  na.strings=c("?","NA"),
                  stringsAsFactors = FALSE
)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power_2007 <- power[power$Date=="2007-02-01" | power$Date=="2007-02-02" , ]


datetime <- paste(power_2007$Date, power_2007$Time)
power_2007$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))

#1
with(power_2007,plot(Datetime,Global_active_power, type="l",
                     ylab="Global Active Power (kilowatts)", xlab=""))

#2
with(power_2007,plot(Datetime,Voltage, type="l",
                     ylab="Voltage", xlab="datetime"))

#3
with(power_2007,plot(Datetime,Sub_metering_1, type="l",
                     ylab="Energy sub metering", xlab=""))
with(power_2007,lines(Datetime,Sub_metering_2,col = "red"))
with(power_2007,lines(Datetime,Sub_metering_3,col = "blue"))

#4
with(power_2007,plot(Datetime,Global_reactive_power, type="l",
                     ylab="Voltage", xlab="datetime"))


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()