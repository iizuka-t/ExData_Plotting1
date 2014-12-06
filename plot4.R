# plot4.R
library(data.table)
## We will be using data from the dates 2007-02-01 and 2007-02-02.
data <- fread("grep \"^[12]/2/2007\" exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",na.strings=c("?","NA","")) # the "data.table" package

dateandtime <- strptime(paste(data$V1,data$V2),format="%d/%m/%Y %H:%M:%S")

setnames(data,names(data),new=c("Date","Time","Global_active_power",
                                "Global_reactive_power","Voltage",
                                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png("plot4.png")

par(mfrow=c(2,2)) # 2 by 2

plot(dateandtime,data$Global_active_power,
     xlab="",ylab="Global Active Power", typ="l")

plot(dateandtime,data$Voltage, xlab="datetime", ylab="Voltage", typ="l")

plot(dateandtime, data$Sub_metering_1, col=1, typ="l",
     xlab="", ylab="Energy sub metering")
lines(dateandtime,data$Sub_metering_2, col=2)
lines(dateandtime,data$Sub_metering_3, col=4)
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c(1,2,4), bty="n")

plot(dateandtime,data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", typ="l")

dev.off()