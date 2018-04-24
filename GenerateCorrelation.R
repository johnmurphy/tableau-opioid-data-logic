'**********************************************************************

      SCRIPT TO GENERATE CORRELATION FOR OPIOID TABLEAU DASHBOARD

**********************************************************************'

setwd("C:/ECE/Tableau/Capstone/Capstone Opiate")

if("RODBC" %in% rownames(installed.packages()) == FALSE) {install.packages("RODBC")}
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}
if("corrplot" %in% rownames(installed.packages()) == FALSE) {install.packages("corrplot")}

library(RODBC)
library(dplyr)
library(corrplot)

# Create Connection - Use DNS setup on laptop/server
dbConn <- odbcConnect("YourDNS",uid="***", pwd="***")

# Run query retrieve data select two columns generate correlation
df <- sqlQuery(dbConn, paste("select [State], count(distinct NPI) as 'Total NPIs', Deaths as 'Overdose Deaths'", 
                             "from ECE.[dbo].[cms-data-load]",
                             "group by [State], Deaths"))  %>%
      select('Total NPIs', 'Overdose Deaths') %>%
      cor() 


# Save the object to a file to be loaded into Tableau 
save(df, file="NPI_Overdose_Deaths.RData")


# Close the connection
odbcClose(dbConn)
