From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: stack -> PROT_EXEC/why?
Date: Mon, 5 Aug 2002 12:10:03 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15694.23819.46199.920521@cerise.nosuchdomain.co.uk>
References: <sqby9bmnlpi.wl@nue.mac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <sqby9bmnlpi.wl@nue.mac.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kkonaka@mac.com
Cc: linux-c-programming@vger.kernel.org


kkonaka@mac.com wrote:

> casually looking at files like this:
> glibc-2.2.3/linuxthreads/manager.c
>  |       res_addr = mmap(map_addr, stacksize + guardsize,
>  | 		      PROT_READ | PROT_WRITE | PROT_EXEC,
>  | 		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  it appears PROT_EXEC is also given to the per thread
> stack(?) pages -- why is it the case?
> 
>  that is - if we
> consider things like buffer overflow (security)
> problems, isn't it better not give PROT_EXEC unless
> abslutely necessary? [so -- maybe there *is* some
> absolute necessity I'm not aware of,... :(]

It is sometimes necessary to execute dynamically generated code which
is placed on the stack. The most common cases are in handling signals,
in a technique called a "trampoline" (this is mentioned in the gcc
Info file), and some emulators (e.g. Executor, the Mac emulator).

>  (stepping back) is PROT_EXEC also given to ordinally
> stack segment of single threaded programs?

Yes. There is a patch available to change this, but in the standard
kernel, the primary stack is executable.

> was there any API to retrieve page protection bits given only
> arbitrary VM addresses?

It isn't portable, but you can get this information from
/proc/<pid>/maps.

-- 
Glynn Clements <glynn.clements@virgin.net>
