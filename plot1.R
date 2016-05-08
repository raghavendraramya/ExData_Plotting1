library(datasets)
# Read data from dataset
Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data to required rows
Req_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(Data)

# Set the png plots.
png("plot1.png", width=480, height=480)
hist(as.numeric(Req_Data$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

