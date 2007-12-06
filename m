From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: EAGAIN with read
Date: Thu, 6 Dec 2007 22:29:54 +0100
Message-ID: <6a00c8d50712061329oc49de6fpdff81748bbfbe57b@mail.gmail.com>
References: <2a46ebd60712061214p2febc3d0pbe4fd688911356f7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Mipn4kuqWeYWGZ6eAqTi1bXga615SgyvQ37JSqUMOvY=;
        b=qxErxkRnFsnGBfRp57RScA/9oxge5bvifbIfkfYL9ts+nV1w0e4GY0sd8LD27IpfQ9GW9DQJYvrFvnDVlG8faPXJoz+e7/vrznQjoqUMAxc71CD0Tm3EvCab678y9m812SZPXxP44NMS0P76Yoz40J5yHkQ1Y/BwcL2WL23bQnk=
In-Reply-To: <2a46ebd60712061214p2febc3d0pbe4fd688911356f7@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Saurabh Sehgal <saurabh.r.s@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Dec 6, 2007 9:14 PM, Saurabh Sehgal <saurabh.r.s@gmail.com> wrote:
> Hi,
>
> I had a basic question about read . I have a file descriptor marked
> with non blocking I/O , and I want to read data from the file
> descriptor. This file descriptor is the read end of a UNIX pipe.
>
>  The process that the pipe reads from is a very slow process. Hence I
> need to poll  and keep on trying to read from the fd until the proces=
s
> has actually written something to the pipe. I execute read while the
> errno condition EAGAIN is true. Will this ever result in an infinite
> loop ? (lets say the remote process dies and doesnt write anything to
> the pipe, will I go into an infinite loop since I am polling while
> EAGAIN is true ?).

Hi,

I'd suggest taking a look at select(2) which allows for the
specification of a timeout.  Use pselect(2) if you are waiting for a
signal as well as data from a file descriptor or otherwise the
select(2) call may block indefinitely due to a nasty race condition
that may occur.

To your question: There are actually a couple of reasons why your
process would or would not run indefinitely in that loop.  There are
also a couple of other errors read(3) can return that might cause your
condition to return false, thus breaking the loop (if I understood
correctly, code example is welcome). What about EINTR which is
returned when the call was interrupted by a signal before any data was
read?  (Please note that for a FIFO or pipe it will never return EINTR
if any data has been read.)

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
