library(shiny)
library(ggplot2)
library(lubridate)

muar <- read.csv("Muar.csv", header = T, sep=':')
colnames(muar) <- c("Station No.","Location", "Date", "Hour", "API", "Pollutant")

server <-function(input, output) {
  output$plot1 <- renderPlot({
    select_data <- muar[month(muar$Date)==input$month & year(muar$Date)==input$year,]
    p <- ggplot(data=select_data, aes(x=select_data$Hour, y=select_data$API)) + geom_smooth(color="blue") + labs(x="Hour", y = "API reading")
    print(p)
  })}