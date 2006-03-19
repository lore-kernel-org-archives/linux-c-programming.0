From: "ab" <abulfazl@juniv.edu>
Subject: Re: const int f() and int f() const
Date: Sun, 19 Mar 2006 22:54:53 +0600
Message-ID: <000f01c64b76$03558c00$fe01a8c0@g>
References: <200603192048.08780.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>


> Suppose there is a function f() which returns an integer and does not
change
> any value of the class it belongs to, should I declare it as:
>
> const int f();
>
> or
>
> int f() const;

This one.

> What is the difference? Thank you.

The first one returns a 'const int.'
The second one is an immutable function.


