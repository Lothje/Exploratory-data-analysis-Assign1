## Exploratory Data Analysis
## Course project 1 Plot3

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

par(mfrow = c(1,1))

## Creating plot3: Energy sub metering
plot(el_feb07$Date_time, el_feb07$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(el_feb07$Date_time, el_feb07$Sub_metering_1, col = "black")
lines(el_feb07$Date_time, el_feb07$Sub_metering_2, col = "red")
lines(el_feb07$Date_time, el_feb07$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , col = c("black", "red", "blue"), lty = 1)

## copy to png file in the working directory
dev.copy(png, file="plot3.png")
dev.off()