library(tidyverse)
library(lubridate)

raw_lines <- read_lines("Lab_Project/Unclean Dataset.csv", locale = locale(encoding = "ISO-8859-1"))

# Extract the header
header <- str_split(raw_lines[1], ",")[[1]] %>% str_trim()
data_lines <- raw_lines[-1]
data_lines <- data_lines[data_lines != ""] # Remove completely blank lines

processed_lines <- data_lines %>%
  str_replace_all(",+$", "") %>%
  map_chr(function(line) {
    if (str_detect(line, "\\|")) {
      # Handle pipes
      parts <- str_split(line, "\\|")[[1]] %>% str_trim()
      parts <- parts[1:min(8, length(parts))]
      return(paste(parts, collapse = ";"))
    } else {
      # Handle commas
      parts <- as.character(read.csv(text = line, header = FALSE, stringsAsFactors = FALSE)[1, ]) %>% str_trim()
      parts <- parts[1:min(8, length(parts))]
      return(paste(parts, collapse = ";"))
    }
  })

# Convert processed lines into a Data Frame
df_raw <- read.csv(text = paste(header %>% paste(collapse = ";"), 
                                paste(processed_lines, collapse = "\n"), 
                                sep = "\n"), 
                   sep = ";", stringsAsFactors = FALSE)

df_clean <- df_raw %>%
  filter(First_Name != "" & !is.na(First_Name)) %>%
  mutate(
    # 1. Basic Formatting
    Student_ID = suppressWarnings(as.integer(Student_ID)),
    First_Name = str_to_title(str_trim(First_Name)),
    Last_Name = str_to_title(str_trim(Last_Name)),
    
    # 2. Fix the Age
    Age_Fixed = if_else(str_detect(Gender, "\\d"), str_extract(Gender, "\\d+"), as.character(Age)),
    Gender = if_else(str_detect(Gender, "\\d"), str_extract(Gender, "[A-Za-z]+"), Gender),
    Age = suppressWarnings(as.integer(Age_Fixed)),
    Age = if_else(Age < 15 | Age > 100, NA_integer_, Age), # Handle the "4 year old" bug
    
    # 3. Standardize Course Names
    Course = str_trim(Course),
    Course = case_when(
      str_detect(Course, "Machine Learn") ~ "Machine Learning",
      str_detect(Course, "Web Develop") ~ "Web Development",
      str_detect(Course, "Data Analy") ~ "Data Science", # Unify Analysis/Analytics
      Course == "4" ~ NA_character_, # Fix the "4" course error
      TRUE ~ Course
    ),
    
    # 4. The Payment
    Total_Payments = str_remove_all(Total_Payments, "[^0-9.]"),
    Total_Payments = as.numeric(Total_Payments),
    Total_Payments = if_else(Total_Payments > 10000, 
                             as.numeric(str_sub(as.character(Total_Payments), 1, 4)), 
                             Total_Payments),
    
    # 5. Date Cleaning
    Enrollment_Date = as.Date(parse_date_time(Enrollment_Date, orders = c("Ymd", "mdy", "dmy")))
  ) %>%
  group_by(First_Name, Last_Name, Age, Course) %>%
  slice(1) %>% 
  ungroup() %>%
  
  # 7. Final Polish
  select(-Age_Fixed) %>%
  mutate(System_Record_ID = row_number()) %>%
  select(System_Record_ID, Student_ID, First_Name, Last_Name, Age, Gender, Course, Enrollment_Date, Total_Payments)

colSums(is.na(df_clean))

write.csv(df_clean, "Lab_Project/Cleaned_Dataset.csv")