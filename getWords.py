import urllib2

response = urllib2.urlopen("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co")
data = response.read()
with open("./data/words.txt", "w") as f:
    f.write(data)
