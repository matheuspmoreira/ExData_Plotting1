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

png(filename = "plot1.png")
hist(na.omit(final_house$Global_active_power), main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
