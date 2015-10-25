setwd("C:/hadoop/R/Data")
## This first line will likely take a few seconds. Be patient!
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999-2008?

#Merge NEI and SCC datasets
MergeNEISCC <- merge(NEI,SCC,by="SCC")

#Select only data related to the coal 
coaldata <- MergeNEISCC[grepl("coal",MergeNEISCC$Short.Name,ignore.case = TRUE),]

coaldataagg <- aggregate(Emissions~year,coaldata,sum)


png('plot4.png',width=800,height=500)

#use ggplot
plot4 <- ggplot(coaldataagg,aes(year,Emissions))  
plot4 <- plot4 + geom_line() + xlab("Year") + ylab("Total EMissions") 


print(plot4)

dev.off()