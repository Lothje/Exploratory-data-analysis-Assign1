## Exploratory Data Analysis
## Course project 1 Plot4

## reading csv file
rawData <- read.csv(
     "household_power_consumption.txt", 
     sep=";", 
     dec=".", 
     na.strings = "?", 
     colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)

## select rows for analysis
el_feb07 <- rawData[ which(rawData$Date== "1/2/2007" | rawData$Date== "2/2/2007"),]

## Combine Date and Time in one field and convert to DateTime format
el_feb07$Date_time = strptime(paste(el_feb07$Date, el_feb07$Time), "%d/%m/%Y %H:%M:%S")

## Creating plot4: 4 plots
par(mfcol = c(2,2), mar = c(4, 4 ,3 ,2))

## Creating plot1: days vs Global Active Power (Kilowatts)
plot(el_feb07$Date_time,el_feb07$Global_active_power, xlab= "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(el_feb07$Date_time, el_feb07$Global_active_power)

## Creating plot2: days vs Energy sub metering
plot(el_feb07$Date_time, el_feb07$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(el_feb07$Date_time, el_feb07$Sub_metering_1, col = "black")
lines(el_feb07$Date_time, el_feb07$Sub_metering_2, col = "red")
lines(el_feb07$Date_time, el_feb07$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , col = c("black", "red", "blue"), cex=0.6, lty = 1)

## Creating plot 3: days vs voltage
plot(el_feb07$Date_time,el_feb07$Voltage, xlab= "datetime", ylab = "Voltage", type = "n")
lines(el_feb07$Date_time, el_feb07$Voltage)

## Creating plot 4:
plot(el_feb07$Date_time,el_feb07$Global_reactive_power, xlab= "datetime", ylab = "Global_reactive_power", type = "n")
lines(el_feb07$Date_time, el_feb07$Global_reactive_power)

## copy to png file in the working directory
dev.copy(png, file="plot4.png")
dev.off()