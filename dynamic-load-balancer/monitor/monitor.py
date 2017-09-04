# pip install BeautifulSoup4
# chmod +x add.sh
import urllib2
import subprocess
from bs4 import BeautifulSoup

SESSION_LIMIT = 10;
print "--------- Running Monitor -------------"
while True:
    haproxy_stats = "http://localhost:81/stats"
    page = urllib2.urlopen(haproxy_stats)
    soup = BeautifulSoup(page, "html.parser")
    row = soup.findChildren('tr', class_='backend')[0]
    totalSessionTd = row.findChildren('td')[12]
    totalSession = totalSessionTd.string
    if int(totalSession) > SESSION_LIMIT:
        print "\n>>> Adding New Server..... "
        subprocess.call("./addServer.sh")
        print "\n >>> Server Added!"