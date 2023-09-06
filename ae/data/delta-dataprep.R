# From https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1009243/Technical_Briefing_20.pdf
# and http://www.statlit.org/pdf/2021-Schield-ASA-BOF.pdf

# load packages –---------------------------------------------------------------

library(tidyverse)

# create data –-----------------------------------------------------------------

delta <- tibble(
  vaccine = c(rep("Vaccinated", 89807), rep("Unvaccinated", 147612), rep("Vaccinated", 27307), rep("Unvaccinated", 3440)),
  age = c(rep("<50", 89807 + 147612), rep("50+", 27307 + 3440)),
  outcome = c(
    rep("died", 18), rep("survived", 89807 - 18),
    rep("died", 45), rep("survived", 147612 - 45),
    rep("died", 459), rep("survived", 27307 - 459),
    rep("died", 205), rep("survived", 3440 - 205)
  )
)

# write data –------------------------------------------------------------------

write_csv(delta, "ae/data/delta.csv")
