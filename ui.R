
library(shiny)
library(ggplot2)

# This shiny app may help you to choice which type you want to buy.
shinyUI(fluidPage(
        
    titlePanel("Application of Searching ideal Car for you"),

    sidebarLayout(
        sidebarPanel(
            
            sliderInput("cty",
                        "City miles per gallon :",
                        min = 9,
                        max = 35,
                        value = c(10,20)),
            sliderInput("hwy",
                        "Highway miles per gallon :",
                        min = 12,
                        max = 44,
                        value = c(25,35)),
            selectInput("maker",
                        "Manufacturer: ",
                        choices = c("All", unique(as.character(mpg$manufacturer)))
                        ),
            selectInput("trans",
                        "Transmission: ",
                        choices = c("All", unique(as.character(mpg$trans)))
                        ),
            selectInput("class",
                        "Classification: ",
                        choices = c("All", unique(as.character(mpg$class)))
                        )
        
        ),

        
#        mainPanel(
#            DT::dataTableOutput("table"),
#            verbatimTextOutput("t")
#        )

        mainPanel(
            tabsetPanel(type = 'tabs',
                tabPanel('Introduction', br(),
                        h3('What are your ideal cars?'),
                        'There are many important points to consider when choosing a car. 
                        This app will provide several options for you to choice the ideal vehicle in your mind.',
                        br(),
                        h3('How we do it?'),
                        'Considering the issue of global warming, automobiles are one of the main sources 
                        of greenhouse gas emissions.This app will suggest that you 
                        prioritize the fuel efficiency of your car. In this 
                        application, you can choose the fuel efficiency of city 
                        driving and highway driving. After you select the 
                        appropriate fuel efficiency range, the application will 
                        help you select the appropriate car models in the database 
                        and present to you in "Data" tab.'
                ),        
                tabPanel('Data',br(),
                        DT::dataTableOutput("table")
                ),
                tabPanel('Fuel efficiency plot', br(),
                         h3('The fuel efficiency of City vs Highway'),
                         'Considering the options you provide, the car model recommended by the app will be marked with a red dot in the graph.',
                         br(),
                         plotOutput('plot')
                )
            )
        )
    )
# mainPanel(
#     plotOutput("plot")
#     )
            
        
    )
)
