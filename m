From: Dallas Clement <dallas.a.clement@gmail.com>
Subject: Re: Slow signal delivery to server process with heavy I/O
Date: Sun, 11 Jul 2010 17:56:34 -0500
Message-ID: <AANLkTikkVpOnl5DQ8wPm9OIDR70YcTI-LVf9KACK39In@mail.gmail.com>
References: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>
	<19513.50328.712544.577528@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=bNrhZC2WZrlUf9z40X737kpWyY+30Nl7XR5jw77rIis=;
        b=bNoQxLpmMa7sTlwhiU4YEyA7zWxz1UwpXHWP8u+J4syqwzRK0t983z3XnT+OTcoyis
         oGVX9RieNsv/PrdnmGtfSRC4Z47RtpHwz9A7Z6BXYCCbf5QOqW0EvlDMJb7enprnfm+3
         9LowvgP/zavD/9INGGEw1hyJLtdUzWuT0+IeE=
In-Reply-To: <19513.50328.712544.577528@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

It's the delivery that's slow.  If other threads are busy making other
I/O system calls such as 'send', 'recv', 'select' etc, the kernel
seems loathe to interrupt them for the sake of delivering a signal.
Eventually, the signal handling thread gets a turn, but I guess I was
under the false impression that a signal would be like a true
interrupt and preempt any executing user code.

On Sun, Jul 11, 2010 at 8:18 AM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> Dallas Clement wrote:
>
>> I've noticed that asynchronous signals such as SIGINT, SIGTERM etc a=
re
>> delivered to my process long after the signal is sent if the receivi=
ng
>> process is handling lots of I/O. =A0My process is a multi-threaded w=
eb
>> server. =A0It's got one thread waiting on 'select' to accept incomin=
g
>> connections and a thread pool which reads the data with 'recv'.
>>
>> When I batter the web server with incoming traffic and I try to
>> shutdown the server by sending a SIGINT or SIGTERM, I have observed
>> that the web server finishes handling the incoming traffic before th=
e
>> kernel dispatches the signal to the process. =A0It appears that the
>> 'select' and 'recv' calls are getting highest priority with regard t=
o
>> scheduling.
>>
>> I realize this test may appear unnatural and is perhaps unrealistic,
>> but I would like to be able to shutdown my server gracefully within =
a
>> reasonable amount of time, no matter what kind of load it is handlin=
g.
>> =A0Don't want to have to wait several minutes for my signals to get
>> handled under heavy load. =A0Could someone please explain why signal
>> delivery is slow under these conditions?
>
> Is it delivery that's slow, or handling? A thread which is executing =
a
> signal handler doesn't get any additional priority. And if there is
> intensive disk I/O, paging in the block containing the signal handler
> won't get prioritised over other disk I/O.
>
> Also: historically, the kernel hasn't been particularly intelligent
> about choosing which thread received the signal (at one time, it
> didn't even take into account whether the thread had blocked the
> signal). It wouldn't surprise me if it's willing to deliver the signa=
l
> to a thread which is in uninterruptible sleep ("D" state).
>
> --
> Glynn Clements <glynn@gclements.plus.com>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
