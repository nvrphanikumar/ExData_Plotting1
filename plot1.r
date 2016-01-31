power <- read.csv("C:\\Users\\dell\\Documents\\R\\household_power_consumption.txt",
                  sep=';',
                  header = TRUE,
                  na.strings=c("?","NA"),
                  stringsAsFactors = FALSE
                  )
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power_2007 <- power[power$Date=="2007-02-01" | power$Date=="2007-02-02" , ]
png(file='plot1.png', width=480, height=480)

with(power_2007,hist(Global_active_power,
                     xlab = "Global active power(kilowatts)",
                     col = "red",
                     main = "Global Active Power"))

dev.off()
