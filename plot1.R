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
png("plot1.png")   # open .png graphics device
hist(
  x	= d$Global_active_power,
  main	= "Global Active Power",
  xlab	= "Global Active Power (kilowatts)",
  col	= "red"
)
dev.off()
