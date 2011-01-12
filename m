From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: printf *%f
Date: Wed, 12 Jan 2011 14:44:33 +0530
Message-ID: <AANLkTikEqOiLL11LKQFA3jj8wa+6FOgWmP9XxODMAMnP@mail.gmail.com>
References: <AANLkTikSFEK-5m0a1mFKbyFRwA7wNqTkzejbLEv_-=73@mail.gmail.com>
	<AANLkTi=2DQ+YAC3vGGxfpJDLFusV+5Vkr1oE2AP6o8Tj@mail.gmail.com>
	<AANLkTi=f-TrLVC-S9PpY-HcLKgujNOtii7bG-U5tSPyy@mail.gmail.com>
	<AANLkTim3ssPSpKoWW5wSZiKChzQiaL2XVYZWSubXbiXY@mail.gmail.com>
	<AANLkTin=9aSsQTUh8MXOsgpwPC8hotwXjk=XOFjHwiRa@mail.gmail.com>
	<AANLkTikZEFjsj8uP9KV58t+RWOfvSxTZB966XM64tPh7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=jxOVmAkaCh6BKTr5O3jOYxzmVFRvotznyj1eGXsG0uc=;
        b=sK+UcnLklD4W3yZ5qpAqDAss5D+Bys7UPedmUhX/EthsFn8wkwjK2sXQ/t8ZdIZN26
         6McPpclRtRJS0j1aCkh/O55PBWwGzRg5oC8IVLxieKz+/7uJ0wp0vGxijHBG8g+NJjRj
         zVeFSPGproMrfku2o1KPH0/cSZqmfwKvsg190=
In-Reply-To: <AANLkTikZEFjsj8uP9KV58t+RWOfvSxTZB966XM64tPh7@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: Fei Zhao <skywalkzf@gmail.com>, linux-c-programming@vger.kernel.org

On Wed, Jan 12, 2011 at 2:32 PM, Bert Wesarg <bert.wesarg@googlemail.co=
m> wrote:
> On Wed, Jan 12, 2011 at 09:59, Fei Zhao <skywalkzf@gmail.com> wrote:
>> I mean's that when to use=A0printf("%*.*f" , 4, 2 , x) ; in linux ke=
rnel or
>> our practical use?

If you want to control the format dynamically.
scanf("%d" , &first);
scanf("%d" , %second);
printf("%*.*f", first ,second , x);

> I don't know when you want to use such calls, how should I? And what
> has the linux kernel to do with this, this doesn't came up before, an=
d
> what is '*our* practical use'?
>
> Bert
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
