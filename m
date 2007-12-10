From: Yi Wang <yi.w@live.com>
Subject: RE: Signal handler and longjmp question
Date: Mon, 10 Dec 2007 14:03:20 +0800
Message-ID: <BLU125-W4262DA65CFB67D8F920230EA6B0@phx.gbl>
References: <S1751093AbXLIMzQ/20071209125516Z+241@vger.kernel.org>
	 <BLU125-W33C6B6DA207B733BBC1F7AEA6A0@phx.gbl> 
 <6a00c8d50712090606k6882a52bv2735ee3d746ba7a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50712090606k6882a52bv2735ee3d746ba7a8@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Well, I understand you.
Maybe I'm not expressing myself clearly.
The following drawing indicates how the kernel issues a signal. (ref:un=
derstanding linux kernel, 3rd, O'Reilly, Fig. 11-2)
Note that the function calls on the right column are kernel codes.
The kernel manages the frame setup and other stuff  the signal_handler(=
)
I'm wondering if longjmp is called in signal_handler, the the handler w=
on't return and the system_call(),sys_sigreturn()and restore_sigcontext=
() will never have chance to execute.
This will break kernel's routine of handling a signal.
And I think that's bad...


Program running ----->  do_signal()
   received signal               handle_signal()
                                         setup_frame()
                                       /
                                     /
                                   /
signal_handler()  <------/    =20
         |
       return
               \
                 \
                   \---->  system_call()
                                 sys_sigreturn()
                                       restore_sigcontext()
                                      /
                                    /
continue program  <- ----/




> Date: Sun, 9 Dec 2007 15:06:22 +0100
> From: graegerts@gmail.com
> To: yi.w@live.com
> Subject: Re: Signal handler and longjmp question
> CC: linux-c-programming@vger.kernel.org
>
> On Dec 9, 2007 2:12 PM, Yi Wang  wrote:
>>
>> Hi, all
>> I read from some book that a signal handler can either return or cal=
l exit, abort or longjmp, it is permitted by ANSI C.
>> However, I remember that lonjmp never returns, which in turn causes =
the signal handler can not return. In that case, the kernel will think =
the program is in signal handler forever, am I right?
>> IMHO, I think that is too bad...
>
> This is not the case. Rather than returning to the interrupted
> statement, longjmp causes control to be sent back to the setjmp() in
> the main program. Since POSIX.1 does not specify whether setjmp and
> longjmp save or restore the current set of blocked signals the use of
> sigsetjmp/siglongjmp is recommended if signals must be handled.
>
> longjmp does not return because setjmp first saves the environment to
> which longjmp can return from another point in the program. After
> returning to setjmp the process does not know that it "has been
> returned" from somewhere else. So, technically longjmp cannot not
> return.
>
> A problem with the use of setjmp/longjmp is that the environment will
> not be cleaned up (closing FDs, flushing buffers, freeing
> heap-allocated memory, and the like).
>
> \Steve
>
> --
>
> Steve Gr=E4gert
> DigitalEther.de
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

_________________________________________________________________
Discover the new Windows Vista
http://search.msn.com/results.aspx?q=3Dwindows+vista&mkt=3Den-US&form=3D=
QBRE-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
