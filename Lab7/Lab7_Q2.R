library(dplyr)
library(tidyr)
library(ggplot2)

embark_insights <- titanic_clean %>%
  group_by(Embarked) %>%
  summarise(
    Total_Passengers = n(),
    Survival_Rate = round((sum(Survived == 1) / Total_Passengers) * 100, 1),
    Pct_Third_Class = round((sum(Pclass == 3) / Total_Passengers) * 100, 1)
  )
print(embark_insights)

gender_class_insights <- titanic_clean %>%
  group_by(Sex, Pclass) %>%
  summarise(
    Total = n(),
    Survival_Rate = round((sum(Survived == 1) / Total) * 100, 1),
    .groups = 'drop'
  ) %>%
  arrange(desc(Survival_Rate))
print(gender_class_insights)

ggplot(titanic_clean, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
  facet_wrap(~Sex) +
  scale_fill_manual(values = c("#ff9999", "#99ccff"), labels = c("Perished", "Survived")) +
  labs(title = "Passenger Survival by Age and Gender",
       x = "Age",
       y = "Count",
       fill = "Status") +
  theme_minimal()