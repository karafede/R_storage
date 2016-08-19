
library(mongolite)

options(mongodb = list(
  "host" = "ds161245.mlab.com:61245",
  "username" = "karafede",
  "password" = "Password08"
))

databaseName <- "karafededb"
collectionName <- "responses"

saveData <- function(data) {
  # Connect to the database
  db <- mongo(collection = collectionName,
              url = sprintf(
                "mongodb://%s:%s@%s/%s",
                options()$mongodb$username,
                options()$mongodb$password,
                options()$mongodb$host,
                databaseName))
  # Insert the data into the mongo collection as a data.frame
  data <- as.data.frame(t(data))
  db$insert(data)
}

# con <- mongo(collection = "responses", db = "karafededb", url = "mongodb://karafede:Password08@ds161245.mlab.com:61245/karafededb")

# con <- mongo("mtcars", url = "mongodb://readwrite:test@ds043942.mlab.com:43942/jeroen_test")
