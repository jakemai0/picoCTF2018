#okay so apart from the cool resources to check out, John demonstrated a neat way to grab the flag from
#the site, by making a bash script to filter out the flag from a huge html text file.

#!/bin/bash
curl -s "https://picoctf.com/resources" | grep -oE "picoCTF{.*}"

