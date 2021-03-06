shinyUI(fluidPage(
  titlePanel("censusVis"),
  sidebarLayout(
    sidebarPanel( 
      p("Create demographic maps with information from the
        2010 US Census"),
      selectInput("select", label = h5("Choose a variable to display"), 
                  choices = list("Percent White" = 1, "Percent Black" = 2,
                                 "Percent Hispanic" = 3, "Percent Asian" = 4 ), selected = 1)),
    sliderInput("slider", "Range of Interest",
                min = 0, max = 100, value = c(0, 100))
      ),
    mainPanel("")
))