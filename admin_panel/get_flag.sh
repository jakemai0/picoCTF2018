#pcap files: packet captured
#we need to use wireshark in order to play with this kind of files,
#unfortunately I've only used wireshark only like once ever, so yeah.

#Anyway, we need to open pcap with wireshark, follow TCP streams of
#the POST login requests, and the flag should be revealed.

#However, these are all HTTP request(green), not HTTPS, so nothing is encrypted!
#flag, passwords and things are all in plaintext.

#Because of this, we can simple do
#strings pcap and grep the flag.

strings data.pcap | grep 'picoCTF.*' | cut -d "=" -f3

#NOTE:strings is very quick for simple inspection and analysis, make sure to use it before
#digging deep

