From: Eric Bambach <eric@cisu.net>
Subject: Re: how to find the end of piped data?
Date: Tue, 14 Sep 2004 01:06:08 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200409140106.08674.eric@cisu.net>
References: <41458643.7060907@sit.fraunhofer.de>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <41458643.7060907@sit.fraunhofer.de>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Sammet <richard.sammet@sit.fraunhofer.de>
Cc: linux-c-programming@vger.kernel.org

On Monday 13 September 2004 06:36 am, you wrote:
> hey list,
>
> i wrote a small tool which gets data over a pipe from other tools (like:
> cat stuff | mytool).
>
> how can i find the end of this data stream?
>
> at the moment im looking for a newline to see if the input is finished,
> but thats not practicable.
>
> this is the rutine for getting the data:
>
>       75 void scanin()
>       76 {
>       77    int tmpcnt=0;
>       78
>       79    while(sizeof(tmpkey) && tmpkey[tmpcnt-1] != 10)
>       80    {
>       81       tmpkey[tmpcnt]=getchar();
>       82       tmpcnt++;
>       83    }
>       84 }
>
> im looking for a flag like EOF but EndOfStream or something like this? ;)
>
> anybody any idea?

Yea, heres a small program I wrote that works exactly the same way. WIth piped 
data. It just scans STDIN to match to a pattern in the input stream. If it 
finds it, it pipes to /dev/null, if not, it pipes to stdout. Notice the 
read()/write() combo with a buffer. This is MUCH faster than getchar() 
method. Hope it helps.

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define EXIT_NOMATCH 0
#define EXIT_MATCH 1

//Should be large enough to scan most mail messages in one or two passes.
//Performance with 4K buffer is .8s for a 73M message.
//Increasing to 32K only trims it to .6s with an unjustified increase in 
memory use.
//DO NOT SET THIS TOO SMALL. It probably won't catch the spam flag then since 
it only scans the
//first BUFFERSIZE characters read in then fast copies the rest to stdout.
#define BUFFERSIZE 6144

//What we are checking for. must be EXACT. Leave the newline in because it 
protects the offchance that it is in the message body somewhere.
//This way it will only match if its at the beginning of the line.
#define CHECKSTRING "\nX-Spam-Flag: YES"

int main(void);
int dump_full_message();
int write_message(char *buffer,int len,int fd);
int read_message(char *buffer);
int scan_message(char *buffer,int len);

int main(void){
  //Our faithful buffer
  char buffer[BUFFERSIZE];
  //What file should we write to if its spam.
  const char *spampipe = "/dev/null";
  int len,
      fd = STDOUT_FILENO,
      exit_status = EXIT_NOMATCH;
  
  //We only want to scan our message once. Its unlikely there are more than 
4K(BUFFERSIZE)
  //of headers. By scanning once, this lets us trash the rest of the output if 
its spam. Also
  //prevents scanning a huge non-matching mail-message-attachment.
  len = read_message(buffer);
	if (len){
    if( scan_message(buffer,len) == EXIT_MATCH){
      if( (fd = open(spampipe, O_WRONLY)) == -1){
        perror("Cannot open spam pipe...will write to stdout");
        fd = STDOUT_FILENO;
      }
      exit_status= EXIT_MATCH;
    }
  }
 	write_message(buffer,len,fd);

  //Tight read/write for just piping the data. After the first BUFFERSIZE 
characters
  //we should already have what we need and just pass it on in the queue.
  do{
    len = read_message(buffer);
  	if (len){
	  	write_message(buffer,len,fd);
    }
	}while(len > 0);
  close(fd);
  return exit_status;
}

int scan_message(char * buffer,int len){
  char *spamptr,*bufptr;
  int count = 0;
  const char *spamflag = CHECKSTRING;
  spamptr = spamflag;
  bufptr = buffer;
  for(count =0 ; count<len ; count++,bufptr++){
   //Test it
   if (*bufptr != *spamptr)
     spamptr = spamflag;
   if (*bufptr == *spamptr)
     spamptr++;
   //We've hit a match
   if (*spamptr == '\0'){
    return EXIT_MATCH;
   }
  }
 return EXIT_NOMATCH;
}

int read_message(char *buffer){
  int len;
  len = read(STDIN_FILENO,buffer,BUFFERSIZE-1);
  if (len < 0){
    perror("Read Error");
    exit(EXIT_NOMATCH);
  }
  return len;
}

//Works almost like write() except checks for errors.
int write_message(char *buffer,int len,int fd){
  int ret;
  ret = write(fd,buffer,len);
  if (ret < 0){
    perror("Write Error");
    exit(EXIT_NOMATCH);
  }
  return ret;
}

-- 

-EB
