
library(shiny)
library(DT)
source("loadData.R")
source("saveData.R")

server = function(input, output, session) {
  
  
  # Define the fields we want to save from the form
  fields <- c("name", "used_shiny", "r_num_years")
  
  # Whenever a field is filled, aggregate all form data
  formData <- reactive({
    data <- sapply(fields, function(x) input[[x]])
    data
  })
  
  # When the Submit button is clicked, save the form data
  observeEvent(input$submit, {
    saveData(formData())
  })
  
  # Show the previous responses
  # (update with current response when Submit is clicked)
  output$responses <- DT::renderDataTable({
    input$submit
    loadData()
  })     
}