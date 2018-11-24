all: final.html

clean:
	rm -rf ./data/
	rm -rf ./images/
	rm -rf ./doc/
	
clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html

final.html: final.Rmd histogram.tsv histogram.png ./images/endWith.png ./data/maxGDP.rds ./images/maxGDP.png
	Rscript -e 'rmarkdown::render("$<")'

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

histogram.tsv: histogram.r ./data/words.txt
	Rscript $<

	
./data/words.txt: ./src/python/download_words.py
	mkdir -p ./data/
	python $<
	

# download gapminder
./data/gapminder.tsv: ./src/python/download_gapminder.py
	mkdir -p ./data/
	python $<

./images/endWith.png: ./endWith.r ./data/words.txt 
  Rscript $<
  
  
./data/maxGDP.rds: ./findcountry.R ./data/gapminder.tsv
  Rscript $<


./images/maxGDP.png: ./showPic.R ./data/maxGDP.rds
  Rscript $<
  

