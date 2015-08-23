source("nextWord.R")

shinyServer(function(input, output, session) {
    
    withProgress(message = 'Loading...', value = 0, {
        set.seed(12345)
        loadData()
        })
    
    result <- reactive(getNextWord(input$text)) 
    
    output$word1 <- renderText({
        ifelse(nchar(input$text) > 0, result()[1], "")
    })
    output$word2 <- renderText({
        ifelse(nchar(input$text) > 0, result()[2], "")
    })
    output$word3 <- renderText({
        ifelse(nchar(input$text) > 0, result()[3], "")
    })
    output$word4 <- renderText({
        ifelse(nchar(input$text) > 0, result()[4], "")
    })
    output$word5 <- renderText({
        ifelse(nchar(input$text) > 0, result()[5], "")
    })
})
