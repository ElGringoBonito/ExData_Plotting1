dataset=read.table("household_power_consumption.txt",sep=";")

names(dataset)=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dataset=dataset[1:(nrow(dataset)/3),]

dataset$Date=as.Date(dataset$Date, "%d/%m/%Y")

dd=dataset[(dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02"),]
dd$Date=as.Date(dd$Date,"%Y-%m-%d")

dds=dd[(as.Date(dd$Date,"%Y-%m-%d")=="2007-02-02" | as.Date(dd$Date,"%Y-%m-%d")=="2007-02-01"),]

dds$Global_active_power=as.numeric(dds$Global_active_power)
dds$Global_active_power=dds$Global_active_power/500

png('plot1.png')
hist(dds$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",lab=c(4,7))
dev.off()
