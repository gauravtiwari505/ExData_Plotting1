#Date: 2016-03-05
#Developer : Gaurav Tiwari
#Data Period Range : 2007-02-01 and 2007-02-02
#Mission : Create Plot2.R --> Time series plot of Global Active power usage in kilowatts

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


##Plotting the line plot as plot2.png file
png("plot2.png",width=480,height=480)
plot(household_power_consumption$DateTime, household_power_consumption$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()


