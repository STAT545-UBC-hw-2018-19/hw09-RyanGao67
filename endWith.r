library(tidyverse)
words <- readLines("./data/words.txt")
knitr::opts_chunk$set(echo = TRUE)
library(stringr)
a = paste("This_", letters, sep="")


orig = vector()

for(i in letters){
	patternn = paste(i,"$",sep="")
	print(patternn)
	print(length(str_subset(words, pattern = patternn)))
	orig = c(orig, length(str_subset(words, patternn)))
}

alphabetTable <- data.frame(letters,orig)

Alphabetable = ggplot(alphabetTable, aes(x = letters, y = orig)) +
  geom_bar(fill = "pink", stat = "identity") +
  xlab("Letters") + 
  ylab("Number of Words") + 
  ggtitle("Number of Words End with Each Letter of the Alphabet")

ggsave("./images/endWith.png", plot = Alphabetable, device = "png")