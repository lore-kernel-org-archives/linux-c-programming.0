From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Beginning programmer + simple program
Date: Sun, 18 Jan 2004 02:34:34 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16393.61626.659377.266758@cerise.nosuchdomain.co.uk>
References: <200401171852.03121.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200401171852.03121.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric <eric@cisu.net>
Cc: linux-c-programming@vger.kernel.org


Eric wrote:

>       I have recently written a program designed to be used in the qmail mail queue 
> in conjunction with fighting spam. Basically my program pipes STDIN to 
> STDOUT, but in the process checks to see if a string is contained in STDIN. 
> If a string is contained in STDIN it will return 1, else 0. This is important 
> because I will be using the return value to decide what to do with a mail 
> message. It is used in conjunction with a message already scanned by 
> spamassasin. (See spamflag variable)

>       As a begginning programmer I would like some honest comments on the 
> functionality of this program and its flaws/strengths. I thought very much 
> about possible error conditions, and I tried very hard to not abort or quit 
> without trying to pass the message on to stdout, even at the expense of not 
> checking it anymore. I would like this program to be reliable above all else 
> as this will be implemented on a site-wise basis. 

>               The program will only be manipulating character data, I realize it will 
> probably truncate if given binary data, however I am not worried as even 
> files are sent as MIME characters (right?)

The code is 8-bit clean; it won't have any problems with binary data.

>       This program is pretty fast. It parsed a 2.3MB file in about a second. The 
> implementation should be pretty close to O(1) , probably slightly more. Since 
> it parsed this pretty fast with very low overhead, I am not worried about 
> speed, just correctness.

> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #define EXIT_NOMATCH 0
> #define EXIT_MATCH 1
> #define BUFFERSIZE 65535
> int main();
> inline int dump_message(char *message);
> inline int dump_full_message();
> 
> int main()
> {
>   //Make a buffer for holding the message and related position pointers
>   char *message, *msgptr, *spamptr;
>   //What we are checking for. must be EXACT
>   char *spamflag = "X-Spam-Flag: YES";

This should be:

	const char *spamflag = "X-Spam-Flag: YES";
or:
	const char spamflag[] = "X-Spam-Flag: YES";

if you don't need to modify it, or:

	char spamflag[] = "X-Spam-Flag: YES";

if you do.

By default, gcc stores string literals in the .rodata segment, so
pointers to string literals should be declared "const char *".

>   int ret = 0;
>   int exit_status = 0;
>   exit_status= EXIT_NOMATCH;

>   //Set up the buffer. Just do a 1-1 copy if we cant allocate memory
>   if ( (message = (char *)malloc(sizeof(char)*BUFFERSIZE)) == NULL )

sizeof(char) is always 1, so it can be omitted. Also, malloc() returns
"void*", which doesn't require an explicit cast.

Also, I don't see any point in using malloc() rather than just an
array declaration, i.e.

	char message[BUFFERSIZE];

>     dump_full_message(exit_status);
>   //Set up ptr positions
>   msgptr = message;
>   spamptr = spamflag;
>   //Null terminate the buffer.
>   msgptr += BUFFERSIZE;
>   *msgptr = '\0';

This is writing outside the allocated block. If you allocate
BUFFERSIZE bytes, valid indices are 0 to BUFFERSIZE-1 inclusive.

>   msgptr = message;
>   //Start copying from stdin
>   do{
>     //We have a match!
>     if ( *spamptr == '\0' ){
>       exit_status = EXIT_MATCH;
>       *msgptr='\0';
>       dump_message(message);
>       dump_full_message(exit_status);
>     }
>     ret = read(STDIN_FILENO, msgptr, 1);

Reading individual bytes with read() will seriously reduce
performance. Better to use getc() or, better still, getc_unlocked()
(which is a macro).

Either that, or read() large blocks.

Apart from that, I find your algorithm is quite hard to read. Here's
how I would have written it:

	static int writen(int fd, const char *buf, int count)
	{
		while (count > 0)
		{
			int n = write(fd, buf, count);
			if (n < 0)
				return -1;

			buf += n;
			count -= n;
		}

		return 0;
	}


	static int scan_message(const char *spamflag)
	{
		const char *spamptr = spamflag;
		int found = 0;

		for (;;)
		{
			char buf[BUFFERSIZE];
			int count = read(STDIN_FILENO, buf, sizeof(buf));
			int i;
	
			if (count < 0)
			{
				perror("read");
				exit(1);
			}
	
			if (!count)
				break;
	
			if (!found)
				for (i = 0; i < count; i++)
				{
					if (buf[i] == *spamptr)
						spamptr++;
					else
						spamptr = spamflag;
	
					if (*spamptr == '\0')
					{
						found = 1;
						break;
					}
				}
	
			if (writen(STDOUT_FILENO, buf, count) < 0)
			{
				perror("writen");
				exit(1);
			}
		}
	
		return found;
	}

	int main(void)
	{
		return scan_message("X-Spam-Flag: YES");
	}

In most cases, if you can't understand the code without comments, you
should re-write the code.

A few other points:

1. There is a bug in the algorithm: it won't find the search string if
it is prefixed by a prefix of the search string, e.g. it won't find
"X-X-Spam-Flag: YES". When a non-matching character is found, it
resets spamptr to the beginning of spamflag and *doesn't* check for a
match. To fix it, change:

	if (buf[i] == *spamptr)
		spamptr++;
	else
		spamptr = spamflag;

to:
	if (buf[i] != *spamptr)
		spamptr = spamflag;
	if (buf[i] == *spamptr)
		spamptr++;


2. I'm guessing that you only really want to find that string if it
occurs at the beginning of a line, and probably only within the
headers and not the message body. You can fudge the first issue by
searching for "\nX-Spam-Flag: YES". The second issue involves keeping
track of whether you are reading the headers or the body, which
relates to point 3.

3. As soon as the task becomes more complex than searching for a
single fixed string at any point in the stream, you would be better
off using a finite automaton (i.e. using (f)lex rather than coding
directly in C).

-- 
Glynn Clements <glynn.clements@virgin.net>
