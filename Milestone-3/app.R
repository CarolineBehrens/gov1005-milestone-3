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
library(shinyWidgets)
library(gtsummary)
library(rstanarm)
library(shinythemes)
library(gt)
source("map.R")q


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
                             c(state_crime$name)
                         )),
                     mainPanel(plotOutput("state_crime"),
                               plotOutput("vc_posterior"))) 
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
             
                         

#Define server logic required to draw a histogram

server <- function(input, output){
 output$state_crime <- renderPlot({ 
 plot_1 <- state_crime %>%
   filter(name == input$plot_type) %>%
    ggplot(aes(x = year, y = total/1000, color = type)) +
   geom_point(size = 5)
  plot_1
})
} 

output$vc_posterior <- renderPlot({
  fit_1 <- stan_glm(violent_crime_total ~ year,
                    data = crime_and_incarceration_by_state, 
                    seed = 17,
                    refresh = 0)
  
  
  vc_posterior <- fit_1 %>% 
   as_tibble() %>% 
    ggplot(aes(x = year, fill = type)) +
    geom_histogram(aes(y = after_stat(count/sum(count))),
                  alpha = 0.5, 
                   bins = 100, 
                   position = "identity") +
    labs(title = "Posterior for Average Age",
         subtitle = "More data allows for a more precise posterior for Democrats",
         x = "Age",
        y = "Probability") +
    scale_y_continuous(labels = scales::percent_format()) +
    theme_classic()
})

# Run the application 
shinyApp(ui = ui, server = server)



