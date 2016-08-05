energy <- read.csv("~/Documents/RClass/EDA/household_power_consumption.txt", sep=";", na.strings="?")

x <- paste(energy$Date,energy$Time)
energy$datetime <- strptime(x,"%d/%m/%Y %H:%M:%S")
energy$realdate <- as.Date(energy$Date,"%d/%m/%Y")
energy <- subset(energy,realdate<as.Date("2007-02-03"))
energy <- subset(energy,realdate>as.Date("2007-01-31"))

png(file="plot4.png")
par(mfrow=c(2,2))

plot(energy$datetime,energy$Global_active_power,type="o",pch=".",xlab="",ylab="Global Active Power (kilowatts)")

plot(energy$datetime,energy$Voltage,type="o",pch=".",xlab="datetime",ylab="Voltage")

plot(energy$datetime,energy$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(energy$datetime,energy$Sub_metering_1,type="o",pch=".")
points(energy$datetime,energy$Sub_metering_2,type="o",pch=".",col="red")
points(energy$datetime,energy$Sub_metering_3,type="o",pch=".",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,pt.cex=.75,cex=.75,bty="n")

plot(energy$datetime,energy$Global_reactive_power,type="o",pch=".",xlab="datetime",ylab="Global_reactive_power")

dev.off()