From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: "double free or corruption" - how to solve this?
Date: Sat, 13 May 2006 00:18:27 +0200
Message-ID: <6a00c8d50605121518v4a01a5dejee034267ead87358@mail.gmail.com>
References: <1DC8E51669ADE94C85B69D0E5EAEB746629B8E@manchester.maxolution.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1DC8E51669ADE94C85B69D0E5EAEB746629B8E@manchester.maxolution.local>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 5/12/06, Jedenastik, G=FCnther <guenther.jedenastik@maxolution.at> w=
rote:
>
> >Hello Shriramana,
>
>
> >On Fri, 12 May 2006 13:41:12 +0530 "Shriramana Sharma" <samjnaa@gmai=
l.com> >wrote:
>
> >> One of my programs, which was working quite well till now, suddenl=
y
> >> gives me the error:
> >>
> >> *** glibc detected *** double free or corruption (top): 0x0808a338=
 ***
> >> Aborted
> >>
> >> It is a pure C program compiled with GCC 4.02 -- I do not understa=
nd
> >> why it does not work suddenly. Please tell me what the above error=
 can
> >> be.
>
> >Would be nice to run it from gdb, in order to get the backtrace when=
 it
> >crashes. This should help you understand where and why :).
>
>
> >Regards,
>
> >--
> >wwp
>
> I have a similar problem, but i don't know how gdb can help with this=
?

Indeed, in this case gdb is more helpful when operating on core dumps.

> I tried with gdb (btw: I have one process forked (and a few threads) =
and I think this process creates the problem) but I only get the proble=
m during exit handlers (e.g. SIGINT)
>

gdb has excellent thread debugging facilities; you should have no
problem to switch between threads (see "thread", "info threads" and
"threads apply" commands) and attaching to child processes.

> To get back to my question: how can I trace the problem with gdb, if =
I have forked processes and threads?
>
> Cause it seems, that glibc only prints the line "*** glibc detected *=
** double free or corruption" and then continues

By default, the offending program is killed by emitting SIGABRT.  A
core dump is generated only if the system is configured to do so (see
ulimit -c and use a reasonably large value).  Nevertheless, the
program you want to get a core dump from should intercept SIGABRT and
if you can't set the limits beforehand, you might be able to attach
with gdb, use setrlimit to eliminate the coredump restriction and then
send an ABRT.

> It doesn't send a SIGABORT or something else, so why should gdb "know=
" something was wrong? And how could I trace back (using "bt") if I hav=
e the problem, but don't know where it occures (cause glibc just prints=
 and continues, not?)

No, it actually should not.  See if the environment variable
MALLOC_CHECK_ is not to 0 (zero).

> But some internal explanations what "*** glibc detected ***" does (no=
t why it occures, but internally happens if it occures), if anyone know=
s, would be great

This output is the result of some sanity checks of glibc that can be
configured by setting MALLOC_CHECK_ to values between 1 and 3, while 0
turns checks off, thus not printing a message and not killing the
program.

Bye

	\Steve
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
