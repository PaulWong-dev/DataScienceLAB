library(dplyr)
library(tidyr)

titanic_df <- read.csv("Lab7/titanic.csv", na.strings = c("", "NA"))

print("--- Missing values before cleaning: ---")
print(colSums(is.na(titanic_df)))

titanic_clean <- titanic_df %>%
  mutate(Age = ifelse(is.na(Age), median(Age, na.rm = TRUE), Age)) %>%
  mutate(Embarked = replace_na(Embarked, "S")) %>%
  mutate(Cabin = replace_na(Cabin, "Unknown"))

class_insight <- titanic_clean %>%
  group_by(Pclass) %>%
  summarise(
    Total = n(),
    Survived = sum(Survived),
    Survival_Rate = (Survived / Total) * 100
  ) %>%
  arrange(desc(Survival_Rate))

print("--- Insight 1: Survival Rate by Passenger Class ---")
print(class_insight)

embark_class_insight <- titanic_clean %>%
  filter(Embarked == "C") %>%
  group_by(Pclass) %>%
  summarise(
    Total = n(),
    Survived = sum(Survived),
    Survival_Rate = (Survived / Total) * 100
  ) %>%
  arrange(Pclass)

print("--- Insight 2: Survival from Cherbourg (C) by Class ---")
print(embark_class_insight)

write.csv(titanic_clean, "Lab7/titanic_cleaned_report.csv", row.names = FALSE)
print("--- Success: Cleaned data exported to titanic_cleaned_report.csv! ---")