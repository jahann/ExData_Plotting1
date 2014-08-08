# read the data
file = args <- commandArgs(trailingOnly = TRUE)[1]

d <- read.table(file,header=TRUE,sep=";",na.strings="?")

# subset the data
sub <- subset(d,Date == '1/2/2007' | Date == '2/2/2007')

# update date time column
sub$DateTime <- strptime(paste(sub$Date,sub$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# create the png file
png(width=480,height=480,filename="C:\\tmp\\coursera\\ExploratoryDataAnalysis\\plot2.png")
with(sub,plot(DateTime,Global_active_power,type= "l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
