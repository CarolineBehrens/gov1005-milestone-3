#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(tidycensus)
source("final_project.R")

ui <- navbarPage(
    "Incarceration Numbers by State",
    tabPanel("Model",
             fluidPage(
                 titlePanel("Model Title"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput(
                             "plot_type",
                             "Plot Type",
                             c("Option A" = "a", "Option B" = "b")
                         )),
                     mainPanel(plotOutput("covid"))) 
             )),
    tabPanel("Discussion",
             titlePanel("Discussion Title"),
             p("Tour of the modeling choices you made and 
              an explanation of why you made them")),
    tabPanel("About", 
             titlePanel("About"),
             h3("I have always been interested in criminal justice, 
                and this project allows me to explore data revolving 
                the topic and explore the most common trends between 
                states."),
             p("So far I have loaded all of my data sets into this project. 
               I have not gotten to process my data yet, but my plan is 
               to filter out by jurisdiction, year, violent crime total 
               and by each type of crime. I want to show the trends 
               over the years and how crime trends have differed. I also want
               to load the covid prison rates and examine the differences 
               between every state. "),
      
             h3("About Me"),
             p("My name is Caroline Behrens and I study Economics. 
             You can reach me at Cbehrens@college.harvard.edu."),
             p(tags$a(href ="https://github.com/CarolineBehrens/gov1005-milestone-3.git"))))
             
                         

# Define server logic required to draw a histogram
server <- function(input, output){
  output$covid <- renderPlot({
   covid
})
}
# Run the application 
shinyApp(ui = ui, server = server)



