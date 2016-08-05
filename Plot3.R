energy <- read.csv("~/Documents/RClass/EDA/household_power_consumption.txt", sep=";", na.strings="?")

x <- paste(energy$Date,energy$Time)
energy$datetime <- strptime(x,"%d/%m/%Y %H:%M:%S")
energy$realdate <- as.Date(energy$Date,"%d/%m/%Y")
energy <- subset(energy,realdate<as.Date("2007-02-03"))
energy <- subset(energy,realdate>as.Date("2007-01-31"))

png(file="plot3.png")

plot(energy$datetime,energy$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(energy$datetime,energy$Sub_metering_1,type="o",pch=".")
points(energy$datetime,energy$Sub_metering_2,type="o",pch=".",col="red")
points(energy$datetime,energy$Sub_metering_3,type="o",pch=".",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,pt.cex=1,cex=1.50)

dev.off()