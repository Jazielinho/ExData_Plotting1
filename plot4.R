#Reading data frame
data<-read.table("household_power_consumption.txt",sep=";",na.string="?",
			header=TRUE)
names(data)

data$Date<-as.Date(data$Date,"%d/%m/%Y")

datos<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
names(datos)

##########################################################################
#Plot 4
par(mfrow=c(2,2))
with(datos,plot(Global_active_power,
			type="l",
			xaxt="n",
			ylab="Global Active Power",
			xlab=""))
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

with(datos,plot(Voltage,
			type="l",
			xaxt="n",
			ylab="Voltage",
			xlab="datetime"))
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

with(datos, plot(Sub_metering_1,
		col="black",
		type="l",
		xaxt="n",
		ylab="Energy sub metering",
		xlab=""))
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
with(datos, points(Sub_metering_2, col= "red",type="l"))
with(datos, points(Sub_metering_3, col= "blue",type="l"))
legend("topright",lty=1,bty="n",
	col = c("black", "red", "blue"),
	legend = c("Sub_metering_1",
			"Sub_metering_2",
			"Sub_metering_3"))

with(datos,plot(Global_reactive_power,
			type="l",
			xaxt="n",
			ylab="Global_reactive_power",
			xlab="datetime"))
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px") 
dev.off()
##########################################################################
