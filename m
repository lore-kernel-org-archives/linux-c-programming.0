From: Dallas Clement <dallas.a.clement@gmail.com>
Subject: Re: Slow signal delivery to server process with heavy I/O
Date: Sat, 10 Jul 2010 18:46:58 -0500
Message-ID: <AANLkTim5E9FROyVQJceAD-xNA2JJS0MsjQpY8j73bmdN@mail.gmail.com>
References: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>
	<AANLkTin9wvP1p3rp3Lv6-APEfvq9jZACF0TEas9a2f6l@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=c8cofHJ/+NApDz80tNJYIAtV4Z+EylHDya1pJiu8ssk=;
        b=qMNl6AK39WgXo877blUDH69foOiHYgaKKNe69yxlvWz9I5kcJaZUlD7ftGIEvXhjML
         SfKjD73JAHasnCb5jd2p95drYmilC/QZ9N0n78948wMbIHKXLkrH3AIf4kH20RsTQbfj
         /VtD9yKvuLkpX37K3MtN+fF1roCMkkYtTDY1A=
In-Reply-To: <AANLkTin9wvP1p3rp3Lv6-APEfvq9jZACF0TEas9a2f6l@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Yes, I have tried setting this flag.  Doesn't seem to make any
difference.  My main thread doesn't do much.  He registers for the
signal and then waits on a self-pipe and wakes up when a signal
arrives.  All the I/O action is happening in the other threads.  I'm
not expecting the other threads to be interrupted during a system call
like 'select', 'send', 'recv' etc, but even if they were, they detect
EINTR and try again.

On Sat, Jul 10, 2010 at 6:26 PM, Gao Free_Wind <gfree.wind@gmail.com> w=
rote:
> Do you set the SA_RESTART flag for the signal?
> If set SA_RESTART flag, it will restart the system calls include I/O.
>
> On Sat, Jul 10, 2010 at 4:08 PM, Dallas Clement <dallas.a.clement@gma=
il.com>
> wrote:
>>
>> Hi All,
>>
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
>>
>> Thanks in advance,
>>
>> Dallas
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
