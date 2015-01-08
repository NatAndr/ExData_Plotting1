#plot3.R

#read data
df1 <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
header = TRUE, sep = ";", na.strings = "?", 
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
   
#using data from the dates 2007-02-01 and 2007-02-02
df2 <- df1[which(df1$Date == "1/2/2007" | df1$Date == "2/2/2007"),]

#date and time convert
DateTime <- paste(as.Date(df2$Date, format = "%d/%m/%Y"), df2$Time)

#add new column DateTime
df3 <- cbind(DateTime = strptime(DateTime, "%Y-%m-%d %H:%M:%S"), df2)

pcolors <- c("black", "red", "blue")

with(df3, {
	# set up the plot
	plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	# add lines
	lines(DateTime, Sub_metering_2, col = pcolors[2])
	lines(DateTime, Sub_metering_3, col = pcolors[3])
	#legend
	legend("topright", col = pcolors, lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Copy plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480) 
## Close the PNG device
dev.off()  



