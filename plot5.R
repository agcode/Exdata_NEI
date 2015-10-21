## How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Subset baltimore city 
baltimore <- subset(NEI,fips == "24510")
# baltimore contains 2096 obs of 6 variables 
# Further subset only motor vehicle based sources
mv1<-grep("vehicle",SCC$Short.Name,ignore.case=TRUE)
library(dplyr)
mv<-slice(SCC,mv1)
# mv contains 260 obs of 15 variables
zz <- subset(baltimore, SCC %in% mv$SCC)
# zz contains 187 obs. of 6 variables
# Take the aggregate of emissions over years
#xx <- aggregate(zz$Emissions ~ zz$year, FUN=sum)
library(ggplot2)
png("plot5.png",width= 480,height= 480,units= "px")
ggplot(zz,aes(x=zz$year,y=zz$Emissions))+geom_bar(stat="identity",fill="red")+xlab("Year")+ylab("Emissions")+ggtitle("Emissions from Motor Vehicle sources in Baltimore city")+scale_x_continuous(breaks=c(1999,2002,2005,2008))
dev.off()
#png("plot5b.png",width= 480,height= 480,units= "px")
#ggplot(zz,aes(factor(zz$year),zz$Emissions))+geom_boxplot()+xlab("Year")+ylab("Emissions")+ggtitle("Emissions from Motor Vehicle sources in Baltimore city")
#dev.off()