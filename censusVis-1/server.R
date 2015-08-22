
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(function(input, output) {
output$map<-renderPlot({
  data<-switch(input$var,
               "Percent White" = counties$white,
               "Percent Black" = counties$black,
               "Percent Hispanic" = counties$hispanic,
               "Percent Asian" = counties$asian)
  
  color <- switch(input$var, 
                  "Percent White" = "darkgreen",
                  "Percent Black" = "black",
                  "Percent Hispanic" = "darkorange",
                  "Percent Asian" = "darkviolet")
  
  legend <- switch(input$var, 
                   "Percent White" = "% White",
                   "Percent Black" = "% Black",
                   "Percent Hispanic" = "% Hispanic",
                   "Percent Asian" = "% Asian")
  
    percent_map(var = data, color = color, 
                legend.title = "CensusVis", max = input$range[2],
                min = input$range[1])

  })
})
