## Keep the downloaded file in your working directory
rm(list = ls(all = TRUE)) #reset workspace as par affect global graphics parameters
if(!require("dplyr"))
        install.packages("dplyr")
library(dplyr)
houseData <- read.table("./household_power_consumption.txt",stringsAsFactors = FALSE,sep=";",na.strings = "?",header = TRUE)
houseData$Date <- as.Date(houseData$Date,"%d/%m/%Y")
DF <- filter(houseData,Date == "2007-02-01"| Date == "2007-02-02")
hist(DF$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.copy(device=png,file="plot1.png",width = 480, height = 480)
dev.off()