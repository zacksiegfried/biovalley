library(this.path)
library(omePath)

file_path <- this.path::here(..=0)
setwd(file_path)


### reading metabolite mapping file
mapping_file <- read.delim(
  "data/smpdb_metabolites.tsv",
  sep = '\t',
  header = T,
  fill = F,
  comment.char = "" ,
  check.names = F,
  row.names = NULL
)

### reading input data file (This can be the output from a Tweedieverse or Maaslin2 analysis contrasting 2 metadata groups)
input_data <- read.delim(
  "data/stats_table.tsv",
  sep = '\t',
  header = T,
  fill = F,
  comment.char = "" ,
  check.names = F,
  row.names = 1
)

### specifying output directory
output <- paste0(file_path, "/analysis/omePath_demo")

### running omePath
omePath_results <- omePath(input_data = input_data,
                           output = output,
                           mapper_file = mapping_file,
                           pathway_col = "Pathway",
                           feature_col = "Feature",
                           score_col = 'coef',
                           pval_threshold = 0.05,
                           fdr_threshold = NA,
                           Pathway.Subject = NA,
                           method = 'ks',
                           min_member = 2,
                           do_plot = TRUE)
