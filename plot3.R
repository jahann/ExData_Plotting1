# read the data
d <- read.table("C:\\tmp\\coursera\\ExploratoryDataAnalysis\\household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# subset the data
sub <- subset(d,Date == '1/2/2007' | Date == '2/2/2007')

# update date time column
sub$DateTime <- strptime(paste(sub$Date,sub$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# create the png file
png(width=480,height=480,filename="C:\\tmp\\coursera\\ExploratoryDataAnalysis\\plot3.png")
with(sub,plot(DateTime,Sub_metering_1,type= "l",ylab="Energy submetering",xlab=""))
with(sub,lines(x=DateTime,y=Sub_metering_2,type= "l",col="red"))
with(sub,lines(x=DateTime,y=Sub_metering_3,type= "l",col="blue"))

legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"),legend)

dev.off()