From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: kernel provided system call is an API?
Date: Mon, 29 Oct 2007 22:17:38 +0200
Message-ID: <d93f04c70710291317g750285adl8ec50f55e589e690@mail.gmail.com>
References: <472214F1.6030907@gmail.com>
	 <18210.22198.824183.983353@cerise.gclements.plus.com>
	 <47228990.7060007@gmail.com>
	 <18210.38260.62084.809463@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=7cq9OTCypTGtKxXXeY6OvsiRnmVRy/eoVmFRZkddBhQ=;
        b=GxQq+Jhud67rDOObY1ece1dHdrCqGQ1zPvmY3wdP46ai7SINno+moo+lL0f38k1nMrqp/ojx8q03YWBb+zcHEeOeHKZMTBqS+Dr1TrxnDBThW69TxIOvBzd1Wh9qlgKLIxMFMAzy9y7OlB2BLYt/zvE7qYp6vgE2hhow07e5iVo=
In-Reply-To: <18210.38260.62084.809463@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>

On 10/27/07, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Shriramana Sharma wrote:
>
> > >> 1. Can the system calls provided by the kernel be considered an API?
> > >
> > > System calls aren't strictly an *application* programming interface.
> > > Applications are supposed to use the libc functions.
> >
> > OK so is it at least a "programming interface"?
>
> Yes, although it's intended to be used solely by libc.

I think the "more correct"(TM) explanation would be that:

 Each hardware architecture, and OS, will have different methods of
invoking the actual system call. So from memory Linux and FreeBSD uses
different methods to initiate a syscall. Althought
the man read(2) "api" from the libc "user"'s perspective are all the
same (specified by POSIX etc.) the nitty gritty of getting into the
kernel differs.


-- 
Hendrik Visage
