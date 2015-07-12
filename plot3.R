##Read the text file to a table
d=read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c('?'))
whole_table<-d

##Subset the data
sub_met1 <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Sub_metering_1)
sub_met2 <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Sub_metering_2)
sub_met3 <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Sub_metering_3)

cc_sub_met1 <- sub_met1[complete.cases(sub_met1),]
cc_sub_met2 <- sub_met2[complete.cases(sub_met2),]
cc_sub_met3 <- sub_met3[complete.cases(sub_met3),]

png(filename="plot3.png", width=480, height=480, unit="px")
plot(cc_sub_met1,type="l",ylab="Energy sub metering",xaxt='n')
lines(cc_sub_met2,col="red")
lines(cc_sub_met3,col="blue")
axis(1, at=c(10), labels=c("Thu"))
axis(1, at=c(1400), labels=c("Fri"))
axis(1, at=c(2800), labels=c("Sat"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
