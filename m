From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: -ffunction-sections -Wl,--gc-sections trick and class members
Date: Thu, 19 Apr 2007 16:13:53 +0100
Message-ID: <17959.34609.888091.432080@cerise.gclements.plus.com>
References: <46277EF0.900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46277EF0.900@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> I learnt from the good people on this list that usage of:
> 
> -fdata-sections -ffunction-sections -Wl,--gc-sections
> 
> will ensure that only those sections of object modules get linked to the 
> target which are actually used in the target.
> 
> Recently I was musing on whether I can use this when I recompile the Qt 
> 4 libraries for static linking. But the thing is that the Qt libraries 
> are already very optimized in this aspect -- in that there is a separate 
> source file per class and consequently a separate object file per class.
> 
> However I was wondering whether even then I could do my 
> hyper-optimization because I will be using only a small number of 
> functions in each class. It is highly unlikely that I (or anyone else) 
> is going to use all member functions of a class.
> 
> Then I thought how I could possibly prevent linking a function which was 
> part of a class definition. To my understanding at runtime whenever a 
> class is loaded into memory (I'm not talking about the individual 
> instances) its members including functions are all loaded into memory. 
> If a particular function is not present for loading, wouldn't that be a 
> fatal error?
> 
> So the long and short of it is, are these options useful to filter out 
> unused class members or not?

Possibly. C++ methods aren't really any different from C functions in
terms of object code, so it's conceivable that they could be omitted
if the aren't used.

OTOH, I suspect that virtual methods are always "used" when
intialising the virtual method table, so it's less likely that they
could be omitted.

If you want a definite answer, test it.

-- 
Glynn Clements <glynn@gclements.plus.com>
