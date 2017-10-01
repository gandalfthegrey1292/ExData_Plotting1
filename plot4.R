################################################################################
## Author : Saurabh Kelkar
## Purpose : Plootting Exrcise for Week 1
################################################################################
##
## Read data set for Plot2
##
################################################################################
setwd("E:\\Fight/Magai/Coursera/John Hopkins/Exploratory Data Analysis/Week1/")
elec_master = read.table("data/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",
                         sep = ";",header = TRUE,stringsAsFactors=FALSE)
elec_master$Date = as.Date(elec_master$Date,format= "%d/%m/%Y")

elec = subset(elec_master,Date %in% as.Date(c("2007-02-01","2007-02-02"),format = "%Y-%m-%d"))
#write.csv(elec,file = "data/elec.csv")
#dim(elec)
#

################################################################################
## Create Date Time Column
################################################################################

elec$myDate = as.POSIXlt(elec$Date,format = "%d/%m/%Y")
elec$dt = strptime(paste(elec$Date,elec$Time),format = "%Y-%m-%d %H:%M:%S")

################################################################################
## Plot 4
################################################################################

png("./Results/Plot4.png")
par(mfrow=c(2,2) )

#subplot (1,1)
plot(x= elec$dt,y=elec$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)")

#subplot (1,2)
plot(x = elec$dt,y=elec$Voltage,ylab = "Voltage",xlab = 'datetime',type = "l")

#subplot (2,1)
plot(x= elec$dt,y=elec$Sub_metering_1,type = "l",
     ylab = "Energy Sub metering",xlab = "")
lines(x= elec$dt,y=elec$Sub_metering_2,type = "l",col ="red")
lines(x= elec$dt,y=elec$Sub_metering_3,type = "l",col ="blue")
legend('topright',legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty = c(1,1,1),col = c("black","red","blue")
)

#subplot (2,2)
plot(x= elec$dt,y = elec$Global_reactive_power,xlab = "datetime",
     ylab = "Global_reactive_power",type= "l")


dev.off()
