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


png(filename = "plot4.png",    width = 480, height = 480,)

par(mfcol= c(2,2))
plot(timeline, selecteddaydata[,3], ylab= "Global Active Power", xlab="",type="n")
lines(timeline, selecteddaydata[,3] )

plot(timeline, selecteddaydata[,7], ylab= "Energy sub metering", xlab="",type="n")
lines(timeline, selecteddaydata[,7])
lines(timeline, selecteddaydata[,8], col="red")
lines(timeline, selecteddaydata[,9], col="blue")
legend("topright", legend = c("Sub_metering1","Sub_metering2","Sub_metering3"), lty=1, col = c("black", "red", "blue") )

plot(timeline, selecteddaydata[,5], ylab= "Voltage", xlab="datetime",type="n")
lines(timeline, selecteddaydata[,5] )

plot(timeline, selecteddaydata[,4], ylab= "Global_reactive_power", xlab="datetime",type="n")
lines(timeline, selecteddaydata[,4] )

dev.off()
