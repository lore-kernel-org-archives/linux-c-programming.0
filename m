From: Eric <eric@cisu.net>
Subject: Beginning programmer + simple program
Date: Sat, 17 Jan 2004 18:52:03 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200401171852.03121.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,
	I have recently written a program designed to be used in the qmail mail queue 
in conjunction with fighting spam. Basically my program pipes STDIN to 
STDOUT, but in the process checks to see if a string is contained in STDIN. 
If a string is contained in STDIN it will return 1, else 0. This is important 
because I will be using the return value to decide what to do with a mail 
message. It is used in conjunction with a message already scanned by 
spamassasin. (See spamflag variable)
 	As a begginning programmer I would like some honest comments on the 
functionality of this program and its flaws/strengths. I thought very much 
about possible error conditions, and I tried very hard to not abort or quit 
without trying to pass the message on to stdout, even at the expense of not 
checking it anymore. I would like this program to be reliable above all else 
as this will be implemented on a site-wise basis. 
		The program will only be manipulating character data, I realize it will 
probably truncate if given binary data, however I am not worried as even 
files are sent as MIME characters (right?)
	This program is pretty fast. It parsed a 2.3MB file in about a second. The 
implementation should be pretty close to O(1) , probably slightly more. Since 
it parsed this pretty fast with very low overhead, I am not worried about 
speed, just correctness.

*Legal disclaimer*
This program is copyright ME. No distribution or modification unless otherwise 
specified by me, Eric Bambach. No guarantees it wont erase your hard drive, 
drink your beer, or kick your cat. Read it over before you compile it. 
*Legal disclaimer*

-------------Start of File------------

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define EXIT_NOMATCH 0
#define EXIT_MATCH 1
#define BUFFERSIZE 65535
int main();
inline int dump_message(char *message);
inline int dump_full_message();

int main()
{
  //Make a buffer for holding the message and related position pointers
  char *message, *msgptr, *spamptr;
  //What we are checking for. must be EXACT
  char *spamflag = "X-Spam-Flag: YES";
  int ret = 0;
  int exit_status = 0;
  exit_status= EXIT_NOMATCH;
  //Set up the buffer. Just do a 1-1 copy if we cant allocate memory
  if ( (message = (char *)malloc(sizeof(char)*BUFFERSIZE)) == NULL )
    dump_full_message(exit_status);
  //Set up ptr positions
  msgptr = message;
  spamptr = spamflag;
  //Null terminate the buffer.
  msgptr += BUFFERSIZE;
  *msgptr = '\0';
  msgptr = message;
  //Start copying from stdin
  do{
    //We have a match!
    if ( *spamptr == '\0' ){
      exit_status = EXIT_MATCH;
      *msgptr='\0';
      dump_message(message);
      dump_full_message(exit_status);
    }
    ret = read(STDIN_FILENO, msgptr, 1);
    //Read has returned an error....dump what we have.
    if (ret == -1){
      dump_message(message);
    }
    if (*spamptr == *msgptr)
      spamptr++;
    else
       //Start checking from the beginning.
      spamptr = spamflag;
     //Avoid an off by one error when ret = 0 and we havent actually read a 
character.
    if (ret){
      msgptr++;
    }
     //Flush the buffer so we dont overrun it. Next start filling the buffer 
from the beggining again.
    if (*msgptr == '\0'){
      dump_message(message);
      msgptr = message;
    }
  }while (ret != 0);

  //Terminate whatever is left in the buffer, it might not be full then flush 
whatever is remaining
  *msgptr = '\0';
  dump_message(message); 
  return exit_status;
}

//Dumps the current buffer to stdout in case of problems.
//Even if we run out of memory we should still be able to dump what we have.
// Also acts as a buffer flush.
inline int dump_message(char *message){
  char *msgptr;
  msgptr = message;
  while (*msgptr != '\0'){
    putchar(*msgptr);
   msgptr++;
  }
  return 0;
}

//Just do a 1-1 copy to stdout.
inline int dump_full_message(int exit_status){
  char c;
  while ((c = getchar()) != EOF)
      putchar(c);
  exit (exit_status);
}

---------EOF---------------

-------------------------
Eric Bambach
Eric at cisu dot net
-------------------------
