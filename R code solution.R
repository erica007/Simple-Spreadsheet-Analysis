
library(dplyr)
library(lubridate)
library(readxl)

df <- read_excel("C:/Users/MSI/Desktop/HireArt - Data Analyst Exercise 10.12.17.xlsx", 
               sheet = "Sheet1", col_types = c("text", "text", "date"))

df_month_summary <- df %>%
  group_by(Month=month(`Date of Contact`)) %>%
  summarise(Percentage=round(sum(n())/nrow(df),4))%>%
  arrange(desc(Percentage))
df_month_summary$Percentage<-sprintf("%.1f %%",df_month_summary$Percentage*100)


