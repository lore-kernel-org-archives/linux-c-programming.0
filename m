From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Help: need to prevent infinite loop
Date: Wed, 18 Jan 2006 17:33:56 +0100
Message-ID: <6a00c8d50601180833l138ec402xc5dfd121277aad8@mail.gmail.com>
References: <200601171006.36978.samjnaa@gmail.com>
	 <43CC996D.4050100@ajp-services.net>
	 <200601182154.36474.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200601182154.36474.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 1/18/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Tuesday, 17 January 2006 12:44 samaye, Jesse Ruffin alekhiit:
>
> > This inelegant, but satisfactory, method fixes the problem:
> >               fgets(buf,12,stdin);
>
> Thanks for your reply and sorry for the delay in mine.
>
> The suggestion to use fgets reminded me of this gcc-generated warning with
> gets:
>
> samjnaa@linux:~/bin/learning> gcc -Wall -o gets gets.c
> /tmp/ccA8bxgm.o: In function `main':
> gets.c:(.text+0x25): warning: the `gets' function is dangerous and should not
> be used.
>
> Though I did not get such a warning with fgets, I wonder why this function is
> considered dangerous. Could the same problem perhaps apply to fgets too and
> gcc doesn't inform me of it?

Shriramana,

As fgets(3), gets(3) reads into a buffer, but no check for buffer
overrun is performed, which can result in serious bugs. fgets(3) takes
the buffer size as the second argument and no more characters than
specified are written into the buffer.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
