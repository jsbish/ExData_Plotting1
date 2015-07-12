

  library(sqldf)

  electricdf <- read.csv.sql("hhpowerconsumption.txt",header=TRUE,sep=";",sql="select * from file where date = '1/2/2007' or date = '2/2/2007'")

  png(file = "plot2.png")

  electricdf$DateTime <- as.POSIXct(paste(electricdf$Date, electricdf$Time), format="%d/%m/%Y %H:%M:%S")

  plot(electricdf$DateTime,electricdf$Global_active_power, type="n",xlab="", ylab="Global Active Power (kilowatts)")

  lines(electricdf$DateTime,electricdf$Global_active_power)

  dev.off()

