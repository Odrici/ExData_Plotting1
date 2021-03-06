data<-read.table("C:/Users/omard/Desktop/Coursera/exdata-data-household_power_consumption/household_power_consumption.txt",header = TRUE, sep= ";") ## read the DATA
names(data) ##  attributes ="Date" "Time" "Global_active_power" "Global_reactive_power" "Voltage" "Global_intensity" "Sub_metering_1" "Sub_metering_2" "Sub_metering_3"
data$DateTime<-paste(data$Date, data$Time) ##let's create one variable by concatenating Date and Time.
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")##let's chnage DateTime to yyyy-mm-dd hh:mm:ss
##Let's select the data for dates 2007-02-01 and 2007-02-02.
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-data[start:end,]
str(data) ##$Date "factor",$Time "factor", $Global_active_power "factor",$Global_reactive_power "factor",$Voltage "factor",$Global_intensity "factor",$Sub_metering_1 "factor"
            ##$Sub_metering_2 "factor",$Sub_metering_3 "numeric"
hist(as.numeric(as.character(data2$Global_active_power)), 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red") # note we used as.character and as numeric since
                                                        # the variable is factor variable.
plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)),
     type='l',ylab="Global Active Power (Kilowatts)", xlab="")
plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1)
       ,col=c("black","red","blue"))
plot3 <- function() {
        plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', 
             ylab ="Energy sub metering", xlab="")
        lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
        lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue")
        legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1)
               ,col=c("black","red","blue"))
        
        
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()## closing the file device
        
}
plot3()
