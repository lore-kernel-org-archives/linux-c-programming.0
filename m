From: Eric <eric@cisu.net>
Subject: Re: Beginning programmer + simple program
Date: Sun, 18 Jan 2004 00:54:39 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200401180054.39404.eric@cisu.net>
References: <200401171852.03121.eric@cisu.net> <16393.61626.659377.266758@cerise.nosuchdomain.co.uk> <200401180000.26606.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200401180000.26606.eric@cisu.net>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Sunday 18 January 2004 12:00 am, Eric wrote:
> On Saturday 17 January 2004 08:34 pm, Glynn Clements wrote:
> > Eric wrote:
> > >       I have recently written a program designed to be used in the
> > > qmail mail queue in conjunction with fighting spam. Basically my
> > > program pipes STDIN to STDOUT, but in the process checks to see if a
> > > string is contained in STDIN. If a string is contained in STDIN it will
> > > return 1, else 0. This is important because I will be using the return
> > > value to decide what to do with a mail message. It is used in
> > > conjunction with a message already scanned by spamassasin. (See
> > > spamflag variable)
> > >
> > >       As a begginning programmer I would like some honest comments on
> > > the functionality of this program and its flaws/strengths. I thought
> > > very much about possible error conditions, and I tried very hard to not
> > > abort or quit without trying to pass the message on to stdout, even at
> > > the expense of not checking it anymore. I would like this program to be
> > > reliable above all else as this will be implemented on a site-wise
> > > basis.
> > >
> > >               The program will only be manipulating character data, I
> > > realize it will probably truncate if given binary data, however I am
> > > not worried as even files are sent as MIME characters (right?)
> >
> > The code is 8-bit clean; it won't have any problems with binary data.
>
>  My guess was with the EOF detection and the problems you can encounter
> with binary data.
>
> > >       This program is pretty fast. It parsed a 2.3MB file in about a
> > > second. The implementation should be pretty close to O(1) , probably
> > > slightly more. Since it parsed this pretty fast with very low overhead,
> > > I am not worried about speed, just correctness.
> > >

Here is an update. I am quite pleased with the feedback you have given me and 
how it has improved my program. It scanned a 73MB text file in 7 seconds. I 
would say thats even better! Silly read() code. That was stupid to begin 
with.
	Unfortunatly, I don't believe your code will work for me. I dont want to run 
the risk of overflowing the buffer as I believe you might with your read() 
command. I will be getting an unknown amount of data (possibly file 
attachments) and I dont want to allocate a huge(couple MB) buffer for an 
attachement. I'd rather just pass it along in byte for byte as it comes in.
	Does that sound right? Or am I mis-reading your code. I believe you are 
assuming small text files.
	This is MUCH more readable. I've re-thought my approach and realized I don't 
even need a buffer. This has shortened my code considerably.

BTW, is there a good method for 1-1 copy from STDIN to STDOUT?
time cat < largefile > testfile 
gives me .5s
while my program will find the string in the first few lines but still take 
10s to do essentially the same operation. After finding the string it just 
goes to dump_full_message() which I want to act just like cat in this sense. 

-----Beginning of File----------

#include <stdio.h>
//#include <stdlib.h>

#define EXIT_NOMATCH 0
#define EXIT_MATCH 1
#define BUFFERSIZE 65535
int main();
inline int dump_message(char *message);
inline int dump_full_message(int exit_status);

int main()
{
  char c, *spamptr;
  //What we are checking for. must be EXACT. Leave the newline in because it 
protects the offchance that it is in the message body somewhere.
  //This way it will only match if its at the beginning of the line.
  const char *spamflag = "\nX-Spam-Flag: YES";
  int exit_status =EXIT_NOMATCH;
  spamptr = spamflag;
  //Start copying from stdin
  while( (c = getchar()) != EOF){
    //Test it
    if (c != *spamptr)
      spamptr = spamflag;
    if (c == *spamptr)
      spamptr++;
   //We've matched, so proceed to do a 1-1 copy and exit EXIT_MATCH
    if (*spamptr == '\0'){
      exit_status = EXIT_MATCH;
      dump_full_message(exit_status);
    }
    putchar(c);
  }
  dump_full_message(exit_status);
  return exit_status;
}

inline int dump_full_message(int exit_status){
  char c;
  while( (c = getchar()) != EOF){
    putchar(c);
  }
  exit (exit_status);
}

----------EOF-----------
 
-------------------------
Eric Bambach
Eric at cisu dot net
-------------------------
