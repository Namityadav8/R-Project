install.packages("shiny")
library(shiny)

ui <- fluidPage(
  titlePanel("IPL Teams Dashboard"),
  sidebarLayout(
    sidebarPanel(
      # Add input widgets here
      selectInput("team", "Select Team:", choices = c("Team A", "Team B", "Team C")),
      sliderInput("year", "Select Year:", min = 2008, max = 2023, value = c(2010, 2015))
    ),
    mainPanel(
      # Add output elements here
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    # Replace this with your data analysis code
    x <- seq(input$year[1], input$year[2])
    y <- rnorm(length(x))
    plot(x, y, type = "l", main = paste("IPL Team:", input$team))
  })
}

shinyApp(ui = ui, server = server)
