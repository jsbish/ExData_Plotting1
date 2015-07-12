
  library(sqldf)

  electricdf <- read.csv.sql("hhpowerconsumption.txt",header=TRUE,sep=";",sql="select * from file where date = '1/2/2007' or date = '2/2/2007'")

  electricdf$DateTime <- as.POSIXct(paste(electricdf$Date, electricdf$Time), format="%d/%m/%Y %H:%M:%S")
  
  png(file = "plot4.png")
  
  par(mfrow = c(2,2))


  #Chart1:
  plot(electricdf$DateTime,electricdf$Global_active_power, type="n",xlab="", ylab="Global Active Power (kilowatts)")

  lines(electricdf$DateTime,electricdf$Global_active_power)

  
  #Chart 2:
  plot(electricdf$DateTime,electricdf$Voltage,type="n",xlab="datetime",ylab="Voltage")

  lines(electricdf$DateTime,electricdf$Voltage)


  #Chart 3:
  plot(electricdf$DateTime,electricdf$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")

  lines(electricdf$DateTime,electricdf$Sub_metering_1)

  lines(electricdf$DateTime,electricdf$Sub_metering_2,col="red")

  lines(electricdf$DateTime,electricdf$Sub_metering_3,col="blue")

  legend("topright", col=c("black", "blue", "red"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

  
  #Chart 4:

  plot(electricdf$DateTime,electricdf$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")

  lines(electricdf$DateTime,electricdf$Global_reactive_power)

  dev.off()



