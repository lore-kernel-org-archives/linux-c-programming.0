From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Linux kernel, drivers, shims
Date: Sun, 7 Oct 2007 15:12:31 +0100
Message-ID: <18184.59727.771467.997540@cerise.gclements.plus.com>
References: <4708B61A.6040003@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4708B61A.6040003@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> Recently I have been looking through some of the Linux kernel - binary 
> drivers - GPL issues and came across what people mention about shims -- 
> interfaces between GPL-ed kernel and incompatible-licensed-drivers. And 
> about the thing where totally independently developed fs-s cannot be 
> considered derivative works (at least according to Torvalds).
> 
> I am not hacking out the legal parts of GPL (that only apparently leads 
> to endless flamewars) but I am asking about the programming part of it.
> 
> 1)
> 
> I don't understand how two separate programs can work in the same memory 
> space -- if I have understood properly the part where closed-source 
> drivers are "loaded in kernel space" -- if they do not have knowledge of 
> how to talk to each other in the level of pushing a set of parameters to 
> the stack and making a function call. At that low level, when the fs is 
> talking to the kernel, how can it be developed without using the 
> kernel's headers?
> 
> 2)
> 
> How is it also possible to just throw in an independently developed fs 
> module into the kernel and make it a perfect fit so they communicate 
> with each other?
> 
> 3)
> 
> How can a shim be written so as to circumvent legal issues? I mean, a 
> shim is as I understand an adapter pattern. You write a wrapper around 
> an API of a class or module so that consumers familiar with another API 
> can use this class or module.
> 
> But such a wrapper would definitely be a derivative work so it would 
> have to be under the GPL. And I don't think the author of such a 
> derivative work has a right to add exceptions to it to allow 
> incompatible modules to link. If that were possible, no GPL-ed interface 
> would be safe. One has to just write a GPL+exceptions wrapper.
> 
> So how can anyone write a wrapper that is not a derivative work?

Write your own headers which are compatible with the kernel. These
will look almost identical to the kernel headers (or, at least, to
portions of them), but that doesn't make them copies or derivative
works.

E.g. many of the Linux headers will look very similar to the same
headers on Solaris or AIX, because they are all implementing the same
interface (POSIX/XPG/SUS).

-- 
Glynn Clements <glynn@gclements.plus.com>
