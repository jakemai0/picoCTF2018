#so I thought we would be using steghide to extract the flag
#from the Husky image, but instead, we gotta install zsteg:
#a program that detects stegano-hidden data in PNG and BMP files.

#!/bin/zsh

zsteg husky.png | grep 'picoCTF.*' | cut -d '"' -f2

#flag is picoCTF{r34d1ng_b37w33n_7h3_by73s}
