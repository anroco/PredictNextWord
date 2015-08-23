shinyUI(fluidPage(
    titlePanel("Predict next word"),
    fluidRow(
        column(4, wellPanel(
            textInput("text", "type a text", "hello")
        )),
        column(8,
               h4("Next word"),
               wellPanel(
                   span(h5(textOutput('word1'))),
                   span(h5(textOutput('word2'))),
                   span(h5(textOutput('word3'))),
                   span(h5(textOutput('word4'))),
                   span(h5(textOutput('word5')))
                   )
        )
    )
))