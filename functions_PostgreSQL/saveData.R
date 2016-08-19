
library(RPostgreSQL)

table <- "prova"

####################################################

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")

pw <- {
  "Password07"
}

saveData <- function(data) {
     # Connect to the database
db <- dbConnect(drv, dbname = "stuarts_sandbox",
                 host = "172.31.113.9", port = 5432,       
                 user = "federicok", password = pw)
# rm(pw) # removes the password
dbListTables(db)

# Construct the update query by looping over the data fields
query <- sprintf(
  "INSERT INTO %s (%s) VALUES ('%s')",
  table, 
  paste(names(data), collapse = ", "),
  paste(data, collapse = "', '")
)
# Submit the update query and disconnect
dbGetQuery(db, query)
dbDisconnect(db)
}

# dbWriteTable(db, name = "temp_tickers", value = data, row.names = FALSE)
