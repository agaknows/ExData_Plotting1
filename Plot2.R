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


#plot 2

datetime = paste(subsetdata$Date, subsetdata$Time, sep = ",")
datetime = strptime(paste(subsetdata$Date, subsetdata$Time, sep = ","),format= "%Y-%m-%d,%H:%M:%S")

GlobalActivePower = as.numeric(subsetdata$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

