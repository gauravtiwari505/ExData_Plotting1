#Date: 2016-03-05
#Developer : Gaurav Tiwari
#Data Period Range : 2007-02-01 and 2007-02-02
#Mission : Create Plot1.R --> Histogram of Global Active power usage in kilowatts

## Loading the required packages
require(dplyr)

##Setting the working directory
setwd("~/Documents/Coursera_Data_Science/ExData_Plotting1")


##Extracting the data for the date range from the local file stored in the same directory as the code file.
household_power_consumption <- read.csv("~/Documents/Coursera_Data_Science/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors = FALSE)

household_power_consumption=tbl_df(household_power_consumption)

household_power_consumption=filter(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

##Plotting the histogram as plot1.png file

png("plot1.png",width=480,height=480)
hist(household_power_consumption$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()

