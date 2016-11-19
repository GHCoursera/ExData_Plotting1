download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="E_Data.zip")

unzip(zipfile="E_DATA.zip",exdir="E_DATA")
data <- read.csv("./E_DATA/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings ='?')

data1<-subset(data, as.Date(Date,format='%d/%m/%Y')>= '2007-02-01' & as.Date(Date,format='%d/%m/%Y') <= '2007-02-02')


plot2<- plot(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Global_active_power), type ="n",
             xlab=' ',ylab='Global Active Power (kilowatts)')
        lines(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y%H:%M:%S'),as.numeric(data1$Global_active_power))
      
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()
        
