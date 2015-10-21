## Across the United States, how have emissions 
## from coal combustion-related sources changed from 1999???2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Subset all coal based sources 
c1<-grep("coal",SCC$Short.Name,ignore.case=TRUE)
library(dplyr)
coals<-slice(SCC,c1)
# coals contains 239 obs of 11 variables 
# Subset coal based sources only (zz Contains 53400 obs. of 6 variables)
zz<- subset(NEI, SCC %in% coals$SCC)
# Take the aggregate of emissions over years
#xx <- aggregate(zz$Emissions ~ zz$year, FUN=sum)
library(ggplot2)
png("plot4.png",width= 480,height= 480,units= "px")
ggplot(zz,aes(x=zz$year,y=zz$Emissions))+geom_bar(stat="identity")+xlab("Year")+ylab("Emissions")+ggtitle("Emissions from Coal related sources across the US")+scale_x_continuous(breaks=c(1999,2002,2005,2008))
dev.off()