data = read.table("household_power_consumption.txt",
                  header=TRUE,
                  stringsAsFactors = FALSE,
                  sep=";",
                  col.names = c("Date",
                                "Time",
                                "Global_active_power",
                                "Global_reactive_power",
                                "Voltage","Global_intensity",
                                "Sub_metering_1",
                                "Sub_metering_2",
                                "Sub_metering_3"),
)

str(data)

subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(subsetdata)

library(dplyr)

subsetdata$Date = as.Date(strptime(subsetdata$Date, format = "%d/%m/%Y"))

head(subsetdata)

datetime = paste(subsetdata$Date, subsetdata$Time, sep = ",")
datetime = strptime(paste(subsetdata$Date, subsetdata$Time, sep = ","),format= "%Y-%m-%d,%H:%M:%S")

GlobalActivePower = as.numeric(subsetdata$Global_active_power)


submetering_1 = as.numeric(subsetdata$Sub_metering_1)
submetering_2 = as.numeric(subsetdata$Sub_metering_2)
submetering_3 = as.numeric(subsetdata$Sub_metering_3)


#plot4

voltage = as.numeric(subsetdata$Voltage) 

png("plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))

plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, submetering_1, type="l", col = "black", xlab ="",ylab = "Energy sub metering")
lines(datetime, submetering_2, col="red")
lines(datetime, submetering_3, col="blue")

GlobalReactivePower = as.numeric(subsetdata$Global_reactive_power)
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()












