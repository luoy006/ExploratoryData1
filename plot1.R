dat<-read.table("./household_power_consumption.txt",skip=1,sep=";")
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powerdat <- subset(dat,dat$Date=="1/2/2007" | dat$Date =="2/2/2007")

quartz()
png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(powerdat$Global_active_power)),col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.off()