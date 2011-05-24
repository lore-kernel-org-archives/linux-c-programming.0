From: Fawad Lateef <fawadlateef@gmail.com>
Subject: Re: Hi, Needs suggestions for finding and fixing stack/memory
 corruption when calling a function
Date: Tue, 24 May 2011 16:33:03 +0100
Message-ID: <BANLkTik-2VQKoT20QkxN2yhfEBSyuDkjpg@mail.gmail.com>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com>
 <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com> <BANLkTimx+=DxYCCqtSKjGWUm63jBAe+iug@mail.gmail.com>
 <BANLkTi=C7H=NK65aT4m0Mw-ecy6v2Kx44A@mail.gmail.com> <19931.43284.690853.95289@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=zUq168eOLNfehHkU/roTNbKvpLzsXTAjGtABjKaOG68=;
        b=k6UrrMiNKyUiBmClSETnOjG+LI+LvxVfNVky3K6hEV+IcW7Xe77UzPrYCs705Bjl3X
         M2tF+U2UYp6P5kzIP0WFLcLX+0IFv2QExjssUVbp3pCK1H3sAvMVA5S0Px7tmc6i6WK8
         0Kwx0y48s7eylae9OsvNDOJ+aG7hvr7uXp0ys=
In-Reply-To: <19931.43284.690853.95289@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Hi Glynn,


On Tue, May 24, 2011 at 1:48 PM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> Fawad Lateef wrote:
>
>> For now I added two more temporary arguments between 1st and 2nd
>> arguments and the required arguments getting correct values thats
>> why I am assuming that by adding temporary variables we moved the
>> memory corruption from real arguments into temporary arguments.
>> After adding these arguments my function is behaving correctly so
>> for now this is a work-around _but_ I want to figure-out its proper
>> fix (as the same sort of issue we faced in our cgi based web-pages
>> code some weeks earlier).
>>
>> Hence I needs suggestion that is this really a memory corruption or
>> some compiler issues ? If its a compiler issue then its not a big
>> problem but if its memory corruption issue then we have to _fix_ it
>> asap.
>
> Check the assembler output ("gcc -S ...").
>

Nice idea, will look into this.

> Personally, I'd be more inclined to suspect register corruption. Are
> you calling a library function which use a different ABI? E.g. if your
> code is compiled for an ABI where certain registers are preserved but
> calling a function using an ABI which doesn't preserver those
> registers, then you'll have problems.
>

humm, Can you give some suggestion about how to verify this ? Using
readelf or objdump on different libraries and executables can give
some clue ? As we are using some pre-compiled  libraries provided by
some stack we are using.

Thanks for the help.

Regards,

Fawad Lateef


> --
> Glynn Clements <glynn@gclements.plus.com>
>
