##Read the text file to a table
d=read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c('?'))
whole_table<-d

##Subset the data
  ## Plot 4 - Sub plot Voltage
required_voltage <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Voltage)
cc_voltage <- required_voltage[complete.cases(required_voltage),]
a=cc_voltage - 233

  ## Sub Global Reactive Power Plot
required_grp <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Global_reactive_power)
cc_grp <- required_grp[complete.cases(required_grp),]

##Drawing the plot and saving to the file
plot.new()
png(filename="plot4.png", width=480, height=480, unit="px")
par(mfrow=c(2,2))
plot(cc_rd,type="l",ylab="Global Active Power (kilowatts)",xaxt='n')
axis(1, at=c(10), labels=c("Thu"))
axis(1, at=c(1400), labels=c("Fri"))
axis(1, at=c(2800), labels=c("Sat"))
plot(a,type='l',ylab="Voltage",  xaxt='n', yaxt='n')
axis(1, at=c(10), labels=c("Thu"))
axis(1, at=c(1400), labels=c("Fri"))
axis(1, at=c(2800), labels=c("Sat"))
axis(2, at=c(0), labels=c("234"))
axis(2, at=c(4), labels=c("238"))
axis(2, at=c(8), labels=c("242"))
axis(2, at=c(12), labels=c("246"))
plot(cc_sub_met1,type="l",ylab="Energy sub metering",xaxt='n')
lines(cc_sub_met2,col="red")
lines(cc_sub_met3,col="blue")
axis(1, at=c(10), labels=c("Thu"))
axis(1, at=c(1400), labels=c("Fri"))
axis(1, at=c(2800), labels=c("Sat"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(cc_grp,type='l',ylab="Global_reactive_power",  xaxt='n')
axis(1, at=c(10), labels=c("Thu"))
axis(1, at=c(1400), labels=c("Fri"))
axis(1, at=c(2800), labels=c("Sat"))
dev.off()
