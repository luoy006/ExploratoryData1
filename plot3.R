dat<-read.table("./household_power_consumption.txt",skip=1,sep=";",na.strings="?",stringsAsFactors=F)
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powerdat <- subset(dat,dat$Date=="1/2/2007" | dat$Date =="2/2/2007")

powerdat$Date <- as.Date(powerdat$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(powerdat$Date), powerdat$Time)
powerdat$Datetime <- as.POSIXct(datetime)

quartz()
png(filename = "plot3.png",width = 480, height = 480)
with(powerdat, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
