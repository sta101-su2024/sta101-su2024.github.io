# load packages ----------------------------------------------------------------

library(tidyverse)

# heart_transplant -------------------------------------------------------------

# load data

heart_transplant <- openintro::heart_transplant |>
  mutate(
    outcome = if_else(survived == "dead", "deceased", as.character(survived))
  ) |>
  select(-survived) |>
  relocate(id, outcome, transplant, age, survtime)

# write data

write_csv(heart_transplant, here::here("labs", "data/heart-transplant.csv"))
