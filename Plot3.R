setwd("D:\\Cousera\\Coursera_DS\\Explotory_data_anlysis\\Week_1")


hpwr<-read.table('household_power_consumption.txt', header = TRUE, sep=';',na.strings="?")

hpwr$Date = as.Date(hpwr$Date,'%d/%m/%Y')
hp<-subset(hpwr,(Date=='2007-02-01' | Date =='2007-02-02'))
names(hp)
unique(hp$Date) 

hp$Time <- paste(hp$Date, hp$Time, sep=" ")

hp$Time <- strptime(hp$Time, "%Y-%m-%d %H:%M:%S")



ylimits = range(c(hp$Sub_metering_1, hp$Sub_metering_2, hp$Sub_metering_3))

plot(hp$Time, hp$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", 
     ylim = ylimits, col = "black",cex=0.8, cex.axis = 0.8)

par(new = TRUE)

plot(hp$Time, hp$Sub_metering_2, xlab = "", axes = FALSE, 
     ylab = "", type = "l", ylim = ylimits, col = "red", cex=0.8)
par(new = TRUE)
plot(hp$Time, hp$Sub_metering_3, xlab = "", axes = FALSE, 
     ylab = "", type = "l", ylim = ylimits, col = "blue",cex=0.8)


legend("topright",
       legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       #bg = "transparent",
      # bty = "n",
       lty = 1,
       cex=0.6, 
       xjust=0 , 
       col = c("black", "red", "blue")
)

dev.copy(png, file = "./plot3.png", width=480, height=480) 
dev.off() 
