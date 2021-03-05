#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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
                     mainPanel(plotOutput("line_plot")))
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
             p("So far, I have a few data sets that could be used. 
               One of the data sets I have explores types of crimes 
               committed in each state from th year 2001-2016.
               It gives the total population in the states 
               during these years as well, so I could possibly make
               a plot that shows how the trend in violent crimes has 
               changed over time. I also have a data set that shows 
               prison custody by state from the years 2001-2016. I 
               could possibly use this data set as a broad introduction
               to the top, and then use the previously mentioned data 
               set to get more specific and show viewers what the crimes
               are. One other data set I found that was interesting is 
               covid prison rates per state as of feb 2, 2021. Im not 
               entirely sure how I could incorporate this into my final 
               project, but I think incorporating covid data could 
               be interesting since it is such a big part of the world 
               right now. It gives prisoner death rates, percent of 
               prisoner and staff cases, and total cumulative prisoner cases."),
             h3("About Me"),
             p("My name is Caroline Behrens and I study Economics. 
             You can reach me at Cbehrens@college.harvard.edu."),
             p(tags$a(href ="https://github.com/CarolineBehrens/gov1005-milestone-3.git"))))
             
                         

# Define server logic required to draw a histogram
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
