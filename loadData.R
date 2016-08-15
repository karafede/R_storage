

library(RPostgreSQL)

table <- "prova"

loadData <- function() {
  
  drv <- dbDriver("PostgreSQL")
  
  pw <- {
    "Password07"
  }
  
  # Connect to the database
  db <- dbConnect(drv, dbname = "stuarts_sandbox",
                  host = "172.31.113.9", port = 5432,       
                  user = "federicok", password = pw)
  # Construct the fetching query
  query <- sprintf("SELECT * FROM %s", table)
  # Submit the fetch query and disconnect
  data <- dbGetQuery(db, query)
  dbDisconnect(db)
  data
}