From: Steve Graegert <graegerts@gmail.com>
Subject: Re: How to use /dev/random
Date: Thu, 22 Sep 2005 11:53:43 +0200
Message-ID: <6a00c8d5050922025348a449a5@mail.gmail.com>
References: <200509221111.07711.hitoc_mail@yahoo.it>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200509221111.07711.hitoc_mail@yahoo.it>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: HIToC <hitoc_mail@yahoo.it>
Cc: linux-c-programming@vger.kernel.org

On 9/22/05, HIToC <hitoc_mail@yahoo.it> wrote:
> Hello list!
>         Is there anyone who can explain how to use /dev/random in
> order to obtain random numbers?

There are two types:

1. /dev/random generates high quality entropy.  It's relatively slow
since it uses other information like mouse clicks, key strokes and
interrupt times to produce random numbers.  For this reason, some
applications can block for some time when reading from /dev/random.

2. /dev/urandom is much faster with lower quality sequences of random
numbers but it should be sufficient for most applications.

> I don't know if this is the best manner whitin the Linux Kernel to
> generate random numbers, but if someone has better ideas, they
> will be greatly appreciated.

You can read from /dev/(u)random using the read system call:

        int randnum, fd;

        if ((fd  = open ("/dev/urandom", O_RDONLY)) != -1) {
            read(fd, &randnum, 4 );
            /* call abs() to produces positives */
            printf("random number read : %d\n",randnum);
            close(fd);
         }

You can also read a number of random bytes from /dev/(u)random with dd:

        dd if=/dev/urandom of=/tmp/randnums bs=1 count=500

This reads a sequence of 500 bytes from /dev/urandom and writes them
to /tmp/randnums.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
