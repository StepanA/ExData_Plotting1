# Course Progect1 Explanatory Data Analysis

## Download and unzip data file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "CourseProject1.zip")
unzip("CourseProject1.zip")

## Read table
housepowerdata<- read.table("household_power_consumption.txt", header = TRUE, nrows = 70000,
                            sep =";" ,stringsAsFactors = FALSE , colClasses = rep("character",9) 
                            , na.strings = c("?"))
housepowerdata[,1] <- as.Date(housepowerdata[,1], "%d/%m/%Y")  

## Copy data when dates between 1 and 2 febr 2007
selecteddaydata <- housepowerdata[housepowerdata[,1] >= "2007-02-01" & housepowerdata[,1] <= "2007-02-02", ]
timeline <- strptime(paste(selecteddaydata[,1],selecteddaydata[,2]), "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",    width = 480, height = 480,)
plot(timeline, selecteddaydata[,3], ylab= "Global Active Power (kilowatts)", xlab="",type="n")
lines(timeline, selecteddaydata[,3] )
dev.off()

