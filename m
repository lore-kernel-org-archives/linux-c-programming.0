From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Linux kernel, drivers, shims
Date: Sun, 07 Oct 2007 16:04:02 +0530
Message-ID: <4708B61A.6040003@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Dear list,

Recently I have been looking through some of the Linux kernel - binary 
drivers - GPL issues and came across what people mention about shims -- 
interfaces between GPL-ed kernel and incompatible-licensed-drivers. And 
about the thing where totally independently developed fs-s cannot be 
considered derivative works (at least according to Torvalds).

I am not hacking out the legal parts of GPL (that only apparently leads 
to endless flamewars) but I am asking about the programming part of it.

1)

I don't understand how two separate programs can work in the same memory 
space -- if I have understood properly the part where closed-source 
drivers are "loaded in kernel space" -- if they do not have knowledge of 
how to talk to each other in the level of pushing a set of parameters to 
the stack and making a function call. At that low level, when the fs is 
talking to the kernel, how can it be developed without using the 
kernel's headers?

2)

How is it also possible to just throw in an independently developed fs 
module into the kernel and make it a perfect fit so they communicate 
with each other?

3)

How can a shim be written so as to circumvent legal issues? I mean, a 
shim is as I understand an adapter pattern. You write a wrapper around 
an API of a class or module so that consumers familiar with another API 
can use this class or module.

But such a wrapper would definitely be a derivative work so it would 
have to be under the GPL. And I don't think the author of such a 
derivative work has a right to add exceptions to it to allow 
incompatible modules to link. If that were possible, no GPL-ed interface 
would be safe. One has to just write a GPL+exceptions wrapper.

So how can anyone write a wrapper that is not a derivative work?

*

Can anyone please explain these in simple terms? For the technical 
details of course I can lookup the official API and so on, but I am 
asking for a Wikipedia-style guide to understanding "how to make a 
program talk to another program at the lowest level without making 
either use the other's headers" and so on.

Thanks as always for your patience,

Shriramana Sharma.
