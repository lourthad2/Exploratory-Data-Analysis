setwd("C:/hadoop/R/Data")
## This first line will likely take a few seconds. Be patient!
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor #vehicle sources in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor 

#Select only data related to the Baltimore or Los Angeles and On Road 
#Citiesdataset <- subset(NEI,(fips == "24510" | fips == "06037" )& type=="ON-ROAD")
#Citiesdataset = transform(Citiesdataset,city=ifelse(fips="24510",'Baltimore',"Los Angeles"))
#LosAngelesCA <- subset(NEI,fips == "06037"& type=="ON-ROAD")

## Aggregate

BaltimoreMD =subset(NEI,fips == "24510" & type=="ON-ROAD")

AggBaltimore <- aggregate(Emissions~year,BaltimoreMD,sum)
colnames(AggBaltimore) <- c('year','Emissions')
AggBaltimore$City <- paste(rep('MD',4))

LosAngelesCA =subset(NEI,fips == "06037" & type=="ON-ROAD")
AggLosAngeles <- aggregate(Emissions~year,LosAngelesCA,sum)
colnames(AggLosAngeles) <- c('year','Emissions')
AggLosAngeles$City <- paste(rep('CA',4))


png('plot6.png',width=800,height=500)

#use ggplot
plot6 <- ggplot(AggBaltimore,aes(year,Emissions))  
plot6 <- plot6 + geom_line() + xlab("Year") + ylab("Total EMissions") 


print(plot6)

dev.off()