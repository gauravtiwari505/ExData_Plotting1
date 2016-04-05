#Date: 2016-03-05
#Developer : Gaurav Tiwari
#Data Period Range : 2007-02-01 and 2007-02-02
#Mission : Create Plot3.R --> Time series plot of Energy Submetering

## Loading the required packages
require(dplyr)

##Setting the working directory
setwd("~/Documents/Coursera_Data_Science/ExData_Plotting1")


##Extracting the data for the date range from the local file stored in the same directory as the code file.
household_power_consumption <- read.csv("~/Documents/Coursera_Data_Science/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors = FALSE)

household_power_consumption=tbl_df(household_power_consumption)

household_power_consumption=filter(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))
##Stripping Date and Time to plot the time series plot
household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date,household_power_consumption$Time),"%d/%m/%Y %H:%M:%S")

##Creating the plots for Energy Sub metering across different sub_meters and saving as plot3.png
png("plot3.png",width=480,height=480)
plot(household_power_consumption$DateTime, household_power_consumption$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab=NA)
lines(household_power_consumption$DateTime, household_power_consumption$Sub_metering_2,type="l",col="red")
lines(household_power_consumption$DateTime, household_power_consumption$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


