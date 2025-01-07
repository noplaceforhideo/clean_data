# Install and load necessary packages
install.packages("tidyverse")
install.packages("nycflights13")

library(tidyverse)
library(nycflights13)

# Load the flights dataset
data("flights")

# View the structure of the dataset
str(flights)

# View the first few rows of the dataset
head(flights)

# Check for missing values
sum(is.na(flights))

# View columns with missing values
colSums(is.na(flights))

# Handle missing values by removing rows with missing values
flights_clean <- flights %>%
  drop_na()

# Alternatively, you can fill missing values with a specific value (e.g., 0)
# flights_clean <- flights %>%
#   fill(dep_time, arr_time, .direction = "down")

# Verify that there are no more missing values
sum(is.na(flights_clean))

# Convert date columns to date format
flights_clean <- flights_clean %>%
  mutate(
    year = as.integer(year),
    month = as.integer(month),
    day = as.integer(day),
    sched_dep_time = as.character(sched_dep_time),
    sched_arr_time = as.character(sched_arr_time)
  )

# Verify the data types
str(flights_clean)

# Create a new date column
flights_clean <- flights_clean %>%
  mutate(date = as.Date(paste(year, month, day, sep = "-")))

# Select relevant columns for analysis
flights_clean <- flights_clean %>%
  select(date, sched_dep_time, sched_arr_time, dep_delay, arr_delay, carrier, flight, origin, dest)

# View the cleaned and transformed dataset
head(flights_clean)
