## Exploratory Data Analysis Assignment 2 
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Subset baltimore city 
#zz <- subset(NEI,fips == "24510")
# Take the aggregate of emissions over years
#xx <- aggregate(zz$Emissions ~ zz$year, FUN=sum)
png("plot2.png",width= 480,height= 480,units= "px")
boxplot(NEI$Emissions ~ NEI$year,data=NEI,outline=FALSE,xlab="Year",ylab="Emissions",main = "Box Plot :: Total emissions from PM2.5 in Baltimore City",subset=fips=="24510",col = c("red","sienna","palevioletred1","royalblue2"))
#ggplot()+geom_point(data=xx,aes(x=xx[["NEI$year"]],y=xx[["NEI$Emissions"]]),colour = 'red', size = 3)
#ggplot(xx,aes(x=xx[["NEI$year"]],y=xx[["NEI$Emissions"]]))+geom_bar(stat="identity")+xlab("Year")+ylab("Emissions")+ggtitle("Aggregate Emissions per Year")
dev.off()