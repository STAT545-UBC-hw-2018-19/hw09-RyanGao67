# load libraries

suppressPackageStartupMessages(library(tidyverse))
gapminder <- read.table(file = './data/gapminder.tsv', sep = '\t', header = TRUE)


words <- readLines("./data/words.txt") %>% 
	as.data.frame()
names(words) <- c("Words")
a  = words[words$Words, ]
b = vector()

for(i in a){
	if(nchar(i)<=5){
		b = c(b,i)
	}
}


gapminder_by_words <- gapminder %>% 
	filter(country %in% b) %>% 
	group_by(country) %>% 
	summarise(
		max_GDP = max(gdpPercap)
	)

# save modified dataframe as RDS
saveRDS(gapminder_by_words, "./data/maxGDP.rds")

