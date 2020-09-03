library(dplyr)
library(lubridate)
setwd("C:/Users/Matheus/Desktop/Data Science/R/Coursera Data Science/Analise exploratoria de dados/Semana 1/assignment/Exdata_Plotting1")


household <- read.table("household_power_consumption.txt", header = T, sep = ";")
household$Date <- dmy(household$Date)

final_house <- household %>% filter(Date == ymd("20070201") | Date == ymd("20070202")) %>%
      mutate_at(c("Global_active_power","Global_reactive_power",
                  "Voltage", "Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3"), as.character) %>%
      mutate_at(c("Global_active_power","Global_reactive_power",
                  "Voltage", "Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3"), as.numeric)  %>%               
      mutate(Date_time = ymd_hms(paste(Date, Time)))

plot_3 <- final_house %>% select(Date_time, Sub_metering_1, Sub_metering_2, Sub_metering_3)

png(filename = "plot3.png")
plot(plot_3$Date_time, plot_3$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(plot_3$Date_time, plot_3$Sub_metering_2, col = "red")
lines(plot_3$Date_time, plot_3$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lwd = 1, cex = .8)
dev.off()
