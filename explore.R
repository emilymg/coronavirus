head(coronavirus)
summary(coronavirus)
unique(coronavirus$type)
glimpse(coronavirus)

#Example: summary of total confirmed cases by country (top 20)
summary_df <- coronavirus %>%
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarize(total_cases = sum(cases)) %>%
  arrange(-total_cases)

head(summary_df, 20)