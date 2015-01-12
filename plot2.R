dataset <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")
names(dataset)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dataset=dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007"),]
dataset$DT=as.POSIXct(strptime(paste(dataset$Date," ",dataset$Time,sep=""),"%d/%m/%Y %H:%M:%S"))

png('plot2.png', height=480, width=480)
plot(dataset$Global_active_power~dataset$DT,type="l",col="black",xaxt="n",xlab=" ",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1170306000,1170392400,1170478800),labels=c("Thu","Fri","Sat"),las=0)
dev.off()