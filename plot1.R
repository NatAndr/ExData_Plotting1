#plot1.R

#read data
df1 <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
header = TRUE, sep = ";", na.strings = c("?", ""), 
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
   

#using data from the dates 2007-02-01 and 2007-02-02
df2 <- df1[which(df1$Date == "1/2/2007" | df1$Date == "2/2/2007"),]

#date and time convert
DateTime <- paste(as.Date(df2$Date, "%d/%m/%Y"), df2$Time)

#add new column DateTime
df3 <- cbind(DateTime = strptime(DateTime, "%Y-%m-%d %H:%M:%S"), df2)

## Create plot on screen device
with(df3, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

# Copy plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)  
## Close the PNG device
dev.off()  