From: "Lukasz Mielicki" <lukasz.mielicki@tahoe.pl>
Subject: Re: NAN and complex.h
Date: Mon, 24 Sep 2007 08:31:23 +0200
Message-ID: <014001c7fe74$87112e20$2214a8c0@tahoec>
References: <12766829.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-c-programming@vger.kernel.org

> Hi I made a program which basically averages data from a file. The data is
> stored as complex float and I'm reading it with fread with no problem. 
> Some
> data are taged as NAN (at least ENVI, an image procesing soft read these
> values as NAN). If I average the whole data adding a number with a NAN 
> gives
> me a NAN and my whole program fails.
>
> What I did is the folowing which doesn't seems to work:
>
> if(cabsf(zhhzhh)!= NAN)
> {
>    printf("%f\n", cabsf(zhhzhh));
> }
>
> For some reason the test seeams to be positive all the time, I keep 
> printing
> NAN's ("nan" actualy).
>
> Any idea?

use isnan or isfinite to check for wrong values

BX 
