

  library(sqldf)

  electricdf <- read.csv.sql("hhpowerconsumption.txt",header=TRUE,sep=";",sql="select * from file where date = '1/2/2007' or date = '2/2/2007'")

  png(file = "plot1.png")

  hist(electricdf$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

  dev.off()

