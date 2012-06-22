From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: nanosleep over multiple processes
Date: Fri, 22 Jun 2012 15:38:14 +0700
Message-ID: <CAA6iF_60u5dbOm7aQF30iWbsFHMj4=aPu8Ekg=McSF8QJ8yyQg@mail.gmail.com>
References: <CAA6iF_7rzg8o0C5kbNgcRYmgj=t+0As-YQzP7Ddbmaz6yMAqLA@mail.gmail.com>
	<20120622055356.GA15833@opentech.at>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=jRKlKBgQxH50VFX+Dpd15nZs5DNlI8eS0FenKlROMps=;
        b=Uqdej/HNbQLbVuIxH9xxXnXqkJm6yc19B8XsCd69BUZmzdBnVtCltscQr3NnamDlE0
         f5XRAJo1qI8H+JHhnjEMxo7PmiSBL8lvDlYFLcqoF2uLyLXQwWzCgP+0bTInAagoQtTH
         DJyVw/FD2p4wR/15vWs6nC2zKnXJfW7mf9YrvTJXIg04Aw6I1VcDxrLyI0VaVfgBEd9d
         CYGe9w+tAentz3Qqhy0cesdegKrfaRWAIWwaWFD4gu6oIkS8iWED8Ty7UI81R7/41gGc
         ekXldvUlZnf5NOv27HtkaK8kH053rgu17R24ldgKBmSiAJkvxsgMWtu3DzxP8ZmV+Grq
         oTVQ==
In-Reply-To: <20120622055356.GA15833@opentech.at>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi Nicholas,

So sorry, I was mean clock_gettime() not nanosleep(), my bad. The
unique ID must be different in all proces, so no duplicated ID in
entire process.

And here the ID should be generated:

struct timespec ts;
clock_gettime(CLOCK_REALTIME, &ts);
unsigned long uid = ts.tv_sec + ts.tv_nsec;

Does your reply also covering this?

Thanks,

On 6/22/12, Nicholas Mc Guire <der.herr@hofr.at> wrote:
> On Fri, 22 Jun 2012, Randi Botse wrote:
>
>> Hi All,
>>
>> In nanosecond precision, if I have multiple processes run nanosleep(),
>> how possbile they will get the same struct timespec value? both the
>> tv_sec and tv_nsec value. Of course the tv_sec (second) is most
>> possible, but how about the tv_nsec (nanosecond)?
>>
>> I wan't to create a simple stupid unique id or something like that,
>> but with without too much effort. The unique id will be tv_sec +
>> tv_nsec.
>>
> while it is highly unlikely that they get the same tv_nsec it is not
> impossible so it will not make for a good ID. The problem with such
> an ID is simply that if you have a collision then it will be very hard
> to debug this situation. Even worse this solution would not be portable
> at all - it even could work on one box (e.g. a UP system where the
> processes never execute physically concurrent) and fail on a MP in
> rare cases - portability to other OS would also be very shaky at the
> concept level (even if the API were pure POSIX).
>
> there are unique objects available to any process, pid, address (if
> address space randomization is enabled), /dev/random|/dev/urandom
> fetching a long long from there is far more reliable than generating
> a shaky long long from tv_nsecs (where the upper bits will almost
> surely match).
>
> let us know what you need it for and it is easiert to give some
> suggestions.
>
> thx!
> hofrat
>
>
