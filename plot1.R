## Exploratory Data Analysis
## Course project 1 Plot1

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

par(mfrow = c(1,1))

## Creating plot1: Histogram van Global Active Power (Kilowatts)
hist(el_feb07$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## copy to png file in the working directory
dev.copy(png, file="plot1.png")
dev.off()