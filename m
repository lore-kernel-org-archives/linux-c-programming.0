From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Running status of a process
Date: Wed, 21 Mar 2007 09:30:18 +0100
Message-ID: <6a00c8d50703210130x2722d05dy84673996da81b4aa@mail.gmail.com>
References: <4600E921.5010106@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=dKPuVaPHu2qQx0QrLvpIqSTX3Ut/qmnLc3baa6zMjm4p29BFzM5Kq/2oLnFQxnt/frjWkOEiAhF42avBS2n+d7xewbUBLTzZ+x/dXlfIsIFdJ9nQyHGj9TksxGx7/8qa/RlALzZzWBni66Z8t5jfN3ZYVj60JXjnAZQTf9fqG3M=
In-Reply-To: <4600E921.5010106@sun.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com>
Cc: linux-c-programming@vger.kernel.org

Prasanta,

On 3/21/07, Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com> wrote:
> Hi,
>
> Can anyone point as to how can I obtain the information whether a
> non-child process is still running?

If you know the PID of the process you want to obtain the status of
use the kill(2) system call.  The second argument should be 0 (zero)
to prevent a signal from being sent to the process.  If the process
exists kill(2) returns zero, or -1 otherwise.

kill(2) can indicate various errors, but an error or EPERM usually is
an indicator that the process exists, while all others indicate that
it does not.

If you're writing for systems supporting the /proc filesystem,
checking for existence of /proc/{pid} is an alternative.

If you don't know the PID you're out of luck, unless you make use of
the /proc filesystem again, which is not portable per se.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
