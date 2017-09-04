# pip install BeautifulSoup4
# chmod +x add.sh
import urllib2
import subprocess
from bs4 import BeautifulSoup

sessionLimit = 10;
INCREASE_FACTOR = 5;
print "Running Monitor..."
while True:
    haproxy_stats = "http://10.0.6.4:81/stats"
    page = urllib2.urlopen(haproxy_stats)
    soup = BeautifulSoup(page, "html.parser")
    row = soup.findChildren('tr', class_='backend')[0]
    totalSessionTd = row.findChildren('td')[12]
    totalSession = totalSessionTd.string
    if int(totalSession) > sessionLimit:
        newLimit = sessionLimit + INCREASE_FACTOR
        print "Increasing session limit from " + str(sessionLimit) + " to " + str(newLimit)
        sessionLimit = newLimit
        subprocess.call("./add.sh")