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
## Plot 2
################################################################################
png("./Results/plot2.png")
plot(x= elec$dt,y=elec$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)")
dev.off()
