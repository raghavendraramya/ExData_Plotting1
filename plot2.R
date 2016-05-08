#Read data file
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data to required rows
Req_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Req_time <- paste(Req_Data$Date, Req_Data$Time, sep=" ")
rm(Data)
Req_class <- strptime(Req_time, "%d/%m/%Y %H:%M:%S") 

#set the png plot.
png("plot2.png", width=480, height=480)
plot(Req_class, as.numeric(Req_Data$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()