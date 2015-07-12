##Read the text file to a table
d=read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c('?'))
whole_table<-d

##Subset the data
required_data <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Global_active_power)
cc_rd <- required_data[complete.cases(required_data),]

##Plot 2
plot(cc_rd,type="l",ylab="Global Active Power (kilowatts)",xaxt='n')
axis(1, at=c(10), labels=c("Thu"))
axis(1, at=c(1400), labels=c("Fri"))
axis(1, at=c(2800), labels=c("Sat"))

##Save the plot
dev.copy(png, "plot2.png")
dev.off()