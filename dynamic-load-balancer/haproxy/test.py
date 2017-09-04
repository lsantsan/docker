import socket
import os

if os.path.exists("/var/run/haproxy.sock"):
    client = socket.socket( socket.AF_UNIX, socket.SOCK_STREAM )
    print "I'm in"
    client.connect("/var/run/haproxy.sock")
    command_str="show info"
    try:
        print '[debug] executing =>',command_str
        client.send(command_str)
    except Exception, e:
        print str(e)
    client.close()