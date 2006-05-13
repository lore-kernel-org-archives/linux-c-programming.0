From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Curious segmentation fault - please help
Date: Sat, 13 May 2006 23:04:33 +0200
Message-ID: <6a00c8d50605131404sc845ab7p5604a5e902c5ff55@mail.gmail.com>
References: <200605131958.39156.samjnaa@gmail.com>
	 <200605132157.24997.samjnaa@gmail.com>
	 <6a00c8d50605131020o6665b157u18b72e93cc04411b@mail.gmail.com>
	 <200605140028.17718.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200605140028.17718.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 5/13/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Saturday 13 May 2006 22:50 samaye, Steve Graegert alekhiit:
>
> > > vaasara[6] does give the correct output. The fault is seen *after*
> > > vaasara[6] is read and written to stdout:
> >
> > which accesses the last element correctly.  Nevertheless, the function
> > tries to read one more character causing a segfault.  Please don't
> > misinterpret valgind's output: we are still in listsplpanchaanga().
>
> Of course. But all I am doing is using the standard fprintf function. Is it
> possible that the behaviour of this function would have changed from glibc
> 2.36 to glibc 2.4?

OK, now I got the code.  You're right, it's not as simple as it seemed
at first glance.  Just oversaw some lines of the valgrind output,
showing that accessing element 0 (zero) is indeed failing all the
time.  Sorry, just did not get it at first.

Let's try another thing before filing a bug or something: instruct
valgrind to attach to a debugger when the error occurs:

% valgrind --tool=memcheck --db-attach=yes -v ./monthpan

when entered the debugger call

(gdb) where
... /* stack trace */
(gdb) whatis grahanaama
... /* prints type and size of expression */
(gdb) print grahanaama[0]
... /* should display contents of expression; may result in an error*/

Try to capture the output and mail it to me privately.  You can also
send me the complete program and I'll have a look at it.

If all goes well here, you may have uncovered some weird behaviour
which may indeed be a bug either in glibc or gcc.

> > Hm, don't know what could have changed.  I am not a SuSEr anymore;
> > returned to Debian and NetBSD.
>
> So can't see you anymore on SLE?

Yes, I simply don't have the time to follow SLE discussions anymore.

	\Steve
