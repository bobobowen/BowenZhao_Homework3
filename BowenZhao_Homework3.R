#Question 1:                            # #####
#a:
rm(list=ls())
library(coronavirus)
update_dataset()

#b:
head(coronavirus)

#c:
#date == the date of summary
#province == the procince or state
#country == country name
#lat == latitude point
#long == longitude point
#type == type of case
#cases == number of daily cases

#Question 2:                            # #####
#a:
library(dplyr)
library(ggplot2)
summary_of_total_confrimed_case = coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

head(summary_of_total_confrimed_case,20)

#b:
top_n(summary_of_total_confrimed_case, n=5,total_cases) %>%
  ggplot(., aes(country, total_cases)) +
  geom_bar(stat = "identity")

#c
top_n(summary_of_total_confrimed_case, n=5,total_cases) %>%
  ggplot(., aes(country, total_cases)) +
  geom_bar(stat = "identity")+
  coord_flip()

#d
top_n(summary_of_total_confrimed_case, n=5,total_cases) %>%
  ggplot(., aes(country, total_cases)) +
  geom_bar(stat = "identity")+
  coord_flip()+
  ggtitle("Top 5 countries by total cases")

#Question 3:                            # ######
#a:
library(tidyr)
recent_cases <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(date) %>%
  summarise(total_cases_confirmed = sum(cases)) %>%
  arrange(as.Date(date)) 

#b:
ggplot(recent_cases, aes(as.Date(date), total_cases_confirmed)) +
  geom_line()

