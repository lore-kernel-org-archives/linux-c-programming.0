From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: threads and kernel
Date: Sun, 21 Oct 2007 18:36:18 +0100
Message-ID: <18203.36370.698649.822816@cerise.gclements.plus.com>
References: <471B5276.9010800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <471B5276.9010800@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> As I understand it, the kernel is always running

Not in the same sense that a process is "running". Most of the time,
it's "blocked" waiting for some external event to occur and give it
something to do.

> and whenever an app 
> asks for a system resource the kernel does the needful. However, in my 
> process tree I see no process named linux or kernel. I only see the init 
> process at the root of the tree. Does the init process represent the kernel?

No. "init" is /sbin/init. It's a normal process, albeit a fairly
important one.

> When an app does a system call, would some form of IPC between the 
> process of that app and the kernel process (assuming there is one) be 
> involved?

In some ways, a system call is just like a function call. The main
difference is that the kernel code is invoked through a software
interrupt or trap, which causes the code to execute in the kernel's
context rather than the application's context. Apart from having a
completely different memory layout, the kernel code runs with
increased privileges (ring 0 on i386, supervisor mode on 680x0, etc).

If you want to know the details, you'll need to read a reference book
for the particular type of CPU.

> When an application uses a library, the app and the library are 
> processed in DIFFERENT threads in which of the following cases:
> 
> 1. the library is statically linked
> 2. the library is dynamically linked
> 3. the library is loaded using dlopen
> 
> My guess is "none of the above", am I right?

Correct. Many applications don't use threads at all. Even for those
which do, any calls to a library function are executed in the same
thread as the code which call it.

-- 
Glynn Clements <glynn@gclements.plus.com>
