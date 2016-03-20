data<-read.table("C:/Users/omard/Desktop/Coursera/exdata-data-household_power_consumption/household_power_consumption.txt",header = TRUE, sep= ";") ## read the DATA
names(data) ## extract attributes  
data$DateTime<-paste(data$Date, data$Time) ##let's create one variable by concatenating Date and Time.
 data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")##let's change DateTime to yyyy-mm-dd hh:mm:ss
 ##Let's select subset data for dates 2007-02-01 and 2007-02-02.
         start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
         
                end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
                 
                         data2<-data[start:end,]
                         
                                hist(as.numeric(as.character(data2$Global_active_power)),main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") # note we used as.character and as numeric since factor
                                plot1 <- function() {
                                        hist(as.numeric(as.character(data2$Global_active_power)),main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
                                        dev.copy(png, file="plot1.png", width=480, height=480)
                                        dev.off()
                                        cat("Plot1.png saved in", getwd())
                                }
                                plot1()
