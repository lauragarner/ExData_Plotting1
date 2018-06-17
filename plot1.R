#Create plot 1 for the exploratory data plotting assignment

#Read in the required dataset, specifying the class of the columns up front to make it easier for plotting
## NOTE - the assignment dataset should unzipped and saved in the working directory folder.

temp<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#Subset the data to only the two dates in February 2007
data<- subset(temp, temp$Date == "1/2/2007" | temp$Date == "2/2/2007")

#Remove the temp dataset to free up memory
rm(temp)

#Set the graphic device to be a png file
png("plot1.png", width = 480, height = 480, units = "px")

#Create a histogram plot
hist(data$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close the png file
dev.off()

