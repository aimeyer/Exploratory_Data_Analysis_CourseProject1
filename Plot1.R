 ## Load Library
library("data.table")

  ## Read in txt file
alldata <- data.table:: fread( input = "household_power_consumption.txt", skip = 1, sep = ";", na.strings = "?")



  ## Set Column Names
names (alldata) <- c("Date",
                     "Time", 
                     "Global_active_power", 
                     "Global_reactive_power",
                     "Voltage", 
                     "Global_Intensity",
                     "Sub_Metering_1", 
                     "Sub_Metering_2",
                     "Sub_Metering_3")
  ## Look at head of alldata

head(alldata)

  ## Subset to get just the dates you need

TwoDays<- subset(alldata, Date %in% c("1/2/2007", "2/2/2007"))

TwoDays$Date <- as.Date(TwoDays$Date, format= "%d/%m/%Y")

  ## Look at TwoDays
head(TwoDays)

  ## make histogram
png("plot1.png", width =480, height = 480)

hist(TwoDays[,Global_active_power], main = "Global Active Power",
     xlab = "Gobal Active Power (kilowatts)",
     ylab = "Frequency", col= "Red")

dev.off()
  
                  