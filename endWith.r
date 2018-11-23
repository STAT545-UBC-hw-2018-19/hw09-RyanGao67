install.packages("tidyverse")
library(tidyverse)
words <- readLines("words.txt")
knitr::opts_chunk$set(echo = TRUE)
install.packages("stringr")
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

Alphabetable = ggplot(alphabetTable, aes(x = letters, y = alphabetCount)) +
  geom_bar(fill = "#0073C2FF", stat = "identity") +
  xlab("Letters") + 
  ylab("Number of Words") + 
  ggtitle("Number of Words End with Each Letter of the Alphabet")

ggsave("./images/reorder_by_fct.png", plot = Alphabetable, device = "png")