# Getting and Cleaning data
filename <- "./household_power_consumption.txt"
maindata <- read.table(filename,sep=";",header=T)
maindata$Date <- as.Date(maindata$Date, format = "%d/%m/%Y")
reqdata <- subset(maindata,Date =="2007-02-01"|Date =="2007-02-02")
rownames(reqdata)<-NULL
for (i in 3:9) reqdata[,i] <- as.numeric(as.character(reqdata[,i]))
reqdata$Time <- strptime(with(reqdata, paste(Date, Time)), format = "%Y-%m-%d %H:%M:%S")

##################################################
# code for plot 1 below
png("plot1.png")
hist(reqdata$Global_active_power,col="red",main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
##################################################