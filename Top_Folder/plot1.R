##install.packages('ggplot2')
##library(ggplot2)

if(!file.exists('./project1')) {dir.create('./project1')}

## download data
fileURL<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileURL, destfile='./project1/UCI_household_power_consumption.zip',method='curl')
unzip('./project1/UCI_household_power_consumption.zip', exdir='./project1') ## ho eliminato 
## "/unzipped"

## read data:
q<-read.table("./project1/household_power_consumption.txt",header=T,sep=';',
              col.names=c('Date','Time','Global_active_power','Global_reactive_power',
                          'Voltage','Global_intensity','Sub_metering_1','Sub_metering_2',
                          'Sub_metering_3'),na.strings="NA",nrows=2880,skip=66636)
## set margins
par(mar=c(5.1,5.1,4.1,2.1))

## make plot 1
hist(c(q$Global_active_power,q$Frequency),breaks=12,col='Red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)',ylab='Frequency')

## save plot 1 to a PNG file
dev.copy(png,file="plot1.png",width=480,height=480)

## exit graphic device
dev.off()