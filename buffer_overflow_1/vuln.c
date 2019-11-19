#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include "asm.h"

#define BUFSIZE 32
#define FLAGSIZE 64

//so we need to run this win() function on the shell server in order to get the flag
void win() {
  char buf[FLAGSIZE];
  FILE *f = fopen("flag.txt","r");
  if (f == NULL) {
    printf("Flag File is Missing. Problem is Misconfigured, please contact an Admin if you are running this on the shell server.\n");
    exit(0);
  }

  fgets(buf,FLAGSIZE,f);
  printf(buf);
}

void vuln(){
  char buf[BUFSIZE];
  gets(buf); //never use gets() => very dangerous

  printf("Okay, time to return... Fingers Crossed... Jumping to 0x%x\n", get_return_address());//it also will give us the return address here.
}

int main(int argc, char **argv){

  setvbuf(stdout, NULL, _IONBF, 0);
  
  gid_t gid = getegid();
  setresgid(gid, gid, gid);

  puts("Please enter your string: ");
  vuln();
  return 0;
}


//okay so when we try to run it on the server, for a normal, relatively
//short phrase, we got the return address at 0x80486b3
//
//if we try to overflow the program by giving it a huge string of text.
//It will be like: Okay, time to return..Fingers Crossed..jumping to
//0x66666 or something like that.
//What we want is to get the win() function.
//from the shell, if we try to run:
//objdump -D ./vuln | grep 'win'
//we will see that win() is at 080485cb.
//
//now how the fuck can we get there????
//
//
//
