setwd("/Users/ramosm18/Desktop/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subset_gap <- as.numeric(subsetdata$Global_active_power)
subset_grp <- as.numeric(subsetdata$Global_reactive_power)
subset_volt <- as.numeric(subsetdata$Voltage)
Submetering1 <- as.numeric(subsetdata$Sub_metering_1)
Submetering2 <- as.numeric(subsetdata$Sub_metering_2)
Submetering3 <- as.numeric(subsetdata$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# Plot top left
plot(datetime, subset_gap, type="l", xlab="", ylab="Global Active Power")
# Plot top right
plot(datetime, subset_volt, type="l", xlab="datetime", ylab="Voltage")
# plot bottom left
plot(datetime, Submetering1, type="l", xlab="" , ylab="Energy sub metering")
lines(datetime, Submetering2, type="l", col="red")
lines(datetime, Submetering3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# plot bottom right
plot(datetime, subset_grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()