#this is pretty crazy, I mean its simple to do things with a mouse, but
#using a command line, woah. So we sorta kinda got the flag through site
#inspection, but pieces of them only, and on different lines, and in reserve order.

#so, in a nutshell:
curl -s 2018shell.picoctf.com:55790 | head -n 20 |cut -d "'" -f2 | tail -n 8 | tac | tr -d "\n"
#so you curl it to get the source code,
#head -n 20 to grab the first 20 lines
#i dont fully undertstand how this cut -d thing works
#then you tail -n 8 to grab the last 8 lines
#tac it to reverse the order
#and then tr -d "\n" it to delete the new lines.


#flag is picoCTF{client_is_bad_3bd366}
