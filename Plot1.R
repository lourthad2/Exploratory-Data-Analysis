setwd("C:/hadoop/R/Data")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#sampling <- NEI[sample(nrow(NEI),size=500,replace=F),]
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002,2005, and 2008.
TotalPM25byYearEmission <- aggregate(Emissions~year,NEI,sum)

#print(TotalPM25byYearEmission)
#year Emissions
#1 1999   7332967
#2 2002   5635780
#3 2005   5454703
#4 2008   3464206

png(filename='plot1.png')
barplot(height = TotalPM25byYearEmission$Emissions,
        names.arg = TotalPM25byYearEmission$year,
        xlab="years"
        ,ylab = expression("Total" ~ PM[2.5] ~ "Emissions in tons")
        ,main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year")
        )
dev.off()