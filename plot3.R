download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="E_Data.zip")

unzip(zipfile="E_DATA.zip",exdir="E_DATA")
data <- read.csv("./E_DATA/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings ='?')

data1<-subset(data, as.Date(Date,format='%d/%m/%Y')>= '2007-02-01' & as.Date(Date,format='%d/%m/%Y') <= '2007-02-02')

plot3<-plot(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_1), type = 'n',
      xlab=' ',ylab='Energy sub metering')
      lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_1), col = 'black')
      lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_2), col = 'blue')
      lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Sub_metering_3), col='red')
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
      
dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()
      
      
