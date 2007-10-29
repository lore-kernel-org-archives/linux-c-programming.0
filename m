From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: kernel provided system call is an API?
Date: Mon, 29 Oct 2007 21:36:58 +0100
Message-ID: <6a00c8d50710291336y3cc5a2ffl6cef031371abe8f5@mail.gmail.com>
References: <472214F1.6030907@gmail.com>
	 <18210.22198.824183.983353@cerise.gclements.plus.com>
	 <47228990.7060007@gmail.com>
	 <18210.38260.62084.809463@cerise.gclements.plus.com>
	 <d93f04c70710291317g750285adl8ec50f55e589e690@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=1ycJ6+Rlgxouksdrt45Ayw2eaVC3vVT3EIf8tMvGt1k=;
        b=dfOB3j6/vK6o7bLe5679gLKkZ2a/UCpa0buCIBFNocnQK/A+99nju0+/ApOr48BHJeFsG5YhwNGYGHScdQjKhchGzwj64eMRP11VUu5DdtvpHnbreI9q9JTXja6YnYQ4eS5Jd8CJr9FUh2zPEWxgSRyhuPEYjtVtMM/Pd7bKMsE=
In-Reply-To: <d93f04c70710291317g750285adl8ec50f55e589e690@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hendrik Visage <hvjunk@gmail.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>

On 10/29/07, Hendrik Visage <hvjunk@gmail.com> wrote:
> On 10/27/07, Glynn Clements <glynn@gclements.plus.com> wrote:
> >
> > Shriramana Sharma wrote:
> >
> > > >> 1. Can the system calls provided by the kernel be considered a=
n API?
> > > >
> > > > System calls aren't strictly an *application* programming inter=
face.
> > > > Applications are supposed to use the libc functions.
> > >
> > > OK so is it at least a "programming interface"?
> >
> > Yes, although it's intended to be used solely by libc.
>
> I think the "more correct"(TM) explanation would be that:
>
>  Each hardware architecture, and OS, will have different methods of
> invoking the actual system call. So from memory Linux and FreeBSD use=
s
> different methods to initiate a syscall.

And so do Windows, VMS and HP-UX, and many others.

> Althought the man read(2) "api" from the libc "user"'s perspective ar=
e all
> the same (specified by POSIX etc.) the nitty gritty of getting into t=
he
> kernel differs.

Right, but we are talking about the interfaces to the _Linux_ kernel
and already illustrated in earlier threads what system calls are and
how they are invoked by making use of system call wrappers.

Anyhow, Glynn put it straight and did so in a concise manner.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
