#Read the data
datat<-read.table("household_power_consumption.txt",header=T,sep=";", stringsAsFactors = FALSE)

#Convert character into date
datat$Date<-as.Date(datat$Date, format="%d/%m/%Y")

#Subset the data
datafeb<-subset(datat, Date == "2007-02-01" | Date == "2007-02-02")

#Plot 1
hist(as.numeric(datafeb$Global_active_power), main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

#copy png
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()