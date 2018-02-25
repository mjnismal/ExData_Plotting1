# Set Working Directory to the specific destination
# setwd("C:/Users/Popo/Documents/DP-Projects/Coursera/Exploratory data analysis/Week 1/data")


# This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. 
# In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:

# download data and save in local drive 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")

# unzip file and pull out dataset
z  = unz("household_power_consumption.zip",filename = "household_power_consumption.txt")

#Import the dataset to R 
HH_power_data = read.table(z,header = T, sep = ";")

#Convert "Date" to its respective data type
HH_power_data$Date=as.Date(HH_power_data$Date,format = "%d/%m/%Y")

#We will only be using data from the dates 2007-02-01 and 2007-02-02.
HH_power_data_2 = subset(HH_power_data,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))


#Create a "data and time" Variable
HH_power_data_2$DateTime=strptime(paste(HH_power_data_2$Date,HH_power_data_2$Time),format = "%Y-%m-%d %H:%M:%S")

#change the data type of numeric variables from factors to numeric
for(x in names(HH_power_data_2)[3:9]){
  
  HH_power_data_2[,x] = as.numeric(as.character(HH_power_data_2[,x]))
  
}


#Plot 2

#Open and create png file in current directory
png(file = "plot2.png")

#recreate plot based from the instructions 
with(HH_power_data_2,plot(y=Global_active_power,x=DateTime,ylab ="Global Active Power (kilowatts)",xlab = "",type = "l"))

#Close PNG Device
dev.off() 


