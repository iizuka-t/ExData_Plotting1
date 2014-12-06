#plot1.R
library(data.table)
## We will be using data from the dates 2007-02-01 and 2007-02-02.
data <- fread("grep \"^[12]/2/2007\" exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",na.strings=c("?","NA","")) # the "data.table" package

dateandtime <- strptime(paste(data$V1,data$V2),format="%d/%m/%Y %H:%M:%S")

setnames(data,names(data),new=c("Date","Time","Global_active_power",
                                "Global_reactive_power","Voltage",
                                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png(file="plot1.png")
hist(data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     axes=F,
     main="Global Active Power")

axis(side=1, at=c(0,2,4,6))
axis(side=2, at=seq(0,1200,by=200))
dev.off()