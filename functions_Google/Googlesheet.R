
library(googlesheets)
library(dplyr)

df.colnames <- c("name", "used_shiny", "r_num_years")
my.df <- data.frame(a = "cannot be empty", b = "cannot be empty", c = "cannot be empty")
empty_df = my.df[FALSE,]
colnames(empty_df) <- df.colnames

## Create a new workbook populated by this data.frame:
mynewSheet <- gs_new("responses", input = empty_df, trim = TRUE)

## Append Element
# mynewSheet <- mynewSheet %>% gs_add_row(input = c("a","b","c"))
# mynewKey <- mynewSheet$sheet_key