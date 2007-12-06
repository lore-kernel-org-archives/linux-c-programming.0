From: "Saurabh Sehgal" <saurabh.r.s@gmail.com>
Subject: Re: EAGAIN with read
Date: Thu, 6 Dec 2007 18:27:32 -0500
Message-ID: <2a46ebd60712061527r42b53cc3i444811873ebba7d7@mail.gmail.com>
References: <2a46ebd60712061214p2febc3d0pbe4fd688911356f7@mail.gmail.com>
	 <6a00c8d50712061329oc49de6fpdff81748bbfbe57b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=u5AUBt99RS+zUdRYbwBFGVmWZ1W1vnesoXAdzxAqVpY=;
        b=Fuwy2IfN3001Nsm8yIEfvL2s2C8ukTlOGNfHIlpE1z486HR/bfZiteawlvTivaN8D8M9CIs/E6Dqi6KPa8XP1EATxvOe6+X5KAFMPa5l+qcn2zaG4Q02nt5Amk7OECdgpy7Fot9xmWr3GMJDyZthMURixQkxbK7zHUS5IP0H920=
In-Reply-To: <6a00c8d50712061329oc49de6fpdff81748bbfbe57b@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi,

Thanks for the reply .. right now, i was reading and checking for the
errno EAGAIN, but my loop would prematurely exit. I later found out
that the errnor returned by read was ECHILD ... looking at the read(3)
manpages ... this errno is not mentioned

But since the process that is supposed to write to the pipe is a
forked processs .. does that change anything ?

Thanks,

Saurabh

On Dec 6, 2007 4:29 PM, Steve Graegert <graegerts@gmail.com> wrote:
>
> On Dec 6, 2007 9:14 PM, Saurabh Sehgal <saurabh.r.s@gmail.com> wrote:
> > Hi,
> >
> > I had a basic question about read . I have a file descriptor marked
> > with non blocking I/O , and I want to read data from the file
> > descriptor. This file descriptor is the read end of a UNIX pipe.
> >
> >  The process that the pipe reads from is a very slow process. Hence=
 I
> > need to poll  and keep on trying to read from the fd until the proc=
ess
> > has actually written something to the pipe. I execute read while th=
e
> > errno condition EAGAIN is true. Will this ever result in an infinit=
e
> > loop ? (lets say the remote process dies and doesnt write anything =
to
> > the pipe, will I go into an infinite loop since I am polling while
> > EAGAIN is true ?).
>
> Hi,
>
> I'd suggest taking a look at select(2) which allows for the
> specification of a timeout.  Use pselect(2) if you are waiting for a
> signal as well as data from a file descriptor or otherwise the
> select(2) call may block indefinitely due to a nasty race condition
> that may occur.
>
> To your question: There are actually a couple of reasons why your
> process would or would not run indefinitely in that loop.  There are
> also a couple of other errors read(3) can return that might cause you=
r
> condition to return false, thus breaking the loop (if I understood
> correctly, code example is welcome). What about EINTR which is
> returned when the call was interrupted by a signal before any data wa=
s
> read?  (Please note that for a FIFO or pipe it will never return EINT=
R
> if any data has been read.)
>
>         \Steve
>
> --
>
> Steve Gr=E4gert
> DigitalEther.de
>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
