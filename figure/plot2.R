##
#  household_power_consumption.txt and plot2.R must be in R's working drirectory
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



#plo2
language <- "English" 
Sys.setlocale("LC_TIME", language) #Days of the week in English
par(mfrow=c(1,1))
plot(df_subset$DateTim,df_subset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,"Plot2.png",width=480, height=480)
dev.off()
