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

## PLOT 1 - Create the histogram
hist(fdata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()