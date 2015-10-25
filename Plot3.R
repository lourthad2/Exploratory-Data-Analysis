setwd("C:/hadoop/R/Data")
## This first line will likely take a few seconds. Be patient!
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Of the four types of sources indicated by the type (point, nonpoint, onroad, 
#nonroad) variable, which of these four sources have seen decreases in emissions
# from 1999-2008 for Baltimore City? Which have seen increases in emissions from 
#1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

BaltimoreMD <- subset(NEI,fips == "24510")

#BaltimoreMD <- NEI[NEI$fips=="24510",]

BaltimoreYRType <- aggregate(Emissions~year+ type,BaltimoreMD,sum)


png('plot3.png',width=800,height=500)

plot3 <- ggplot(BaltimoreYRType,aes(year,Emissions))  
plot3 <- plot3 + geom_line() + xlab("Year") + ylab("Total EMissions") 


print(plot3)

dev.off()