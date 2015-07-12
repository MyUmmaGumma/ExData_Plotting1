##Read the text file to a table
d=read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c('?'))
whole_table<-d

##Subset the data
required_data <- subset(whole_table,  Date == "1/2/2007" | Date == "2/2/2007", select = Global_active_power)
cc_rd <- required_data[complete.cases(required_data),]

##Plot 1
hist(cc_rd, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Save the plot
dev.copy(png, "plot1.png")
dev.off()