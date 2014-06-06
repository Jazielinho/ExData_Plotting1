#Reading data frame
data<-read.table("household_power_consumption.txt",sep=";",na.string="?",
			header=TRUE)
names(data)

data$Date<-as.Date(data$Date,"%d/%m/%Y")

datos<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
names(datos)

##########################################################################
#Plot 1
hist(datos$Global_active_power,main="Global Active Power",
	xlab="Global Active Power (Kilowatts)",col="red")
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") 
dev.off()
##########################################################################
