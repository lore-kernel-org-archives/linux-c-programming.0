From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: C Question
Date: Sun, 30 May 2010 17:41:18 +0700
Message-ID: <AANLkTilJ0HUomkRuJwrywTcmVoeAAmQb2MTZbwoT57fn@mail.gmail.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
	<87r5l09pjt.fsf@erwin.mina86.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=181fn3sie2xyZKpbey9QTcked/9WbedjdCGUSMOLrsQ=;
        b=Gd4K3vXPZ/IT3GEgxGq2fUUTF0fTx1kZAqAhNSNrSu7kYglhyyS06mK6MyR6X+QaRF
         VtzMPaVTCWaiO3bbfB4rmsRH5+zkwa1/SqERG2g7/VW4wFljT73T9gBkC9L00hZmQ535
         3jUu5fEIF0/vNEexN+QlBJebAcbFRix0xhCfw=
In-Reply-To: <87r5l09pjt.fsf@erwin.mina86.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Nazarewicz <mina86@tlen.pl>
Cc: linux-c-programming@vger.kernel.org

Yes, the N_(x) macro used for localization that i discard in my questio=
n.

Sorry but, i just having another question, consider this code:

const char *my_strings[] =3D {
    [0] =3D "index0",
    [4] =3D "index4",
    [6] =3D "index6"
};

How many pointer to char that my_string array holds now? is that 3?
where are index [1], [2], [3], and [5] ?

2010/5/25 Michal Nazarewicz <mina86@tlen.pl>:
>
> As Xiaotian Feng said, N_(x) must be defined somewhere and additional=
ly
> to this this definition uses a new syntax where you can specify index=
es
> of elements you want to set value to, ie. the above is the same as:
>
> const char *virt_types[] =3D {
> =A0 =A0 =A0 =A0[0] =A0 =A0 =3D N_("none"),
> =A0 =A0 =A0 =A0[1] =A0 =A0 =3D N_("para"),
> =A0 =A0 =A0 =A0[2] =A0 =A0 =3D N_("full")
> };
>
> which in turn is the same as:
>
> const char *virt_types[] =3D {
> =A0 =A0 =A0 =A0N_("none"),
> =A0 =A0 =A0 =A0N_("para"),
> =A0 =A0 =A0 =A0N_("full")
> };
>
> The advantage of the new syntax is that you can specify values in any
> order and omit some.
>
> --
> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
> =A0.o. | Liege of Serenly Enlightened Majesty of =A0 =A0 =A0o' \,=3D.=
/ `o
> =A0..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0 (o o)
> =A0ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
