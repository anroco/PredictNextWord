library(NLP)
library(tm)

loadData <- function(){
    for(i in 1:4){
        assign(paste("data", i, "gram", sep = ""), 
               read.csv(file=paste("data/data", i, "gram.csv", sep = "")),
               envir = .GlobalEnv)
    }
}

cleanInputText <- function(text, n=3){
    n <- ifelse(n < 0, 0, n)
    text <- stripWhitespace(text)
    text <- tolower(text)
    text <- removeNumbers(text)
    text <- removePunctuation(text, preserve_intra_word_dashes = TRUE)
    splitWords <- strsplit(text, " ")[[1]]
    lenSentence <- length(splitWords)
    if (n > 0 && lenSentence > n)
        text <- splitWords[(lenSentence-n+1):lenSentence]
    ifelse(n < 1, "", paste(text, collapse = ' '))
}

getNextWord <- function(text, n=3){
    text <- cleanInputText(text, n)
    n <- length(strsplit(text, " ")[[1]])
    ngramData <- get(paste("data", n+1, "gram", sep = ""))
    if (n > 0){
        predictWord <- as.character(subset(ngramData, preWord == text)$word)
        if (length(predictWord) < 6)
            predictWord <- c(predictWord, getNextWord(text, n-1))
    }
    else{
        predictWord <- ngramData[sample(1:10, 5),]
        predictWord <- predictWord[order(predictWord$freq, decreasing = T), ]
        predictWord <- as.character(predictWord$word)
    }
    head(unique(predictWord), 5)
}

set.seed(12345)
loadData()

