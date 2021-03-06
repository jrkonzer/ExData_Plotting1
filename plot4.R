temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
con<-unz(temp,"household_power_consumption.txt")
dateDownloaded<-date()
powerData<-read.table(con,sep=";",header=TRUE)
subdata<-subset(powerData, Date=="1/2/2007" | Date=="2/2/2007")
subdata1<-subset(powerData, Date=="1/2/2007")
subdata2<-subset(powerData, Date=="2/2/2007")
par(mfcol = c(2, 2))
par(mar=c(2,4,0.5,0.5))
Gap1<-subdata1[,2]
newGap<-sapply(Gap1,as.character)
newGap1<-sapply(strsplit(newGap,":"),function(x){x<-as.numeric(x);60*x[1]+x[2]})
Gap2<-subdata2[,2]
newGap<-sapply(Gap2,as.character)
newGap2<-sapply(strsplit(newGap,":"),function(x){x<-as.numeric(x);60*x[1]+x[2]}+1440)
newGap<-c(newGap1,newGap2)
Gap3<-subdata[,3]
newGap3<-sapply(Gap3,as.numeric)
newGap4<-t(t(newGap3)/1000)
Total<-data.frame(newGap,newGap4)
names(Total)<-c("Time","Global_active_power")
with(Total, plot(Time, Global_active_power, xlab ="", ylab="Global Active Power (kilowatts)", type='l',xaxt = 'n'))
axis(1, at=0, labels="Thurs")
axis(1, at=1440, labels="Fri")
axis(1, at=2880, labels="Sat")
Gap1<-subdata1[,2]
newGap<-sapply(Gap1,as.character)
newGap1<-sapply(strsplit(newGap,":"),function(x){x<-as.numeric(x);60*x[1]+x[2]})
Gap2<-subdata2[,2]
newGap<-sapply(Gap2,as.character)
newGap2<-sapply(strsplit(newGap,":"),function(x){x<-as.numeric(x);60*x[1]+x[2]}+1440)
newGap<-c(newGap1,newGap2)
Gap7<-subdata[,7]
nGap7<-sapply(Gap7,as.numeric)
Gap8<-subdata[,8]
nGap8<-sapply(Gap8,as.numeric)
Gap9<-subdata[,9]
nGap9<-sapply(Gap9,as.numeric)
Total<-data.frame(newGap,nGap7,nGap8,nGap9)
names(Total)<-c("Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")
with(Total, plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type='l',xaxt = 'n'))
points(nGap8, col="red", type="l")
points(nGap9, col="blue", type="l")
axis(1, at=0, labels="Thurs")
axis(1, at=1440, labels="Fri")
axis(1, at=2880, labels="Sat")
Gap5_1<-subdata[,5]
newGap5_1<-sapply(Gap5_1,as.numeric)
newGap5_2<-t(t(newGap5_1)/7.44)
Total<-data.frame(newGap,newGap5_2)
names(Total)<-c("Time","Voltage")
with(Total, plot(Time, Voltage, xlab ="", ylab="Voltage", type='l',xaxt = 'n'))
axis(1, at=0, labels="Thurs")
axis(1, at=1440, labels="Fri")
axis(1, at=2880, labels="Sat")
Gap4_1<-subdata[,4]
newGap4_1<-sapply(Gap4_1,as.numeric)
newGap4_2<-t(t(newGap4_1)/400)
Total<-data.frame(newGap,newGap4_2)
names(Total)<-c("Time","Global_reactive_power")
with(Total, plot(Time, Global_reactive_power, xlab ="", ylab="Global_reactive_power", type='l',xaxt = 'n'))
axis(1, at=0, labels="Thurs")
axis(1, at=1440, labels="Fri")
axis(1, at=2880, labels="Sat")
dev.copy(png, file = "plot4.png")
dev.off()