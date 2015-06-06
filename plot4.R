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

# PLOTS


png("plot4.png")

par(mfrow=c(2,2))

# First plot

plot(
  x     = d[, c("DateTime", "Global_active_power")],
  type  = "l",
  xlab  = "",
  ylab  = "Global Active Power"
)

# Second plot

plot(
  x     = d[, c("DateTime", "Voltage")],
  type  = "l",
  xlab  = "datetime",
  ylab  = "Voltage"
)


# Third plot
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

# Fourth plot
plot(
  x	= d$DateTime,
  y	= d$Global_reactive_power,
  type	= "l",
  xlab	= "datetime",
  ylab	= "Global_reactive_power"
)
dev.off()
