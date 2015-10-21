## Exploratory Data Analysis Assignment 2 
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Take the aggregate of emissions over years
xx <- aggregate(NEI$Emissions ~ NEI$year, FUN=sum)
# Using base plotting system
png("plot1.png",width= 480,height= 480,units= "px")
#barplot(xx[[2]],xx[[1]],xlab="Year",ylab="Emissions")
bp<-barplot(xx[[2]],xx[[1]],xlab="Year",ylab="Emissions",names.arg = c(1999, 2002, 2005, 2008),main="Total Emissions from PM2.5",col = c("red","sienna","palevioletred1","royalblue2"))
text(bp, 0, round(xx[[2]], 1),cex=1,pos=3)
#boxplot(NEI$Emissions ~ NEI$year,data=NEI,outline=FALSE,xlab="Year",ylab="Emissions",main = "Total emissions from PM2.5")
#ggplot()+geom_point(data=xx,aes(x=xx[["NEI$year"]],y=xx[["NEI$Emissions"]]),colour = 'red', size = 3)
#ggplot(xx,aes(x=xx[["NEI$year"]],y=xx[["NEI$Emissions"]]))+geom_bar(stat="identity")+xlab("Year")+ylab("Emissions")+ggtitle("Aggregate Emissions per Year")
dev.off()