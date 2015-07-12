

  library(sqldf)

  electricdf <- read.csv.sql("hhpowerconsumption.txt",header=TRUE,sep=";",sql="select * from file where date = '1/2/2007' or date = '2/2/2007'")

  png(file = "plot3.png")

  electricdf$DateTime <- as.POSIXct(paste(electricdf$Date, electricdf$Time), format="%d/%m/%Y %H:%M:%S")

  plot(electricdf$DateTime,electricdf$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")

  lines(electricdf$DateTime,electricdf$Sub_metering_1)

  lines(electricdf$DateTime,electricdf$Sub_metering_2,col="red")

  lines(electricdf$DateTime,electricdf$Sub_metering_3,col="blue")

  legend("topright", col=c("black", "blue", "red"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

  dev.off()

