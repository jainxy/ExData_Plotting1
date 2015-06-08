# Getting and Cleaning data
filename <- "./household_power_consumption.txt"
maindata <- read.table(filename,sep=";",header=T)
maindata$Date <- as.Date(maindata$Date, format = "%d/%m/%Y")
reqdata <- subset(maindata,Date =="2007-02-01"|Date =="2007-02-02")
rownames(reqdata)<-NULL
for (i in 3:9) reqdata[,i] <- as.numeric(as.character(reqdata[,i]))
reqdata$Time <- strptime(with(reqdata, paste(Date, Time)), format = "%Y-%m-%d %H:%M:%S")

##################################################
# code for plot 4 below
png("plot4.png")
par(mfrow = c(2,2), mar = c(6, 6, 2, 2), cex = 0.5)
plot(reqdata$Time, reqdata$Global_active_power, xlab = "", ylab = "Global Active Power", type="l")
plot(reqdata$Time, reqdata$Voltage, xlab = "datetime", ylab = "Voltage", type="l")
plot(reqdata$Time, reqdata$Sub_metering_1, type = "n"
     ,ylab = "Energy sub metering", xlab = "")
points(reqdata$Time, reqdata$Sub_metering_1, type = "l")
points(reqdata$Time, reqdata$Sub_metering_2, type = "l",col="red")
points(reqdata$Time, reqdata$Sub_metering_3, type = "l",col="blue")
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = rep(1,3))
plot(reqdata$Time, reqdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()