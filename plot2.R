setwd("D:/exploratory analysis/Week 1 assignments")

#Import 
powerdata<- read.csv("household_power_consumption.txt", header=T, sep =";", na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Convert to date/time from charater and subset data based on the date ranges
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y") 
powerdatasubset <- subset(powerdata, powerdata$Date <= "2007-02-02" & powerdata$Date >= "2007-02-01" )
powerdatasubset$DateTime <- as.POSIXct(paste(powerdatasubset$Date, powerdatasubset$Time) )

#plot 2 
Sys.setlocale("LC_ALL", "English")
plot (powerdatasubset$Global_active_power~powerdatasubset$DateTime, type ="l", ylab ="Global Active Power (kilowatts)", xlab="" )
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()