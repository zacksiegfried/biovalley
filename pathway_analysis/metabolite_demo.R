library(this.path)
library(tidyverse)
library(Maaslin2)
library(Tweedieverse)

file_path <- this.path::here(..=0)
setwd(file_path)

### loading in metabolite data / filtering to single timepoint (Day 57) / renaming ID column as subject IDd
metabolite_data <- read.csv("data/1merged_data.csv") %>%
  filter(time == "57")
rownames(metabolite_data) <- metabolite_data[,3]

# extracting group metadata
meta_data <- metabolite_data %>%
  dplyr::select("group") %>%
  mutate(group = as.factor(group))

# dropping non-metabolite columns
metabolite_data <- metabolite_data %>%
  dplyr::select(-c("group", "time", "subject"))
metabolite_data <- metabolite_data[ , colSums(is.na(metabolite_data))==0]


### running Maaslin2
Maaslin2::Maaslin2(
  input_data  = metabolite_data,
  input_metadata =  meta_data,
  output =  'analysis/maaslin2_demo',
  max_significance= 0.1,
  analysis_method = 'LM',
  standardize = FALSE,
  transform = 'LOG',
  normalization = 'NONE',
  heatmap_first_n = 20,
  plot_scatter= TRUE,
  reference = c("group,1"))
dev.off()
