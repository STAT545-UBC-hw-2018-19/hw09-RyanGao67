# load libraries
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(forcats))

# read RDS
gapminder_by_words <- readRDS("./data/maxGDP.rds")

# make plot
plot <- gapminder_by_words %>%
	# show preview of resultant levels
	ggplot(aes(x = max_GDP, y = fct_reorder(country, max_GDP, max), color = country)) + xlab("Maximum GDP") + ylab("country") +
	
	# make it a scatterplot
	geom_point() + 
	
	# add title
	labs(title = "Maximum GDP percap of countries with name length shorter than 5") +
	

# save image
ggsave("./images/maxGDP.png", plot = plot, device = "png")