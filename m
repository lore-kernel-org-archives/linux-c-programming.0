From: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Subject: Re: printf *%f
Date: Wed, 12 Jan 2011 15:23:44 +0530
Message-ID: <AANLkTimUhpC0VfX-C+u_NA7==bZ_Ecv19+rrMOK8bG5q@mail.gmail.com>
References: <AANLkTikSFEK-5m0a1mFKbyFRwA7wNqTkzejbLEv_-=73@mail.gmail.com>
 <AANLkTi=2DQ+YAC3vGGxfpJDLFusV+5Vkr1oE2AP6o8Tj@mail.gmail.com>
 <AANLkTi=f-TrLVC-S9PpY-HcLKgujNOtii7bG-U5tSPyy@mail.gmail.com>
 <AANLkTim3ssPSpKoWW5wSZiKChzQiaL2XVYZWSubXbiXY@mail.gmail.com>
 <AANLkTin=9aSsQTUh8MXOsgpwPC8hotwXjk=XOFjHwiRa@mail.gmail.com>
 <AANLkTikZEFjsj8uP9KV58t+RWOfvSxTZB966XM64tPh7@mail.gmail.com>
 <AANLkTikEqOiLL11LKQFA3jj8wa+6FOgWmP9XxODMAMnP@mail.gmail.com> <AANLkTinioDUcJ-1huPHJ3XoSkm63S14j5LzWOiQp7gmS@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=ZbG301/c11LGsgBVzNoWkwBvVcpAJ6iE0MytG4fKIlc=;
        b=FNMh4dHWY0K4AtOKb9vGawuD1+L5rBiITqoHCfQW9FPAG+TrVKeWdeBlc3sGKU1J5n
         sihmzjxxq+3nbTNShf/YfAh/6wAtDiYLuBnlc57y6UiDduoYWevCX8uu/xSfhx5ugD9N
         JOIrYkQIwNZy9Z78nAjArBjseaeKq48OiRrFo=
In-Reply-To: <AANLkTinioDUcJ-1huPHJ3XoSkm63S14j5LzWOiQp7gmS@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Use "%.*f" for Float =A0 =A0(its ".*" not "*")
and "%*d" for int

On Wed, Jan 12, 2011 at 3:22 PM, Aniruddha Bhattacharyya
<aniruddha.aot@gmail.com> wrote:
>
>
> Use "%.*f" for Float =A0 =A0(its ".*" not "*")
> and "%*d" for int
>
> Ref:=A0http://www.cplusplus.com/reference/clibrary/cstdio/printf/
>
> On Wed, Jan 12, 2011 at 2:44 PM, ratheesh k <ratheesh.ksz@gmail.com> =
wrote:
>>
>> On Wed, Jan 12, 2011 at 2:32 PM, Bert Wesarg <bert.wesarg@googlemail=
=2Ecom> wrote:
>> > On Wed, Jan 12, 2011 at 09:59, Fei Zhao <skywalkzf@gmail.com> wrot=
e:
>> >> I mean's that when to use=A0printf("%*.*f" , 4, 2 , x) ; in linux=
 kernel or
>> >> our practical use?
>>
>> If you want to control the format dynamically.
>> scanf("%d" , &first);
>> scanf("%d" , %second);
>> printf("%*.*f", first ,second , x);
>>
>> > I don't know when you want to use such calls, how should I? And wh=
at
>> > has the linux kernel to do with this, this doesn't came up before,=
 and
>> > what is '*our* practical use'?
>> >
>> > Bert
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-c-=
programming" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
