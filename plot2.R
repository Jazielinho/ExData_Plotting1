#Reading data frame
data<-read.table("household_power_consumption.txt",sep=";",na.string="?",
			header=TRUE)
names(data)

data$Date<-as.Date(data$Date,"%d/%m/%Y")

datos<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
names(datos)

##########################################################################
#Plot 2
with(datos,plot(Global_active_power,
			type="l",
			xaxt="n",
			ylab="Global Active Power (Kilowatts)",
			xlab=""))
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") 
dev.off()
##########################################################################
