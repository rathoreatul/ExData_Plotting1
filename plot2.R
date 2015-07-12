# R Script to generate Plot 2 of 4-1

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
png("Plot2.png",height=480,width=480)


# Generate a plot
plot(pcon.sdata$DateTime,pcon.sdata$Global_active_power, ylab="Global Active Power (Kilowatts)", xlab="", type="l")


# Release plot file
dev.off()
