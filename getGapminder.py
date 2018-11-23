import urllib2

response = urllib2.urlopen("https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv")
data = response.read()
with open("./data/gapminder.tsv", "w") as f:
    f.write(data)
