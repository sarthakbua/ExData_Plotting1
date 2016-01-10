setwd("D:\\Cousera\\Coursera_DS\\Explotory_data_anlysis\\Week_1")


hpwr<-read.table('household_power_consumption.txt', header = TRUE, sep=';',na.strings="?")

hpwr$Date = as.Date(hpwr$Date,'%d/%m/%Y')
hp<-subset(hpwr,(Date=='2007-02-01' | Date =='2007-02-02'))
names(hp)
unique(hp$Date) 

hp$Time <- paste(hp$Date, hp$Time, sep=" ")

hp$Time <- strptime(hp$Time, "%Y-%m-%d %H:%M:%S")


plot(hp$Time, hp$Global_active_power, type="l", main="",xlab="" ,
     ylab="Global Active Power(kilowatts)")

dev.copy(png, file = "./plot2.png", width=480, height=480) 
dev.off()