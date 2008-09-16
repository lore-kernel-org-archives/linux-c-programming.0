From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: looking for a function
Date: Tue, 16 Sep 2008 16:03:13 +0200
Message-ID: <6a00c8d50809160703mc47c47cy779625c0d2f4c1c9@mail.gmail.com>
References: <ab40e9c0809160626o1cc6e7en5e09650a1d04affe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=IzgkfCt3IhoRECduKK0zYLSBPl/jCYPJZPORphmDCos=;
        b=lsrH6chL/kLAuxy6DeqFcDcYXzekxqOjs4Ql4sBlRy1JDJ5hWRglNIJdj2wbsngA8V
         SyL0qb+kZxfRtuQoouDGn7+4zzAii1KSSrQZtNxGR0EK0D0sUdMOi0n8yCTG2yP+IttE
         1sOLaHy+LxI9eh+Bllzkp+IlbolSK/xkV62Pg=
In-Reply-To: <ab40e9c0809160626o1cc6e7en5e09650a1d04affe@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Xu Yang <risingsunxy@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

Xu Yang,

On Linux sched_getcpu(3) comes to mind.  This function is not
particularly useful since the information returned by the function
might not be correct at the point of its return as threads can be
switched to other CPUs (read: cores) at anytime (although CPU/core
switching can be quite expensive due to cache line bouncing for
instance)

So, once the information has been obtained it might already be
obsolete.  Anyway, I hope that is what you're looking for.

        \Steve

--

Steve Gr=E4gert


On Tue, Sep 16, 2008 at 3:26 PM, Xu Yang <risingsunxy@googlemail.com> w=
rote:
>
> Hi guys,
>
> I am looking for a function that can show me the current thread is
> running on which cpu.
>
> e.g I am using pthread to write a multithreaded program, in each
> thread I would like to insert such kind of function so that I can kno=
w
> on which cpu this thread is running on.
>
> which function should be used?
>
> thanks for the help!!
>
> best regards,
>
>
>
> Yang
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
