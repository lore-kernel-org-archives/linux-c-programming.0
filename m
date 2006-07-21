From: James Colannino <james@colannino.org>
Subject: glibc: realloc(): invalid next size
Date: Thu, 20 Jul 2006 17:10:38 -0700
Message-ID: <44C01B7E.4070308@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hey everyone.  I'm having great difficulty debugging a function of mine 
that adds more memory as needed when reading variable length lines.

When I run the code, it always fails after readline() calls addmemory() 
for the second time (no matter how I change linebuf->buflen, or don't 
change it...) If readline only has to call addmemory() once, no matter 
what the size of memory being passed is, it works.  The following is the 
error I get:

*** glibc detected *** realloc(): invalid next size: 0x0804a170 ***

Frankly, this has me absolutely stumped.  I scoured the code looking for 
things like buffer overruns, etc. and couldn't find a thing.  I'm sure 
there must be something I'm missing, but for the life of me, I can't 
figure it out.  Other than this problem, readline() works great.  Below 
is the code for the two functions (along with the main function that 
initializes the structure used by readline), along with the output of a 
backtrace from gdb.

**********
Backtrace:
**********

(gdb) run
Starting program: 
/home/james/svn/projects/exercises/linux-prog-ptr/03-memory/src/a.out

*** glibc detected *** realloc(): invalid next size: 0x0804a170 ***

Program received signal SIGABRT, Aborted.
0xffffe410 in __kernel_vsyscall ()
(gdb) bt
#0  0xffffe410 in __kernel_vsyscall ()
#1  0xb7df9391 in raise () from /lib/tls/libc.so.6
#2  0xb7dfab27 in abort () from /lib/tls/libc.so.6
#3  0xb7e2c98e in __fsetlocking () from /lib/tls/libc.so.6
#4  0xb7e36666 in mallopt () from /lib/tls/libc.so.6
#5  0xb7e35a89 in mallopt () from /lib/tls/libc.so.6
#6  0xb7e3421c in realloc () from /lib/tls/libc.so.6
#7  0x080486cb in addmemory (linebuf=0xbfa28a30) at 03-01-readline-getc.c:79
#8  0x080485d4 in readline (linebuf=0xbfa28a30) at 03-01-readline-getc.c:30
#9  0x080487f3 in main (argc=2, argv=0xbfa28ad4) at 03-01-test.c:28

**************************
main(), from 03-01-test.c:
**************************

struct line {
    size_t buflen;
    char *buf;
    FILE *fp;
};

int main(int argc, char **argv) {

    struct line linebuf;

    if (argc != 2) {
       fprintf(stderr, "correct usage: %s filename\n", argv[1]);
       exit(EXIT_FAILURE);
    }

    if ((linebuf.fp = fopen(argv[1], "r")) == NULL) {
       fprintf(stderr, "error: couldn't open %s\n", argv[1]);
       exit(EXIT_FAILURE);
    }

    if ((linebuf.buf = (char *)calloc(81, sizeof(char))) == NULL) {
       fprintf(stderr, "error: not enough memory :(\n");
       exit(EXIT_FAILURE);
    }

    linebuf.buflen = sizeof(char) * 81;

    switch(readline(&linebuf)) {
       case  0:
          break;
       case -1:
          printf("EOF!\n");
          break;
       case -2:
          fprintf(stderr, "error: linebuf->fp not opened\n");
          break;
       case -3:
          break;
    }

    printf("string: %s", linebuf.buf);
    return 0;

***************************************************
readline() and addmemory(), from 03-01-readline.c:
***************************************************

/* readline(): reads one single line from linebuf->fp into linebuf->buf.

    The programmer should make sure that buf is malloc'd with an initial
    amount of memory, that the size of that allocation (in bytes) is
    stored in linebuf->buflen and that linebuf->fp points to an open
    file.  If any of these conditions are not met, readline() will fail.

    Return Codes:
       0 - success
      -1 - EOF
      -2 - linebuf->fp not an opened file
      -3 - other error
*/
int readline(struct line *linebuf) {

    char *start;                     /* points to beginning of buffer */
    char *bufpos;                    /* our current position in 
linebuf->buf */

    size_t    buflen;                /* size of buffer in bytes */
    ptrdiff_t bufcount;              /* how many characters we've read 
so far */

    int c;                           /* stores the result of getc(fp) */

    if (linebuf->fp == NULL)         /* linebuf->fp is not an opened file */
       return -2;

    bufpos = start = linebuf->buf;
    buflen = linebuf->buflen;

    while ((c = getc(linebuf->fp)) != EOF) {

       if (buflen <= 2) {            /* need more memory */
          bufcount = bufpos - start;
          printf("hello!\n");
          start = addmemory(linebuf);
          buflen = linebuf->buflen;
          bufpos = start + bufcount;
       }

       *(bufpos++) = c;
       buflen -= 1;

       if (c == '\n') {              /* we're done with one line */
          *bufpos = '\0';
          break;
       }
    }

    if (c == EOF) {

       if (strlen(start) == 0)   /* we got nothing else before EOF */
          return -1;

       else if ( start[strlen(start) - 1] != '\n') {

                if (buflen <= 2) {       /* need more memory */
                   bufcount = bufpos - start;
                   start = addmemory(linebuf);
                   buflen = linebuf->buflen;
                   bufpos = start + bufcount;
                }

                *(bufpos++) = '\n';
                *bufpos = '\0';
       }

       else
          return -1;     /* the line was complete */
    }

    return 0;
}


/* addmemory(): doubles the size of linebuf->buf.  Returns a pointer
    to the newly allocated memory or exits if it fails */
char *addmemory(struct line *linebuf) {

    char *bufcpy = linebuf->buf;

    linebuf->buflen *= 2;
    printf("%ld\n", linebuf->buflen);

    if ((linebuf->buf = (char *)realloc(linebuf->buf, linebuf->buflen)) \
== NULL) {
       free(bufcpy);
       fprintf(stderr, "error: out of memory! :( \n");
       exit(EXIT_FAILURE);
    }

    return linebuf->buf;
}

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"Black holes are where God divided by zero." --Steven Wright
