From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: nanosleep over multiple processes
Date: Fri, 22 Jun 2012 11:08:20 +0200
Message-ID: <CADtGFvn=XegxwtVge0kgSods5cEMC=0eCmvmwUpHptO0cap+3g@mail.gmail.com>
References: <CAA6iF_7rzg8o0C5kbNgcRYmgj=t+0As-YQzP7Ddbmaz6yMAqLA@mail.gmail.com>
	<20120622055356.GA15833@opentech.at>
	<CAA6iF_60u5dbOm7aQF30iWbsFHMj4=aPu8Ekg=McSF8QJ8yyQg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=55iVhBPCiIqmwQQtD5oxJPJRzsFyuAXewi7uTeIw1LQ=;
        b=EctnZB++4Q9AvMI0xhDRbHzWKfyT3xruIAuYjbGxNysm/NZHRDopze9AudxnGBUtgF
         15U4YMXItrdERtPvyYZEZ/4KQCrzE4QFkQbAl4Ri52JATYqzFeEQAsN9LNKZQ4rjraaK
         w/bvtaLKNWjEWOCzYReP7Edf2bbxfwOXipx4ZrGSmw76y7T+W8kB2lDANTPswiDQWZWe
         elgWBSLur8B8JVX6dOlHSlDBNmS0rA3w0EudxGAX75RpP/um9iyE8dRoaAikav8lynBT
         idJpuz5o68J9zUz5MLTnkKl1OjFmVzQIamo78aujQsYOzhv4wcyla/0W2F5o087U8uXB
         vFWA==
In-Reply-To: <CAA6iF_60u5dbOm7aQF30iWbsFHMj4=aPu8Ekg=McSF8QJ8yyQg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: Nicholas Mc Guire <der.herr@hofr.at>, linux-c-programming <linux-c-programming@vger.kernel.org>

On Fri, Jun 22, 2012 at 10:38 AM, Randi Botse <nightdecoder@gmail.com> =
wrote:
> Hi Nicholas,
>
> So sorry, I was mean clock_gettime() not nanosleep(), my bad. The
> unique ID must be different in all proces, so no duplicated ID in
> entire process.
>
> And here the ID should be generated:
>
> struct timespec ts;
> clock_gettime(CLOCK_REALTIME, &ts);
> unsigned long uid =3D ts.tv_sec + ts.tv_nsec;
>
> Does your reply also covering this?

Yes it does.
The one thing you need to remember, is that we today have multicore
CPUs on desktops, and in the data center, multiple CPUs (each with
multi-cores) not to mention distributed systems too. Thus, in your
single core setup, the possibility *should* be 0, however, in an multi
core/cpu and/or distributed setup, the possibilities increases. It is
a BadIdea(TM) to make use of time for uniqueness! period.

A much better method would be to read from /dev/random (If you could
block) or /dev/urandom(less guaranteed to be "random", but "faster"
and non-blocking) to get some "real" extra randomness



> Thanks,
>
> On 6/22/12, Nicholas Mc Guire <der.herr@hofr.at> wrote:
>> On Fri, 22 Jun 2012, Randi Botse wrote:
>>
>>> Hi All,
>>>
>>> In nanosecond precision, if I have multiple processes run nanosleep=
(),
>>> how possbile they will get the same struct timespec value? both the
>>> tv_sec and tv_nsec value. Of course the tv_sec (second) is most
>>> possible, but how about the tv_nsec (nanosecond)?
>>>
>>> I wan't to create a simple stupid unique id or something like that,
>>> but with without too much effort. The unique id will be tv_sec +
>>> tv_nsec.
>>>
>> while it is highly unlikely that they get the same tv_nsec it is not
>> impossible so it will not make for a good ID. The problem with such
>> an ID is simply that if you have a collision then it will be very ha=
rd
>> to debug this situation. Even worse this solution would not be porta=
ble
>> at all - it even could work on one box (e.g. a UP system where the
>> processes never execute physically concurrent) and fail on a MP in
>> rare cases - portability to other OS would also be very shaky at the
>> concept level (even if the API were pure POSIX).
>>
>> there are unique objects available to any process, pid, address (if
>> address space randomization is enabled), /dev/random|/dev/urandom
>> fetching a long long from there is far more reliable than generating
>> a shaky long long from tv_nsecs (where the upper bits will almost
>> surely match).
>>
>> let us know what you need it for and it is easiert to give some
>> suggestions.
>>
>> thx!
>> hofrat
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
