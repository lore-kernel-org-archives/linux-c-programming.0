From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: how to find the end of piped data?
Date: Tue, 14 Sep 2004 10:10:08 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ci68vo$eu4$1@sea.gmane.org>
References: <41458643.7060907@sit.fraunhofer.de> <200409140106.08674.eric@cisu.net>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Dear Eric,

Here are a few remarks on your email scanner:

- Why do you bother to write matching streams to /dev/null ?
If you mean to discard them, just do that, do not write the stuff anywhere.
You still need to read stdin all the way to EOF in case it is a pipe, or you
will crash the piping program with a broken pipe signal.
If you mean to stash the spam somewhere (a real file), you probably should
append to the 'spampipe' file, not just overwrite it.

- Your do/while loop is really a while loop.  do/while loops are error prone
and should be avoided.  In this example, I would write:

while ((len = read_message(buffer)) > 0) {
    if (!discard)
        write_message(buffer, len, fd);
}

This saves many system calls in case of discarding spam.
It is also one less test on len, and removes a bug opportunity, should you
decide to return negative values for len in read_message.

scan_message should take the buffer as const char * to emphasize the fact
that it doesn't modify it.
Your implementation of scanning for a string in a buffer has a potential
flaw:  when the comparison fails, you restart from the failure point instead
of backtracking by matched characters but one.  This happens to work for
your CHECKSTRING but will fail for certain patterns.  eg:

CHECKSTRING = "ABAC"
buffer contents: "...xABABAC..."  will not match with your scanner.

I suggest you go with a more straightforward method involving memchr and
memcmp.  Both functions are implemented inline and will likely perform even
better than your loop.  Otherwise, look up the Boyer-Moore algorithm for
searching for a pattern in a buffer, and find a good implementation of this
tricky but vastly more efficient method.

Why do you read BUFFERSIZE-1 bytes into the buffer ?  I suspect you used
strstr() in a previous version of this program to scan for the pattern...
How did that perform with the same buffer size ?

Regarding performance, while I agree that handling large buffers at a time
is usually more efficient than using getchar() and relying on stdio
buffering, I have experienced that using a well chosen buffer size is the
key.  A multiple of the file system block size, or of the OS's page size is
a better choice, and care must be taken of keeping I/O aligned on such
boundaries.  So I would suggest you use either 4K or 8K instead of 6143.

Regarding CHECKSTRING starting with \n  :  you definitely want to force the
match at the beginning of a line, and it is very unlikely the spam flag will
have been prepended to the file, so not matching the first line is not a
problem, but should be documented.  The main issue with the way you scan
your emails is that you don't stop at the end of the header section.  This
causes unnecessary scanning of some or all of the message body, and more
importantly causes messages that contain the CHECKSTRING in the body only to
match!

For example, you are searching for the following string:

X-Spam-Flag: YES

Bang! this is a match! A good thing there was more than 6K of headers and
blabber above this line!

Here is my proposal for scan_message:

int scan_message (const char *buffer, int size) {

  const char *spamflag = "X-Spam-Flag: YES";
  int len = strlen(spamflag);
  const char *bufptr, *buflast;

  if (size >= len) {
    bufptr = buffer;
    buflast = buffer + size - len;
    for (;;) {
      // match at the beginning of a header line
      if (!memcmp(bufptr, spamflag, len))
        return EXIT_MATCH;
      bufptr = memchr(bufptr, '\n', buflast - bufptr);
      if (!bufptr)
        break;
      bufptr++;   // skip \n
      if (*bufptr == '\n'
      ||  (*bufptr == '\r' && bufptr[1] == '\n')) {
        break;    // end of email header
      }
    }
  }
  return EXIT_NOMATCH;
}

Cheers,

Chqrlie.

PS: Please do not use tabs in source files, you can indent by 2 spaces if
you want, but do not set tabs to something else than 8 spaces.






