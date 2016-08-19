
library(shiny)
library(DT)
library(shinydashboard)

 ui <- dashboardPage(skin = "yellow",
        dashboardHeader(title = "Questionnaire"),
          dashboardSidebar(
           width = 250,
          paste("Time:",Sys.time()),
          
          sidebarMenu(
           
       #   fluidRow(
          #  column (3,offset = 1,
            textInput("name", "Name", "", width = 220),
        #  ),
          
         # fluidRow(
            checkboxInput("used_shiny", "I've built a Shiny app in R before", FALSE),
        #  ),
          
          fluidRow(
            column (11, offset = 0,
            sliderInput("r_num_years", "Number of years using R", 0, 25, 2, ticks = FALSE)
          )),
          
          
          fluidRow(
            column (3,offset = 1,
            actionButton("submit", strong("Submit"), icon("cog", lib = "glyphicon"),
                         style="color: #fff; background-color: #7fbf7f; border-color: #2e6da4", width = 150)
          ))
          )
        ),
          
          dashboardBody(DT::dataTableOutput("responses", width = 300), tags$hr())
          )

