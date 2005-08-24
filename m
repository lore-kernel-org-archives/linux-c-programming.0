From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Nanoseconds
Date: Wed, 24 Aug 2005 21:29:55 +0200
Message-ID: <6a00c8d5050824122960395a1a@mail.gmail.com>
References: <20050824_190854_092976.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050824_190854_092976.r_zaca@ig.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

On 8/24/05, r_zaca <r_zaca@ig.com.br> wrote:
>   Hello all,
> 
>   I need a way to get the date of my linux machine in seconds and
> nanoseconds. In seconds I know I can you some of the standards function of
> lib C (that give me the date since the "epoch"), but my problem is to get
> the nanoseconds. I was reading about clock_gettime. It seems to solve my
> problem, but when I try to compile and link it, I get an error message like
> that:
> 
> cc     time.c   -o time
> /tmp/ccOKP0zk.o(.text+0x21): In function `main':
> : undefined reference to `clock_gettime'
> collect2: ld returned 1 exit status
> make: *** [time] Error 1
> 
> I know its a linker error, that is, the linker doesn't not know here to find
> this function.
> Doesn't this function belong to the standard gnu libc?

Yes, all the clock_* functions are in librt (/lib/librt.so.1) which is
part of glibc.  Try linking against librt.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
