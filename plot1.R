# Set Directory
setwd('~/DataScience/GIT/ProgAssig4-1')

# Read file into a table format
pcon.data<- read.table('Data/household_power_consumption.txt', header=TRUE, sep=';',na.strings="?")

# Convert date
pcon.data$Date<- as.Date(pcon.data$Date, format="%d/%m/%Y")

# Get two dates data 
pcon.sdata<-pcon.data[pcon.data$Date=='2007-2-1'|pcon.data$Date=='2007-2-2',]

# Concatenate Date and Time into Time column
pcon.sdata$DateTime <- as.POSIXct(paste(as.Date(pcon.sdata$Date),pcon.sdata$Time))

# Convert to numeric
num_cols<-ncol(pcon.sdata)-1
for (i in 3:num_cols) {
  pcon.sdata[,i]=as.numeric(as.character(pcon.sdata[,i]))
}

# Define a frame
png("Plot1.png",bg="white",height=480,width=480)

# Generate a hist
hist(pcon.sdata$Global_active_power,main="Global Active Power", col="red", xlab="Global Active Power (Kilowatts)")

# Release plot file
dev.off()
