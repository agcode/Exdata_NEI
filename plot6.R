## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset Baltimore and LA
subNEI<-subset(NEI,fips == "24510" | fips == "06037")
# subNEI has 11416 obs
# subset only motor vehicle based sources
mv1<-grep("vehicle",SCC$Short.Name,ignore.case=TRUE)
library(dplyr)
mv<-slice(SCC,mv1)
# mv has 260 obs
sNEI<- subset(subNEI, SCC %in% mv$SCC)
# sNEI has 377 obs.

library(ggplot2)
png("plot6.png",width= 480,height= 480,units= "px")
ggplot(sNEI,aes(x=sNEI$year,y=sNEI$Emissions,fill=factor(sNEI$fips,labels=c("LA","Baltimore"))))+geom_bar(stat="identity",position="dodge")+xlab("Year")+ylab("Emissions")+ggtitle("Emissions from Motor Vehicles per Year in Baltimore and LA")+scale_x_continuous(breaks=c(1999,2002,2005,2008))+ guides(fill=guide_legend(title="Place"))
dev.off()