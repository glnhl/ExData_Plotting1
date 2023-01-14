#Read the data
datat<-read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors = FALSE)

#Convert character into date
datat$Date<-as.Date(datat$Date, format="%d/%m/%Y")

#Subset the data
datafeb<-subset(datat, Date == "2007-02-01" | Date == "2007-02-02")

#Convert the Date and Time variables to Date/Time classes
datafeb$datetime<-paste(datafeb$Date, datafeb$Time)
datafeb$strpt<-strptime(datafeb$datetime, format= "%Y-%m-%d %H:%M:%S")

#Plot3
with(datafeb, plot(strpt, as.numeric(Sub_metering_1), type = "l", xlab="",ylab="Energy sub metering"))
with(datafeb,lines(strpt, as.numeric(Sub_metering_2), col="red"))
with(datafeb,lines(strpt, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copy png
dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off()
