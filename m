From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: Pointers to int
Date: Fri, 28 Oct 2005 18:05:30 +0200
Message-ID: <20051028160530.GE6673@opaque.pepe>
References: <4362255E.90303@racsa.co.cr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4362255E.90303@racsa.co.cr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabio Andres Miranda <fabiomiranda@racsa.co.cr>, linux-c-programming@vger.kernel.org

On Fri, Oct 28, 2005 at 07:19:26AM -0600, Fabio Andres Miranda wrote:
> Can anyone explain to the list how this pointers to int work:
>    int *p;
>    p = (int *)(array);
>    for (i = 0; i < arraysize - 1; i += 4)
>        *p++ = j - 8;
>    *p = 0x0;
> 
> P is defined as a pointer to a int. Then, it points to (the beginning ? 
> ) a char array.
> What is the result of perform the instruction: *p++; ?

As postincrement (++) has higher priority than dereference (*), p++ is
what will be evaluated first.  So p will be incremented by the size of
an integer (probably 4).  After that, p will point to the second integer
of the array, i. e. array[1].  Now you use * to access that very
location and store j-8 there.

HTH,
Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
