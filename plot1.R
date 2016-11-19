download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="E_Data.zip")

unzip(zipfile="E_DATA.zip",exdir="E_DATA")
data <- read.csv("./E_DATA/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors = FALSE, miss)

data1<-subset(data, as.Date(Date,format='%d/%m/%Y')>= '2007-02-01' & as.Date(Date,format='%d/%m/%Y') <= '2007-02-02')

#Constructing plot1 and saving it as png
plot1<-hist(as.numeric(data1$Global_active_power),
     main="Global Active Power", col = "red", xlab= "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()

