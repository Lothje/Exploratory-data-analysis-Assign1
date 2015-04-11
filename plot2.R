## Exploratory Data Analysis
## Course project 1 Plot2

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

## Creating plot2: Global Active Power (Kilowatts)
plot(el_feb07$Date_time,el_feb07$Global_active_power, xlab= "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(el_feb07$Date_time, el_feb07$Global_active_power)

## copy to png file in the working directory
dev.copy(png, file="plot2.png")
dev.off()