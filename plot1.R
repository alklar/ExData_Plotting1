# this is how to download and unzip the zip file
# uncomment the following lines if needed
#zipURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#zipFile <- "exdata.zip"
#download.file(zipURL, destfile= "exdata.zip")
#unzip(zipFile)

#create Data Frame from unzipped text file
exdataDF <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")

# convert Date column
exdataDF$Date <- as.Date(exdataDF$Date, "%d/%m/%Y")

# convert Time column, Date format now is YYYY/mm/dd
exdataDF$Time <- strptime(paste (exdataDF$Date, exdataDF$Time, sep = " ", collapse = NULL), 
                          "%Y-%m-%d %H:%M:%S")

# for plotting we only need data from the dates 2007-02-01 and 2007-02-02
lowDate <- as.Date("2007-02-01", "%Y-%m-%d")
highDate <- as.Date("2007-02-02", "%Y-%m-%d")
exdataDF2 <-  exdataDF[(exdataDF$Date >= lowDate & exdataDF$Date <= highDate),]

# now we are ready to create the plot
png(filename = "plot1.png", width = 480, height = 480)
hist(exdataDF2$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off() # close file
