source("nextWord.R")

shinyServer(function(input, output, session) {
    
    result <- reactive(getNextWord(input$text)) 
    
    output$word1 <- renderText({
        paste("Top 1:", input$text, result()[1])
    })
    output$word2 <- renderText({
        paste("Top 2:", input$text, result()[2])
    })
    output$word3 <- renderText({
        paste("Top 3:", input$text, result()[3])
    })
    output$word4 <- renderText({
        paste("Top 4:", input$text, result()[4])
    })
    output$word5 <- renderText({
        paste("Top 5:", input$text, result()[5])
    })
})
