From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: NAN and complex.h
Date: Tue, 18 Sep 2007 23:21:32 +0100
Message-ID: <18160.20332.713420.216377@cerise.gclements.plus.com>
References: <12766829.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <12766829.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: TOMAZ <tomas.zajc@gmail.com>
Cc: linux-c-programming@vger.kernel.org


TOMAZ wrote:

> Hi I made a program which basically averages data from a file. The data is
> stored as complex float and I'm reading it with fread with no problem. Some
> data are taged as NAN (at least ENVI, an image procesing soft read these
> values as NAN). If I average the whole data adding a number with a NAN gives
> me a NAN and my whole program fails.
> 
> What I did is the folowing which doesn't seems to work:
> 
> if(cabsf(zhhzhh)!= NAN)
> {
>     printf("%f\n", cabsf(zhhzhh));
> }
> 
> For some reason the test seeams to be positive all the time, I keep printing
> NAN's ("nan" actualy).
> 
> Any idea?

NaN is not equal to anything, including itself.

To test for NaN, use isnan(). If you don't have isnan() (it's C99, not
C89), test whether "x != x" (true for NaN, false for everything else).

-- 
Glynn Clements <glynn@gclements.plus.com>
