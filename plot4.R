# read the data
file = args <- commandArgs(trailingOnly = TRUE)[1]

d <- read.table(file,header=TRUE,sep=";",na.strings="?")

# subset the data
sub <- subset(d,Date == '1/2/2007' | Date == '2/2/2007')

# update date time column
sub$DateTime <- strptime(paste(sub$Date,sub$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

png(width=480,height=480,filename="C:\\tmp\\coursera\\ExploratoryDataAnalysis\\plot4.png")
par(mfrow=c(2,2))
with(sub,plot(DateTime,Global_active_power,type= "l",ylab="Global Active Power (kilowatts)",xlab=""))

with(sub,plot(DateTime,Voltage,type= "l",ylab="Voltage",xlab="datetime"))

with(sub,plot(DateTime,Sub_metering_1,type= "l",ylab="Energy submetering",xlab=""))
with(sub,lines(x=DateTime,y=Sub_metering_2,type= "l",col="red"))
with(sub,lines(x=DateTime,y=Sub_metering_3,type= "l",col="blue"))

legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"),legend)
with(sub,plot(DateTime,Global_reactive_power,type= "l",ylab="Global_reactive_power",xlab="datetime"))

dev.off()