From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Compiling the NIST Time Client
Date: Sat, 18 Feb 2006 11:20:52 +0100
Message-ID: <6a00c8d50602180220k5e1075f7ge6f2868034d05ced@mail.gmail.com>
References: <200602170800.59429.samjnaa@gmail.com>
	 <200602170803.17816.techlist@pathfinder.phys.utk.edu>
	 <200602181040.20766.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602181040.20766.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 2/18/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Friday, 17 February 2006 18:33 samaye, Reuben D. Budiardja alekhiit:
>
> > exit() takes one argument. exit() is not the same as return. 'man 3 exit'
> > for details.
>
> All I can see is that exit mandatorily takes an argument whereas if return is
> not given an argument the return status is that of the last command executed
> in the function body.
>
> Further, exit is a function whereas return is a statement, not that that
> really makes much of a difference (does it?).

return and exit(3) have completely different effects on program
execution.  While return simply returns from a function call, exit(3)
does not return.  If return is called from within main, the process is
terminated with the given return code.  If its called from within
another function return causes the process to return control of
execution to the function that called it in the first place.  exit(3)
causes the kernel to terminate the process sending SIGCHLD to the
parent and allowing the parent to fetch the child's exit status with
wait(2) or waitpid(2).

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
