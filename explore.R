head(coronavirus_df)
summary(coronavirus_df)

# Note: JHU CCSE stopped tracking "recovered" cases as of 8/5/2021. 
# These cases will be replaced with NA going forward.
unique(coronavirus_df$type)
glimpse(coronavirus_df)

# Import vaccination data from Our World in Data
vaccinations <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv")

summary(vaccinations)
glimpse(vaccinations)

# Create table of people fully vaccinated
full_vax <- vaccinations %>%
  select(date, location, people_fully_vaccinated)
glimpse(full_vax)

# Join full_vax to coronavirus_df
coronavirus_df_vax <- coronavirus_df %>%
  left_join(full_vax, by = c("country" = "location"))
# Summary df of total deaths by country
summary_deaths <- coronavirus_df %>%
  filter(type == "death") %>%
  group_by(country) %>%
  summarize(total_deaths = sum(cases)) %>%
  arrange(-total_deaths)

# View top 20
head(summary_deaths, 20)

# Summary df of total confirmed cases by country
summary_confirmed <- coronavirus_df %>%
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarize(total_cases = sum(cases)) %>%
  arrange(-total_cases)

head(summary_confirmed, 20)

# Join the two summary df's created above, add a column to aggregate % deaths
summary_joined <- summary_confirmed %>%
  inner_join(summary_deaths, by = "country") %>%
  mutate(percent_deaths = (total_deaths / total_cases) * 100)

head(summary_joined, 20)

