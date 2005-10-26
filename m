From: Henry Margies <henry.margies@gmx.de>
Subject: Re: setenv and dlopen
Date: Wed, 26 Oct 2005 10:21:44 +0200
Message-ID: <1130314904.6680.3.camel@localhost.localdomain>
References: <1130262724.7414.14.camel@localhost.localdomain>
	 <20051025182007.GC6673@opaque.pepe>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20051025182007.GC6673@opaque.pepe>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi Christoph,

thank you for you answer.

> I think this is because putenv does not really modify your process'es
> environment (which is not possible afaik), but rather remembers the
> given variable until you call some exec* function.  libc will then pass
> the new environment to execve so that the new program will have the
> modified environment.

Well, depends on the point of view. For the user-space processes side
the environment values are all stored in char **environ and I can
remove, add and change values. But you are right, the kernel also holds
the original values I cannot change (which are shown
in /proc/PID/environ).

So it seems like execlp uses the local values from char **environ
(because it reads my PATH value) as dlopen uses the kernel version of
the environment variables (and do not know about my changes to
LD_LIBARAY_PATH).

Maybe dlopen runs far beyond my local processes scope and has no access
to my local environment or it just don't care about :-)

Any solutions to tell dlopen within my c program to search also in my
paths? 


Greetings,

Henry

-- 
Hi! I'm a .signature virus! Copy me into your
~/.signature to help me spread!




-- 
Hi! I'm a .signature virus! Copy me into your
~/.signature to help me spread!

