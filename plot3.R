## Exploratory Data Analysis Assignment 2 
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999???2008 for Baltimore City? 
## Which have seen increases in emissions from 1999???2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Subset baltimore city 
zz <- subset(NEI,fips == "24510")
# Take the aggregate of emissions over years
#xx <- aggregate(zz$Emissions ~ zz$year, FUN=sum)
type <- zz$type
library(ggplot2)
png("plot3.png",width= 480,height= 480,units= "px")
ggplot(zz,aes(x=zz$year,y=zz$Emissions,fill=type))+geom_bar(stat="identity",position="dodge")+xlab("Year")+ylab("Emissions")+ggtitle("Emissions per Year in Baltimore : By Type")+scale_x_continuous(breaks=c(1999,2002,2005,2008))
#boxplot(NEI$Emissions ~ NEI$year,data=NEI,outline=FALSE,xlab="Year",ylab="Emissions",main = "Total emissions from PM2.5",subset=fips=="24510")
#ggplot()+geom_point(data=xx,aes(x=xx[["NEI$year"]],y=xx[["NEI$Emissions"]]),colour = 'red', size = 3)
#ggplot(xx,aes(x=xx[["NEI$year"]],y=xx[["NEI$Emissions"]]))+geom_bar(stat="identity")+xlab("Year")+ylab("Emissions")+ggtitle("Aggregate Emissions per Year")
dev.off()