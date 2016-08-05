energy <- read.csv("~/Documents/RClass/EDA/household_power_consumption.txt", sep=";", na.strings="?")

x <- paste(energy$Date,energy$Time)
energy$datetime <- strptime(x,"%d/%m/%Y %H:%M:%S")
energy$realdate <- as.Date(energy$Date,"%d/%m/%Y")
energy <- subset(energy,realdate<as.Date("2007-02-03"))
energy <- subset(energy,realdate>as.Date("2007-01-31"))

hist(energy$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()