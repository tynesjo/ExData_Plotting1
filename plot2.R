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
png("plot2.png")   # open .png graphics device

plot(
  x	= d[, c("DateTime", "Global_active_power")],
  type	= "l",
  xlab	= "",
  ylab	= "Global Active Power (kilowatt)"
)

dev.off()
