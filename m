From: joy <gracecott@sancharnet.in>
Subject: Re: Problem with read() and named pipe (FIFO) (pipe not disk)
Date: Tue, 17 Aug 2004 23:28:15 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <41224737.9010006@sancharnet.in>
References: <20040817105504.31840.qmail@web12706.mail.yahoo.com>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <20040817105504.31840.qmail@web12706.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Hossein Mobahi <hmobahi@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

Hossein Mobahi wrote:

>Hello
>
>The problem is not "\n", but buffered I/O used by
>standard IO library. I head that sometimes "\n"
>flushes the buffer, but it did not (as I am
>experiencing now).
>
>You did not have any problem, because you were
>directly reading from a file. If you were reading from
>STDIN_FILENO, you would not get your characters when
>using "./prg1 | ./prg2" where prg1 is:
>main() { printf("TEST\n"); for (;;); }
>
>and prg2 is:
>main() { read(STDIN_FILENO, buf, 1000); printf
>("%s\n",buf) ; }
>
>The solution that I know is using
>write(STDOUT_FILENO,....) instead of printf because it
>does not buffer. However, I do not have access to the
>source code of prg1, and I must somehow make prg1
>flush its standard I/O buffer from outside.
>
>  
>
The program cannot buffer data for all eternity and must eventually 
write it to the
pipe. So, even if read() blocks because  there is no data available, it 
must return as soon as data
is written. The real-time element will be lost though I doubt it will 
buffer for a long time.
Is this the behavior you are experiencing and is there a problem with this ?

Joy.M.Monteiro
