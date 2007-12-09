From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Signal handler and longjmp question
Date: Sun, 9 Dec 2007 15:06:22 +0100
Message-ID: <6a00c8d50712090606k6882a52bv2735ee3d746ba7a8@mail.gmail.com>
References: <S1751093AbXLIMzQ/20071209125516Z+241@vger.kernel.org>
	 <BLU125-W33C6B6DA207B733BBC1F7AEA6A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=53upFGXe/m+syBdEr+LCiT5vhpgEF8fpWMeyc4doDv0=;
        b=CIZSViakeTc6aq6nTJusb6WbE2FXR3WT9ZLx2kcTtg1hoLToI0A5wJr7vJNl5mH4onUcYPw6teUCpw64ee61o/ZSINKloQ67wdDaYMcvhY4/UnqerNi3rABNIuIAL2WeK+hjDTRoM3P9JptGgiWx0jvZENmIaGWmbrBdkppGeuQ=
In-Reply-To: <BLU125-W33C6B6DA207B733BBC1F7AEA6A0@phx.gbl>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yi Wang <yi.w@live.com>
Cc: linux-c-programming@vger.kernel.org

On Dec 9, 2007 2:12 PM, Yi Wang <yi.w@live.com> wrote:
>
> Hi, all
>     I read from some book that a signal handler can either return or =
call exit, abort or longjmp, it is permitted by ANSI C.
>     However, I remember that lonjmp never returns, which in turn caus=
es the signal handler can not return. In that case, the kernel will thi=
nk the program is in signal handler forever, am I right?
>     IMHO, I think that is too bad...

This is not the case.  Rather than returning to the interrupted
statement, longjmp causes control to be sent back to the setjmp() in
the main program.  Since POSIX.1 does not specify whether setjmp and
longjmp save or restore the current set of blocked signals the use of
sigsetjmp/siglongjmp is recommended if signals must be handled.

longjmp does not return because setjmp first saves the environment to
which longjmp can return from another point in the program.  After
returning to setjmp the process does not know that it "has been
returned" from somewhere else.  So, technically longjmp cannot not
return.

A problem with the use of setjmp/longjmp is that the environment will
not be cleaned up (closing FDs, flushing buffers, freeing
heap-allocated memory, and the like).

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
