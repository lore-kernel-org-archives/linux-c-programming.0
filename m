From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: const int f() and int f() const
Date: Sun, 19 Mar 2006 12:30:36 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0603191229090.4791@localhost.localdomain>
References: <200603192048.08780.samjnaa@gmail.com> <000f01c64b76$03558c00$fe01a8c0@g>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000f01c64b76$03558c00$fe01a8c0@g>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ab <abulfazl@juniv.edu>
Cc: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>

On Sun, 19 Mar 2006, ab wrote:

>
> > Suppose there is a function f() which returns an integer and does not
> change
> > any value of the class it belongs to, should I declare it as:
> >
> > const int f();
> >
> > or
> >
> > int f() const;
>
> This one.
>
> > What is the difference? Thank you.
>
> The first one returns a 'const int.'

could you give an example where using that first declaration would
actually make a difference, given C's parameter-passing mechanism?
thanks.

rday
