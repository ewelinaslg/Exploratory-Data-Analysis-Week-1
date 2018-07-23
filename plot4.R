setwd("C:/Users/Ewelina/Desktop/Coursera 2018/Exploratory analysis/Week 1")
plotdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Set date from Feb. 1, 2007 to Feb. 2, 2007

setdate <- plotdata[plotdata$Date %in% c("1/2/2007","2/2/2007"),]

## Remove incomplete observation
setdatef <- setdate[complete.cases(setdate),]

## Set time
settime <-strptime(paste(setdatef$Date, setdatef$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

## Final data to plot
fdata <- cbind(settime, setdatef)


## PLOT 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(fdata, {
  plot(Global_active_power ~ settime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage ~ settime, type="l",ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1 ~ settime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2 ~ settime,col='Red')
  lines(Sub_metering_3 ~ settime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ settime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()