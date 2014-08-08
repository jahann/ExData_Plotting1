# read the data
file = args <- commandArgs(trailingOnly = TRUE)[1]

d <- read.table(file,header=TRUE,sep=";",na.strings="?")

# subset the data
sub <- subset(d,Date == '1/2/2007' | Date == '2/2/2007')

# create the png file
png(width=480,height=480,filename="C:\\tmp\\coursera\\ExploratoryDataAnalysis\\plot1.png")

# plot the histogram
hist(sub$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")

# end
dev.off()