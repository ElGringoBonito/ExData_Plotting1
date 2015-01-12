dataset=read.table("household_power_consumption.txt",sep=";")

names(dataset)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dataset=dataset[1:(nrow(dataset)/3),]

dataset$Date=as.Date(dataset$Date, "%d/%m/%Y")

dd=dataset[(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"),]
dd$Date=as.Date(dd$Date,"%Y-%m-%d")

dds=dd[(as.Date(dd$Date,"%Y-%m-%d")=="2007-02-02" | as.Date(dd$Date,"%Y-%m-%d")=="2007-02-01"),]

dds$Global_active_power=as.numeric(dds$Global_active_power)
dds$Global_active_power=dds$Global_active_power/500

dds$Time=paste(as.character(dds$Date),"-",as.character(dds$Time),sep="")
dds$Time=as.POSIXlt(strptime(dds$Time,format="%Y-%m-%d-%H:%M:%S",tz=""))
dds=dds[,-1]
dds=dds[-1,]
dds$Time=as.numeric(dds$Time)

png('plot2.png', height=480, width=480)
plot(dds$Time,dds$Global_active_power,type="l",col="black",xaxt="n",xlab=" ",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1170306000,1170392400,1170478800),labels=c("Thu","Fri","Sat"),las=0)
dev.off()