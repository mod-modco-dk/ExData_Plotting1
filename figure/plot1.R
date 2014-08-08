##
#  household_power_consumption.txt and plot1.R must be in R's working drirectory
##


data_file <- "household_power_consumption.txt"
col_classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

# Read data
df <- read.csv2(file=data_file, colClasses=col_classes, na.strings="?",dec = ".")

#head(df)

#str(df)

# head(paste(df$Date, df$Time))

#head(strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S"))

# Add DateTime column to dataframe -          
df$DateTime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")    

# new data frame as subset of data from 01/02/2007 and 02/02/2007 from datafrane
df_subset <- subset(df, DateTime >= strptime("01/02/2007","%d/%m/%Y") & DateTime < strptime("03/02/2007","%d/%m/%Y"))

#head(df_subset)

#plot1
par(mfrow=c(1,1))
hist(df_subset$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
dev.copy(png,"Plot1.png",width=480, height=480)
dev.off()
