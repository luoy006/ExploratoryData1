dat<-read.table("./household_power_consumption.txt",skip=1,sep=";")
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powerdat <- subset(dat,dat$Date=="1/2/2007" | dat$Date =="2/2/2007")

powerdat$Date <- as.Date(powerdat$Date, format="%d/%m/%Y")
powerdat$Time <- strptime(powerdat$Time, format="%H:%M:%S")
powerdat[1:1440,"Time"] <- format(powerdat[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerdat[1441:2880,"Time"] <- format(powerdat[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

quartz()
png(filename = "plot2.png",width = 480, height = 480)
plot(powerdat$Time,as.numeric(as.character(powerdat$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()