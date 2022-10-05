library(Stat2Data)
library(tidyverse)
data("Hawks")

head(Hawks)

hSF <- Hawks %>%
  filter(Species == "RT" & Weight >= 1000) %>%
  select(Wing, Weight, Tail)

head(hSF)

species_code <- c("CH", "RT", "SS")
species_name_full <- c("Cooper's", "Red-tailed", " Sharp-shinned")
hawkSpeciesNameCodes <- data.frame(species_code, species_name_full)

hawkSpeciesNameCodes

colnames(Hawks)[7] <- "species_code" 


data("Hawks")
hawksFullName <- Hawks %>%
  left_join(hawkSpeciesNameCodes, by = "species_code", copy = F) %>%
  select(-species_code)



head(hawksFullName)

data("Hawks")
Hawks$bird_BMI <- (1000 * (Hawks$Weight)) / ((Hawks$Wing) ^ 2)

Hawks <- Hawks %>%
  select(Species, bird_BMI)

head(Hawks)

hawksFullName %>%
  select(species_name_full, Wing, Weight) %>%
  print(head(hawksFullName), 7)

summary_df <- hawksFullName %>%
  group_by(species_name_full) %>%
  summarise(num_rows = n)

summary_df

new_df <- hawksFullName %>%
  group_by(species_name_full) %>%
  dplyr::summarize(num_rows = n(),
                   mn_wing = mean(Wing),
                   md_wing = median(Wing),
                   t_mn_wing = mean(Wing, trim = 0.1),
                   b_wt_ratio = max((Wing / Weight), na.rm = T))            
new_df


data("Hawks")

df2 <- Hawks %>%
  select(Species, Wing, Weight, Culmen, Hallux, Tail, StandardTail, Tarsus, Crop) %>%
  group_by(Species) %>%
  dplyr::summarise(across(everything(), ~ sum(is.na(.))))

df2  
  