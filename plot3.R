setwd("D:/exploratory analysis/Week 1 assignments")

#Import 
powerdata<- read.csv("household_power_consumption.txt", header=T, sep =";", na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Convert to date/time from charater and subset data based on the date ranges
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y") 
powerdatasubset <- subset(powerdata, powerdata$Date <= "2007-02-02" & powerdata$Date >= "2007-02-01" )
powerdatasubset$DateTime <- as.POSIXct(paste(powerdatasubset$Date, powerdatasubset$Time) )

#Plot 3

with(powerdatasubset,
     {plot (Sub_metering_1~DateTime, type = "l", ylab= "energy sub metering", xlab = "") 
       lines(Sub_metering_2 ~ DateTime, col = "Red") 
       lines(Sub_metering_3~DateTime, col = "Blue")})

legend ("topright", col = c("Black", "Red", "Blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"  ),lty=1, lwd=1)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
