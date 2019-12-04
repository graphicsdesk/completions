library(tidyverse)

data <- readxl::read_excel("../CIP-2-4.xlsx") %>% 
  filter(Sex != "Total for selected values") %>% 
  gather(Year, Count, `2017`:`1997`) %>% 
  rename(
    CIP2 = `[CIP Code and Description (2 digit)]`,
    CIP4 = `[CIP Code and Description (4 digit)]`
  ) %>% 
  filter(CIP2 != "Total for selected values") %>% 
  mutate(
    Count = as.numeric(Count),
    Year = as.numeric(Year)
  )

data %>%
  filter(
    CIP2 %in% c(
      "11 - Computer And Information Sciences And Support Services",
      "14 - Engineering",
      "26 - Biological And Biomedical Sciences",
      "27 - Mathematics And Statistics",
      "40 - Physical Sciences",
      "52 - Business, Management, Marketing, And Related Support Services"
    )
  ) %>% 
  ggplot(aes(Year, Count, color = Sex)) +
  geom_line() + 
  facet_wrap(~ CIP4, scales = "free")
  
  

