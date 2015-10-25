setwd("C:/hadoop/R/Data")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? Use the base plotting system to make 
#a plot answering this question.

BaltimoreMD <- subset(NEI,fips == "24510")

BaltimoreMDTotal <- aggregate(Emissions~year,BaltimoreMD,sum)



png(filename='plot2.png')
barplot(height = BaltimoreMDTotal$Emissions,
        names.arg = BaltimoreMDTotal$year,
        xlab="years"
        ,ylab = expression("Total" ~ PM[2.5] ~ "Emissions in tons")
        ,main=expression("Total Emissions in Baltimore MD")
        )
dev.off()