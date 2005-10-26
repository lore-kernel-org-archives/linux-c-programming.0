From: Steve Graegert <graegerts@gmail.com>
Subject: Re: gcc -static -ggdb not working
Date: Wed, 26 Oct 2005 09:31:14 +0200
Message-ID: <6a00c8d50510260031s6aae8f7i5fd327050d284e4d@mail.gmail.com>
References: <435F1695.3050206@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <435F1695.3050206@crearium.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fabio <fabio@crearium.com>
Cc: linux-c-programming@vger.kernel.org

On 10/26/05, fabio <fabio@crearium.com> wrote:
> Hello, I wonder why I cant dbug C programs on Solaris/sparc with gcc:
>
> -bash-3.00$ cat 1.c;\gcc -static -ggdb 1.c -o 1
> main(){
>        printf("hello world\n");
> }
> ld: fatal: library -lc: not found
> ld: fatal: library -lc: not found
> ld: fatal: File processing errors. No output written to 1
> collect2: ld returned 1 exit status

Fabio,

First of all, what's the GCC version and what does your
LD_LIBRARY_PATH and LD_LIBRARY_PATH_64 look like?  Secondly, does it
work without -g or -ggdb options?  Looks like gcc is looking for
64-bit libs in the place where 32-bit libs are usually found.  You may
also want to check where libc.so.1 is located.

	\Steve

PS: Please note, that this is a Linux C programming list.  It's very
likely that input on problems concerning other Unices or Unix-like
OSes will be very reduced.
