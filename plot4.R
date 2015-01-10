#plot4.R

#read data
df1 <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
header = TRUE, sep = ";", na.strings = c("?", ""), 
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
   
#using data from the dates 2007-02-01 and 2007-02-02
df2 <- df1[which(df1$Date == "1/2/2007" | df1$Date == "2/2/2007"),]

#date and time convert
DateTime <- paste(as.Date(df2$Date, format = "%d/%m/%Y"), df2$Time)

#add new column DateTime
df3 <- cbind(DateTime = strptime(DateTime, "%Y-%m-%d %H:%M:%S"), df2)

pcolors <- c("black", "red", "blue")
par(mfrow=c(2,2)) #parameters

with(df3, {
	#1
    plot(DateTime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
	lines(DateTime, Global_active_power)
	#2
    plot(DateTime, Voltage, type = "n", xlab = "datetime")
	lines(DateTime, Voltage)
	#3	
    plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	lines(DateTime, Sub_metering_2, col = pcolors[2])
	lines(DateTime, Sub_metering_3, col = pcolors[3])
	legend("topright", col = pcolors, lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	#4
	plot(DateTime, Global_reactive_power, type = "n", xlab = "datetime")
	lines(DateTime, Global_reactive_power)    
})

# Copy plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480) 
## Close the PNG device
dev.off()  



