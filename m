From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: how to find the end of piped data?
Date: Tue, 14 Sep 2004 11:03:18 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ci6c3e$mra$1@sea.gmane.org>
References: <41458643.7060907@sit.fraunhofer.de>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Dear Richard,

The C library I/O functions are agnostic about whether stdin data is coming
from a file , a pipeor a character device.
getchar() will return EOF upon end of file, closing of the pipe by the
piping process, or end of stream.

Here is how you should write your scanner:

void scanin()
{
     int c;
     char tmpkey[1024];  /* or whatever size you want */
     int tmpcnt = 0;

    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            tmpkey[tmpcnt] = '\0';
            /* perform whatever treatment you want on a line of input */
            handle_one_line(tmpkey);
            tmpcnt = 0;
       } else {
           if (tmpcnt < (int)sizeof(tmpkey) - 2) {
               rmpkey[tmpcnt++] = c;
           }
       }
}

You can also use fgets() and check for NULL as the indication for end of
stream, but you will get a slightly different behaviour on truncated lines.

Cheers,

Chqrlie.

main(){int
y=0,x;while(y!=6){x=(y==0)?101:((y==1)?45:((y==2)?97:((y==3)?120:((y==4)?101
:10))));putchar(x);y++;}}

You can simplify this further : one liners should be less than 80
characters!

main(){int
y=0;while(++y<7)putchar(y<2?101:y<3?45:y<4?97:y<5?120:y<6?101:10);}

You can reduce this even further ;-)





