# Load necessary libraries
library(readxl)  # For reading Excel files
library(ggplot2)  # For data visualization
library(dplyr)    # For data manipulation

# Read the Excel file (replace with your correct path)
file_path <- "C:/Users/admin/OneDrive/Documents/New folder (3)/OneDrive/Desktop/du an/gia tieu thu ca phe.xlsx"  # Use forward slashes
data <- read_excel(file_path, skip = 1)  # Skip the first row which is not data

# Inspect the first few rows
head(data)

# Set appropriate column names
colnames(data) <- c("region", "month", "year", "gia")

# Convert 'month' and 'year' to factors and 'gia' to numeric
data$month <- as.numeric(data$month)  # Ensure month is numeric
data$year <- as.numeric(data$year)    # Ensure year is numeric
data$gia <- as.numeric(gsub(",", "", data$gia))  # Clean and convert 'gia'

# Filter data for the years 2017 to 2023
data_filtered <- data %>%
  filter(year >= 2017 & year <= 2023)

# Create the plot
ggplot(data_filtered, aes(x = factor(month), y = gia, group = year, color = factor(year))) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Gia tieu thu ca phe tai Viet Nam (2017 - 2023)",
       x = "Thang",
       y = "Gia (dong/kg)",
       color = "Nam") +
  scale_x_discrete(labels = month.abb) +
  theme_minimal() +
  theme(legend.position = "bottom")

