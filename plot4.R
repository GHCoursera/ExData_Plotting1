download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="E_Data.zip")

unzip(zipfile="E_DATA.zip",exdir="E_DATA")
data <- read.csv("./E_DATA/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings ='?')

data1<-subset(data, as.Date(Date,format='%d/%m/%Y')>= '2007-02-01' & as.Date(Date,format='%d/%m/%Y') <= '2007-02-02')


plot4 <- par (mfrow= c(2,2))  

hist(as.numeric(data1$Global_active_power),
     main="Global Active Power", col = "red", xlab= "Global Active Power (kilowatts)")

plot(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Voltage), type = 'n',
     xlab='datetime',ylab='Voltage')
lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Voltage))
    
plot(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_1), type = 'n',
     xlab=' ',ylab='Energy sub metering')
lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_1), col = 'black')
lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_2), col = 'blue')
lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_3), col='red')
legend ("topright", col= C(black, red, blue), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Global_reactive_power), type = 'n',
     xlab='datetime',ylab='Global_reactive_power')
lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Global_reactive_power))
     
dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()


