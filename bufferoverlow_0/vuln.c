#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>

#define FLAGSIZE_MAX 64

char flag[FLAGSIZE_MAX];

void sigsegv_handler(int sig) {
  fprintf(stderr, "%s\n", flag);
  fflush(stderr);
  exit(1);
}

void vuln(char *input){
  char buf[16];
  strcpy(buf, input);
}
//this function needs 1 argument (16 characters, then copy it to buf.

//main function
int main(int argc, char **argv){
  
  FILE *f = fopen("flag.txt","r");
  if (f == NULL) {
    printf("Flag File is Missing. Problem is Misconfigured, please contact an Admin if you are running this on the shell server.\n");
    exit(0);
    //if we run vuln on our local machine, this will pop up, since we dont have the flag.txt file, gotta do this on pico server.
  }
  fgets(flag,FLAGSIZE_MAX,f); //read
  signal(SIGSEGV, sigsegv_handler); //set up a signal?
  
  gid_t gid = getegid();
  setresgid(gid, gid, gid);
  
  if (argc > 1) {
    vuln(argv[1]);
    printf("Thanks! Received: %s", argv[1]);
  //if we have an argument, it will pass it to the vuln(argv[1]) function
  }
  else
    printf("This program takes 1 argument.\n");
  return 0;
}
