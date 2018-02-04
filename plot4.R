setwd("D:/exploratory analysis/Week 1 assignments")

#Import 
powerdata<- read.csv("household_power_consumption.txt", header=T, sep =";", na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Convert to date/time from charater and subset data based on the date ranges
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y") 
powerdatasubset <- subset(powerdata, powerdata$Date <= "2007-02-02" & powerdata$Date >= "2007-02-01" )
powerdatasubset$DateTime <- as.POSIXct(paste(powerdatasubset$Date, powerdatasubset$Time) )

#Plot 4

par (mfrow= c(2,2), mar = c(4,4,2,4), oum = c(1,1,0,0) )
with(powerdatasubset, 
     {plot (Global_active_power~DateTime,type ="l", ylab ="Global Active Power", xlab="" ) 
       plot (Voltage~DateTime,type ="l", ylab ="Voltage", xlab="datetime")
       plot (Sub_metering_1~ DateTime, type = "l", ylab = "Energy sub metering", xlab ="")
       lines(Sub_metering_2 ~ DateTime, col = "Red")
       lines(Sub_metering_3~DateTime, col = "Blue")
       plot (Global_reactive_power~ DateTime, type = "l", ylab = "Global Reactive Power", xlab ="datetime")})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()