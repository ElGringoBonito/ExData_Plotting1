dataset <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")
names(dataset)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dataset=dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007"),]
dataset$DT=as.POSIXlt(strptime(paste(dataset$Date," ",dataset$Time,sep=""),"%d/%m/%Y %H:%M:%S"))

png('plot3.png', height=480, width=480)

plot(dataset$Sub_metering_1~dataset$DT,type="l",col="black",xlab=" ",ylab="Energy sub metering")
lines(dataset$Sub_metering_2~dataset$DT,type="l",col="red")
lines(dataset$Sub_metering_3~dataset$DT,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()