##install.packages('ggplot2')
##library(ggplot2)

if(!file.exists('./project1')) {dir.create('./project1')}

## download data
fileURL<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileURL, destfile='./project1/UCI_household_power_consumption.zip',method='curl')
unzip('./project1/UCI_household_power_consumption.zip', exdir='./project1')

## read data:
q<-read.table("./project1/household_power_consumption.txt",header=T,sep=';',
              col.names=c('Date','Time','Global_active_power','Global_reactive_power',
                          'Voltage','Global_intensity','Sub_metering_1','Sub_metering_2',
                          'Sub_metering_3'),na.strings="NA",nrows=2880,skip=66636)
## set margins
par(mar=c(5.1,5.1,4.1,2.1))

## create vector POSIXlt date_time
date_time <- as.POSIXlt(paste(as.Date(q$Date,format="%d/%m/%Y"),q$Time,sep=" "))

## make plot 3 cum legenda
plot(date_time,q$Sub_metering_1,,type="l",xlab="",ylab="Energy sub metering")
points(date_time,q$Sub_metering_2,type="l",col="red");points(date_time,q$Sub_metering_3,
                                                             type="l",col="blue")
legend("topright", lty=1 , col=c("black","red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## save plot 3 to a PNG file
dev.copy(png,file="plot3.png",width=480,height=480)

## exit graphic device
dev.off()
