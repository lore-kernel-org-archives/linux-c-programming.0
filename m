From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: kernel provided system call is an API?
Date: Mon, 29 Oct 2007 22:11:32 +0000
Message-ID: <18214.23188.191251.453321@cerise.gclements.plus.com>
References: <472214F1.6030907@gmail.com>
	<18210.22198.824183.983353@cerise.gclements.plus.com>
	<47228990.7060007@gmail.com>
	<18210.38260.62084.809463@cerise.gclements.plus.com>
	<d93f04c70710291317g750285adl8ec50f55e589e690@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d93f04c70710291317g750285adl8ec50f55e589e690@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvjunk@gmail.com>
Cc: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>


Hendrik Visage wrote:

> > > >> 1. Can the system calls provided by the kernel be considered an API?
> > > >
> > > > System calls aren't strictly an *application* programming interface.
> > > > Applications are supposed to use the libc functions.
> > >
> > > OK so is it at least a "programming interface"?
> >
> > Yes, although it's intended to be used solely by libc.
> 
> I think the "more correct"(TM) explanation would be that:
> 
>  Each hardware architecture, and OS, will have different methods of
> invoking the actual system call. So from memory Linux and FreeBSD uses
> different methods to initiate a syscall. Althought
> the man read(2) "api" from the libc "user"'s perspective are all the
> same (specified by POSIX etc.) the nitty gritty of getting into the
> kernel differs.

There's slightly more to it than that. Some of the library functions
which interface to system calls do more than just invoke the
corresponding system call. E.g. some functions are overriden in the
pthread library to add cancellation points.

Also, readdir() has historically been a system call. Linux has a
readdir system call, but the readdir() function is built atop the
getdents system call for efficiency (getdents returns multiple entries
at a time, which reduces the number of context switches required to
scan a directory).

-- 
Glynn Clements <glynn@gclements.plus.com>
