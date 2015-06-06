# Read the data.
d <- read.csv(
  "household_power_consumption.txt",
  sep=";",
  stringsAsFactors=F,
  na.strings=c("?")
)

# Subset on dates.
d <- d[d$Date %in% c("1/2/2007", "2/2/2007"),]

d$DateTime <-   # Add new date-time column.
  strptime(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

# Plot
png("plot3.png")
plot(
  x	= d$DateTime,
  y	= d$Sub_metering_1,
  type	= "l",
  xlab	= "",
  ylab	= "Energy sub metering"
)

lines(d$DateTime, d$Sub_metering_2, col = "red")
lines(d$DateTime, d$Sub_metering_3, col = "blue")

legend(
  "topright",
  col	= c("black","red","blue"),
  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
  lty = c(1,1),
  lwd = c(1,1)
)
dev.off()
