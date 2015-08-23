require(markdown)
library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict the next word (SwiftKey)"),
    sidebarLayout(
        sidebarPanel(
            h5("This application aims to predict the next word that you want to 
               write based on the text that has been typed previously."),
            br(),
            h5("Instructions:"),
            h5("Enter your text in the box down. The app suggests next best 
               word."),
            textInput("text", "type a text"),
            h6("This project was developed for the Johns Hopkins Data Science 
               Specialization Capstone course")
            ),
        mainPanel(
            tabsetPanel(type = "tabs",
                tabPanel("Next word",
                    h5("These five words are the strongest options of the 
                       prediction based on the entered text, options are sorted 
                       in descending certainty."),
                    wellPanel(
                        span(h1(textOutput('word1'),
                                style = "color:#071019",
                                align = "center")),
                        span(h2(textOutput('word2'),
                                style = "color:#428ee8",
                                align = "center")),
                        span(h3(textOutput('word3'), 
                                style = "color:#FF4000",
                                align = "center")),
                        span(h4(textOutput('word4'), 
                                style = "color:#01DF01",
                                align = "center")),
                        span(h5(textOutput('word5'), 
                                style = "color:#FF8000",
                                align = "center"))
                    )), 
                tabPanel("Help",
                    mainPanel(includeMarkdown("Help.md")))
        ))
)))