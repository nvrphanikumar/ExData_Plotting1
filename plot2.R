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

with(power_2007,plot(Datetime,Global_active_power, type="l",
                     ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()