#set your working directory here or choose via menu, 
setwd("C:/Users/ralf/Desktop/coursera/GitHUB/ExData_Plotting1")

#load required packages
#install.packages("data.table")
#install.packages("dplyr")
#install.packages("sqldf")
#library(data.table)
#library(dplyr)
library(sqldf)

###downloading/unzipping data from source
src_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(src_url, file.path(getwd(), "src_data.zip"))
unzip(zipfile = "src_data.zip")
file.remove("src_data.zip")

###import days 1/2/2002 and 2/2/2007 into data
data <- read.csv.sql("household_power_consumption.txt", 
                     sep = ';', 
                     header = TRUE,
                     sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
#dim(data)


### plot
png("plot2.png", width=480, height=480)
plot(x = data$Time, y = data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()