From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: Re: Problem with read() and named pipe (FIFO) (pipe not disk)
Date: Tue, 17 Aug 2004 03:55:04 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040817105504.31840.qmail@web12706.mail.yahoo.com>
References: <412179C2.5010003@sancharnet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <412179C2.5010003@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

The problem is not "\n", but buffered I/O used by
standard IO library. I head that sometimes "\n"
flushes the buffer, but it did not (as I am
experiencing now).

You did not have any problem, because you were
directly reading from a file. If you were reading from
STDIN_FILENO, you would not get your characters when
using "./prg1 | ./prg2" where prg1 is:
main() { printf("TEST\n"); for (;;); }

and prg2 is:
main() { read(STDIN_FILENO, buf, 1000); printf
("%s\n",buf) ; }

The solution that I know is using
write(STDOUT_FILENO,....) instead of printf because it
does not buffer. However, I do not have access to the
source code of prg1, and I must somehow make prg1
flush its standard I/O buffer from outside.

--Hossein

--- joy <gracecott@sancharnet.in> wrote:

> Funny. I have used read() to get 2 characters out of
> a binary file with 
> no "\n"'s
> and it never behaved like this. Also the man page
> make sno mention of 
> this either.
> Did you try this out? How about fread/fwrite?



		
__________________________________
Do you Yahoo!?
Read only the mail you want - Yahoo! Mail SpamGuard.
http://promotions.yahoo.com/new_mail 
