From: hong zhang <henryzhang62@yahoo.com>
Subject: Re: strcut casts unsigned long
Date: Fri, 13 Aug 2010 14:25:09 -0700 (PDT)
Message-ID: <929805.17464.qm@web57903.mail.re3.yahoo.com>
References: <AANLkTikAiKKtzMcpt14W3veeiOe1JV57RyfG3L1L=OPh@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1281734709; bh=wqzyV6kDRr22QltUgNHpJZFDt6sqhea4P60ZuWEvSjo=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=4QLsbvvCf4lQpiMGDKUKALriM/JKK1hnfYow3xrB0tGoeKdgiOH2rQ6kwzdPmQ6PjZ/5DI3loQH0FFJRcwjSN2s3gcwlgV453qnLAKAjwXVIZ/48wh4RpGkgcW/Wcf107zaI3xn6MAE8a48Rgu36OJQdvvpq5z6/C2edylfrKOU=
In-Reply-To: <AANLkTikAiKKtzMcpt14W3veeiOe1JV57RyfG3L1L=OPh@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Ratheesh,

Thanks for reply.=20

But does skb->_skb_dst allocate memory any where? It is unsigned long. =
This is hard part for me to understand. Any explain why unsigned long
_skb_dst can be that?

---henry

--- On Fri, 8/13/10, ratheesh k <ratheesh.ksz@gmail.com> wrote:

> From: ratheesh k <ratheesh.ksz@gmail.com>
> Subject: Re: strcut casts unsigned long
> To: "hong zhang" <henryzhang62@yahoo.com>
> Cc: linux-c-programming@vger.kernel.org
> Date: Friday, August 13, 2010, 1:44 AM
> On Fri, Aug 13, 2010 at 7:47 AM, hong
> zhang <henryzhang62@yahoo.com>
> wrote:
> > List,
> >
> > I have C question on skbuff.h.
> > skb->_skb_dst is defined as unsigned long and
> dst_entry is struct.
> >
> > Why strct dst_entry casts unsigned long
> skb->_skb_dst?
> >
> > See below
> >
> > static inline struct dst_entry *skb_dst(const struct
> sk_buff *skb)
> > {
> > =A0 =A0 =A0 =A0return (struct dst_entry
> *)skb->_skb_dst;
> > }
> >
> > Appreciate any answer!
> >
> > --henry
>=20
> skb->_skb_dst can be a pointer to both destination cache
> or=A0 routing
> table . We could type cast to any of those .
>=20
> -Ratheesh
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> \\> --
> > To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> >
>=20


     =20
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
