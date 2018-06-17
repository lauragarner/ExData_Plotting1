#Create plot 4 for the exploratory data plotting assignment

#Read in the required dataset, specifying the class of the columns up front to make it easier for plotting
## NOTE - the assignment dataset should already be unzipped and saved in the working directory folder.

temp<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#Subset the data to only the two dates in February 2007
data<- subset(temp, temp$Date == "1/2/2007" | temp$Date == "2/2/2007")

#Remove the temp dataset to free up memory
rm(temp)

#Create a new column which combines Date and Time
data$DateTime<- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Set the graphic device to be a png file
png("plot4.png", width = 480, height = 480, units = "px")

#Set the 2 x 2 multiplot canvas
par(mfrow = c(2,2))

#Create the first plot
        plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Create the second plot
        plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Create the third plot
        #Create a plot with the first measure
        plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

        #Add the sub-metering points
        points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
        points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")

        #Add the legend
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = 1)

#Create the fourth plot
        plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
#Close the png file
dev.off()