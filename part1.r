## ----message=FALSE, warning=FALSE----------------------------------------
#install.packages("tidyverse")
library(tidyverse)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)


## ------------------------------------------------------------------------
Indicators <- read_csv("Data/Indicators.csv")
#An additional Dataset in the form of a CSV
HDI <- read_csv("Data/HDI.csv")
#Lets remove the first column , as it is a useless duplicate index
HDI[1] <- NULL


## ------------------------------------------------------------------------
head(Indicators)


## ------------------------------------------------------------------------
#Count of rows
nrow(Indicators)
#Count of columns
ncol(Indicators)


## ------------------------------------------------------------------------
names(Indicators)


## ------------------------------------------------------------------------
Indicators$dimension <-as.factor(Indicators$dimension)

#Display number of levels in 'dimension' variable
nlevels(Indicators$dimension)


## ------------------------------------------------------------------------
Indicators$indicator_name <-as.factor(Indicators$indicator_name)

#Display levels in 'indicator_name' variable
nlevels(Indicators$indicator_name)


## ------------------------------------------------------------------------
Indicators$country_name <-as.factor(Indicators$country_name)

#Display levels in 'country_name' variable
nlevels(Indicators$country_name)


## ------------------------------------------------------------------------
Indicators$indicator_id <-as.factor(Indicators$indicator_id)


## ------------------------------------------------------------------------
Indicators$iso3 <-as.factor(Indicators$iso3)


## ------------------------------------------------------------------------
Indicators <-gather(Indicators, key = Years, "HDI_value", 6:34)

#rename last column to rating
#colnames(Indicators)[colnames(Indicators) == "1990" ] <- "HDI_value"


## ------------------------------------------------------------------------
Composite_indices <- subset(Indicators, dimension == "Composite indices" )
Composite_indices <- as_tibble(Composite_indices)

Demography <- subset(Indicators, dimension == "Demography" )
Demography <- as_tibble(Demography)

Education <- subset(Indicators, dimension == "Education" )
Education <- as_tibble(Education)

Environmental_sustainability <- subset(Indicators, dimension == "Environmental sustainability" )
Environmental_sustainability <- as_tibble(Environmental_sustainability)

Gender <- subset(Indicators, dimension == "Gender" )
Gender <- as_tibble(Gender)

Health <- subset(Indicators, dimension == "Health" )
Health <- as_tibble(Health)

Human_Security <- subset(Indicators, dimension == "Human Security" )
Human_Security <- as_tibble(Human_Security)

Income_resources <- subset(Indicators, dimension == "Income/composition of resources" )
Income_resources <- as_tibble(Income_resources)

Inequality <- subset(Indicators, dimension == "Inequality" )
Inequality <- as_tibble(Inequality)

Mobility_communication <- subset(Indicators, dimension == "Mobility and communication" )
Mobility_communication <- as_tibble(Mobility_communication)

Poverty <- subset(Indicators, dimension == "Poverty" )
Poverty <- as_tibble(Poverty)

Sustainability <- subset(Indicators, dimension == "Socio-economic sustainability" )
Sustainability <- as_tibble(Sustainability)

Financial_flows <- subset(Indicators, dimension == "Trade and financial flows" )
Financial_flows <- as_tibble(Financial_flows)

Work_vulnerability <- subset(Indicators, dimension == "Work, employment and vulnerability" )
Work_vulnerability <- as_tibble(Work_vulnerability)


## ------------------------------------------------------------------------
plot <- ggplot(Poverty, aes(indicator_name, HDI_value) ) + geom_col() + geom_path(colour = "red", na.rm = TRUE)
# Rename the x, Y axis to make graph communnicate more clearly
plot + ggtitle("Plot to demonstrate the HDI score is not a uniform unit of measure") + theme(axis.text.x = element_blank(), axis.text.y = element_blank(), axis.ticks = element_blank()) + xlab("Indicators Within A Dimension") + ylab("HDI Score")


## ------------------------------------------------------------------------
names(Poverty)

chart<- ggplot(Poverty, aes(indicator_name), na.rm = TRUE)
chart + geom_bar() + theme(axis.text.x = element_blank(), axis.text.y = element_blank(), axis.ticks = element_blank())


## ------------------------------------------------------------------------
ggplot(Poverty , aes(x = country_name, y = HDI_value)) + geom_col() + theme(axis.text.x = element_blank(), axis.text.y = element_blank(), axis.ticks = element_blank())

