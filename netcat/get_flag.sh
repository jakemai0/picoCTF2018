#first time using netcat, so apparently it is a must-know tool used 
#to open connections, send packets, listen on ports, port scanning.
#command to get this flag:

#!/bin/bash
nc 2018shell.picoctf.com 36356 | tail -n 1
#connect to the '2018shell.picoctf.com' host at this port '36356'

