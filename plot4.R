# R Script to generate Plot 4 of 4-1

# Set Directory
setwd('~/DataScience/GIT/ProgAssig4-1')
rm(pcon.data)
rm(pcon.sdata)
#head(pcon.data)

# Read file into a table format
pcon.data<- read.table('Data/household_power_consumption.txt', header=TRUE, sep=';')

# Convert date
pcon.data$Date<- as.Date(pcon.data$Date, format="%d/%m/%Y")

# Get two dates data 
pcon.sdata<-pcon.data[(pcon.data$Date=="2007-02-01") | (pcon.data$Date=="2007-02-02"),]


# Convert to numeric
num_cols<-ncol(pcon.sdata)

for (i in 3:num_cols) {
  pcon.sdata[,i]=as.numeric(as.character(pcon.sdata[,i]))
}

# Concatenate Date and Time into Time column
pcon.sdata$DateTime <- as.POSIXct(paste(as.Date(pcon.sdata$Date),pcon.sdata$Time))

# Define a frame
png("Plot4.png",height=480,width=480)


# Generate a plot
par(mfrow=c(2,2))
# 1
plot(pcon.sdata$DateTime, pcon.sdata$Global_active_power, type='l', xlab="",ylab="Global Active Power")
#2
plot(pcon.sdata$DateTime, pcon.sdata$Voltage, type='l', xlab="DateTime",ylab="Voltage")
#3
plot(pcon.sdata$DateTime, pcon.sdata$Sub_metering_1, type='l', xlab="", ylab="Energy sub Metering")
lines(pcon.sdata$DateTime, pcon.sdata$Sub_metering_2,col="red")
lines(pcon.sdata$DateTime, pcon.sdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),
       lty=c(1,1), bty="n", cex=.9 )
#4
plot(pcon.sdata$DateTime, pcon.sdata$Global_reactive_power, type='l', xlab="datetime",ylab="Global_reactive_power")

# Release plot file
dev.off()
