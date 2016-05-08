#Read data file
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data to required rows
Req_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Req_time <- paste(Req_Data$Date, Req_Data$Time, sep=" ")
rm(Data)
Req_class <- strptime(Req_time, "%d/%m/%Y %H:%M:%S") 

#set the png plot.
png("plot3.png", width=480, height=480)
plot(Req_class, as.numeric(Req_Data$Sub_metering_1), col = "black", type = "l", ylab = "Energy Sub Metering", xlab = "")
lines(Req_class, as.numeric(Req_Data$Sub_metering_2), col= "red")
lines(Req_class, as.numeric(Req_Data$Sub_metering_3), col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()