#Read the data
datat<-read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors = FALSE)

#Convert character into date
datat$Date<-as.Date(datat$Date, format="%d/%m/%Y")

#Subset the data
datafeb<-subset(datat, Date == "2007-02-01" | Date == "2007-02-02")

#Convert the Date and Time variables to Date/Time classes
datafeb$datetime<-paste(datafeb$Date, datafeb$Time)
datafeb$strpt<-strptime(datafeb$datetime, format= "%Y-%m-%d %H:%M:%S")

#Plot 2
with(datafeb, plot(x=strpt, as.numeric(Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#Copy png
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()