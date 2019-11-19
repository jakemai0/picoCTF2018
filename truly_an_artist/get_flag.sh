#!/bin/zsh


#Ok so there's this PNG file, pretty standard. We gotta find the flag in this, one thing we can do is simply use
#'strings' commmand. We could, but another cool way to know is by using 'exiftool'.

#Bascially it allows us to read and write metadata in files.
#Metadata is data about data, like author, date created, file size, etc. Those sort of stuff are metadata.

exiftool 2018.png | grep 'picoCTF.*' | cut -d ":" -f2

#flag is the artist of the file: picoCTF{look_in_image_eeea129e} 
