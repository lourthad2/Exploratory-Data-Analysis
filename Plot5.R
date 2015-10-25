setwd("C:/hadoop/R/Data")
## This first line will likely take a few seconds. Be patient!
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#How have emissions from motor vehicle sources changed from 1999-2008
#in Baltimore City?


#Select only data related to the Baltimore and On Road 
BaltimoreMD <- subset(NEI,fips == "24510"& type=="ON-ROAD")


AggBaltimore <- aggregate(Emissions~year,BaltimoreMD,sum)


png('plot5.png',width=800,height=500)

#use ggplot
plot5 <- ggplot(AggBaltimore,aes(year,Emissions))  
plot5 <- plot5 + geom_line() + xlab("Year") + ylab("Total EMissions") 


print(plot5)

dev.off()