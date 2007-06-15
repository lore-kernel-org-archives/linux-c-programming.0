From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: can't understand linking behaviour
Date: Fri, 15 Jun 2007 09:50:58 +0530
Message-ID: <467213AA.5070008@gmail.com>
References: <46599AB7.1010701@gmail.com> <18011.26062.21505.664418@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18011.26062.21505.664418@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Glynn Clements wrote:
> Libraries can have undefined references. Sometimes this is necessary,
> e.g. if the library depends upon a function which is supposed to be
> provided by the executable.

To my mind, in the real world, if a library must access a function that 
the executable provides, it will only be through a function pointer -- 
the library may provide, for e.g. a binary search facility, and the 
program uses this to carry out a binary search on a function in its body.

What real world application would make a library A to call a function 
foo() when foo() is defined in the body of an executable X that itself 
depends on A? If foo() were in a dependency of A, say library B, then it 
can be understood, but to expect the function to come from X is, 
although *theoretically* possible, how practically necessary?

> gcc -o main main.c -L. -Wl,-rpath-link,. -la

On my system doing the same without the -Wl, command seems to produce 
the same effect. However the symbol is still marked undefined by nm, 
even if I have linked it.

>> This seems highly counter-intuitive. Why would the linker require *only* 
>> at *executable* build-time the libraries,
> 
> Why would the linker require all external symbols to be resolved at
> the time the library is built?

If you prove that there is a valid real-life situation where the library 
needs a symbol from an application, then the linker would not require 
all external symbols to be resolved.

Shriramana Sharma.

