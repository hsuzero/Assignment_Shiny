
library(shiny)
library(ggplot2) # ggplot2 provides the 'mpg' data set.

shinyServer(function(input, output) {

    output$table <- DT::renderDataTable(DT::datatable({
      
        data <- mpg
        
        if(input$maker != "All"){
            data <- data[data$manufacturer == input$maker,]
        }
        
        if(input$trans != "All"){
            data <- data[data$trans == input$trans,]
        }
        
        if(input$class != "All"){
            data <- data[data$class == input$class,]
        }
        
        data <- data[which(data$cty >= input$cty[1] & data$cty <= input$cty[2]),]
        data <- data[which(data$hwy >= input$hwy[1] & data$hwy <= input$hwy[2]),]
        
        data
    })
    )
    
    output$plot <- renderPlot({
        plot(mpg$cty, mpg$hwy, pch=21, xlab = 'city miles per gallon',
             ylab = 'highway miles per gallon')
        
        data <- mpg
        
        if(input$maker != "All"){
            data <- data[data$manufacturer == input$maker,]
        }
        
        if(input$trans != "All"){
            data <- data[data$trans == input$trans,]
        }
        
        if(input$class != "All"){
            data <- data[data$class == input$class,]
        }
        
        data <- data[which(data$cty >= input$cty[1] & data$cty <= input$cty[2]),]
        data <- data[which(data$hwy >= input$hwy[1] & data$hwy <= input$hwy[2]),]
        
        points(data$cty, data$hwy, pch=19, col='red')
   
    })
    
})
