# read the data
d <- read.table("C:\\tmp\\coursera\\ExploratoryDataAnalysis\\household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# subset the data
sub <- subset(d,Date == '1/2/2007' | Date == '2/2/2007')

# create the png file
png(width=480,height=480,filename="C:\\tmp\\coursera\\ExploratoryDataAnalysis\\plot1.png")

# plot the histogram
hist(sub$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")

# end
dev.off()