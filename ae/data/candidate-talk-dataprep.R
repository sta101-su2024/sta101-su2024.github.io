# load packages –---------------------------------------------------------------

library(tidyverse)
library(janitor)
library(knitr)

# make data –-------------------------------------------------------------------

# https://c7p4g5i9.rocketcdn.me/wp-content/uploads/2023/09/Meredith-Poll-Report-September-2023.pdf

party <- c(
  rep("Democrat", 286),
  rep("Republican", 303),
  rep("Unaffiliated", 175),
  rep("Other", 37)
)

issue <- c(
  # democrat
  rep("Economy",                      round(286*.329, 0)),  
  rep("Abortion/Reproductive rights", round(286*.245, 0)),  
  rep("Immigration",                  round(286*.035, 0)),
  rep("Crime",                        round(286*.077, 0)),
  rep("Gun rights/restrictions",      round(286*.206, 0)),
  rep("Something else",               round(286*.080, 0)),
  rep("Don't know",                   round(286*.028, 0)),
  # republican
  rep("Economy",                      round(303*.455, 0)),  
  rep("Abortion/Reproductive rights", round(303*.069, 0)),  
  rep("Immigration",                  round(303*.251, 0)),
  rep("Crime",                        round(303*.116, 0)),
  rep("Gun rights/restrictions",      round(303*.046, 0)),
  rep("Something else",               round(303*.043, 0)),
  rep("Don't know",                   round(303*.020, 0)),  
  # unaffiliated
  rep("Economy",                      round(175*.451, 0)),  
  rep("Abortion/Reproductive rights", round(175*.114, 0)),  
  rep("Immigration",                  round(175*.114, 0)),
  rep("Crime",                        round(175*.057, 0)),
  rep("Gun rights/restrictions",      round(175*.091, 0)),
  rep("Something else",               round(175*.137, 0)),
  rep("Don't know",                   round(175*.034, 0)),  
  # other
  rep("Economy",                      round(37*.381, 0)),  
  rep("Abortion/Reproductive rights", round(37*.095, 0)),  
  rep("Immigration",                  round(37*.143, 0)),
  rep("Crime",                        round(37*.095, 0)),
  rep("Gun rights/restrictions",      round(37*.095, 0)),
  rep("Something else",               round(37*.143, 0)),
  rep("Don't know",                   round(37*.048, 0)-1)
)

candidate_talk <- tibble(party, issue)

# check –-----------------------------------------------------------------------

candidate_talk |>
  tabyl(party, issue) |>
  adorn_totals("col") |>
  adorn_percentages("row") |>
  kable(digits = 3)

# write data to file –----------------------------------------------------------

write_csv(candidate_talk, here::here("ae", "data/candidate-talk.csv"))
