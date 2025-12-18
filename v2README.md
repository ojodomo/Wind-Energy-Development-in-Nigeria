Project Workflow & Reproducibility Steps

This repository documents the workflow for a GIS-based site suitability analysis for wind energy development in Nigeria. The steps below describe how data are sourced, cleaned, explored, and prepared for analysis so that the study can be reproduced by other researchers or policymakers.

1. Data Sources

The primary wind resource data used in this project come from the Global Wind Atlas:

Global Wind Atlas: https://globalwindatlas.info

Variables used:

Mean wind speed (m/s) at 100 m hub height

Mean wind power density (W/m²)

Additional spatial reference data:

Nigeria administrative boundaries (states): GADM / Natural Earth

Base maps and infrastructure layers (future stages): OpenStreetMap

Because downloadable, state-level wind summaries for Nigeria are limited, wind data are manually extracted from the Global Wind Atlas interface for selected states and locations and compiled into a structured dataset.

2. Data Collection & Entry

Selected representative locations within each Nigerian state using the Global Wind Atlas map interface.

Recorded:

Mean wind speed (m/s)

Mean wind power density (W/m²)

Measurement height (100 m)

Entered values into a structured Excel file (data/wind_resource_nigeria.xlsx).

Assigned consistent state names and identifiers to ensure compatibility with GIS layers.

3. Data Cleaning & Preprocessing

Data preparation is performed in R using tidyverse tools.

Key cleaning steps:

Standardized state names to match GIS boundary shapefiles.

Converted all wind variables to numeric format.

Checked for missing or inconsistent entries.

Ranked states by wind speed and power density.

Example meta-code:
library(tidyverse)

wind_data <- read_excel("data/wind_resource_nigeria.xlsx")

wind_clean <- wind_data %>%
  mutate(
    mean_wind_speed = as.numeric(mean_wind_speed),
    power_density = as.numeric(power_density)
  ) %>%
  drop_na() %>%
  arrange(desc(mean_wind_speed))

4. Exploratory Data Analysis (EDA)

Initial EDA focuses on identifying spatial and regional patterns in wind potential across Nigeria.

Generated summary statistics (mean, min, max wind speeds)

Created ranked bar charts of mean wind speed by state

Compared northern, central, and southern regions

Example visualization:
ggplot(wind_clean, aes(x = reorder(state, mean_wind_speed),
                       y = mean_wind_speed)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Mean Wind Speed by Nigerian State",
    x = "State",
    y = "Mean Wind Speed (m/s)"
  )


This visualization reveals clustering of high wind potential in northern Nigeria, supporting established literature on wind resource variability and topographic influence.

5. Documentation & Reproducibility

To ensure reproducibility:

All scripts are stored in the /scripts directory

Raw and cleaned data are stored in /data

File naming conventions and variable definitions are documented

The README provides step-by-step guidance for reproducing results

All analysis is conducted using open-source tools (R, GitHub)

Future updates will include:

Automated GIS overlays

Multi-criteria decision analysis (MCDA)

Interactive maps and dashboards
