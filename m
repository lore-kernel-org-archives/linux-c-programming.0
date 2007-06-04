From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Function pointers to inline functions
Date: Mon, 4 Jun 2007 08:08:58 +0100
Message-ID: <18019.47754.381600.13402@cerise.gclements.plus.com>
References: <4613DBC2.8060708@gmail.com>
	<17939.60731.269679.612012@cerise.gclements.plus.com>
	<46566CC5.6080904@gmail.com>
	<18007.26131.433749.106380@cerise.gclements.plus.com>
	<465C249A.4000007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <465C249A.4000007@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> >> I mean, if I use -fkeep-inline-functions to get the function output in 
> >> the object file, and if the static keyword also meant that the function 
> >> is visible only in the translation unit in which it appears, then 
> >> -fkeep-inline-functions would be rendered useless, 
> 
> ... in the case of static inline functions.

Non-static inline functions are always generated so that they can be
called from other translation units. It's only when a function is both
static and inline that you can (normally) eliminate the function body
altogether.

> Is this correct or no?
> 
> Would a function visible only in its translation unit be accessible from 
> a debugger, as you say?

Yes.

The debugger might still require the function to be in scope (i.e. the
active stack frame must be in the same translation unit) in order to
call it, but that's down to how the debugger resolves symbols which
are entered by the user.

gdb doesn't have this requirement.

> I would test it myself, but I haven't any idea 
> how to load just a single object file in gdb and test it so I am asking.

Add a minimal main.c so that you can run it as a program.

-- 
Glynn Clements <glynn@gclements.plus.com>
