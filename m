From: Uriel Corfa <uriel@corfa.fr>
Subject: Re: float
Date: Tue, 11 Jan 2011 08:55:36 +0100
Message-ID: <AANLkTi=7Qg7LMats1A3p-c_-pzYsxyeqc8=gj6soEaUM@mail.gmail.com>
References: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=w/jKrJVHA/cpD63HC3aML2zb5wN/l2vUetHV0rWQFlE=;
        b=K5ZsCaYXEWHO/ucVYRwR3MK0HG/bHK3fDWPYEWcFGuNNwd7BdDbf09OgsKBLOxST+/
         rfKXczkpeQoSF/e8vPYTMwlavqp8M4Hd6uQWyM13cgj0cPQLp+MewEqaBZmqzqbRdirY
         J15H9tT9UL5uhC42Zpqd25/xq3tqBpaFScoSw=
In-Reply-To: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

I'd say : rounding errors. Floating point goes in mysterious ways.

On Tue, Jan 11, 2011 at 8:38 AM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> I could not understand =A0why it getting printed like this. Could any
> body tell me.
>
> #include <stdio.h>
>
> int main()
> {
> =A0 =A0 =A0 =A0float f=3D0.0f;
> =A0 =A0 =A0 =A0int i;
>
> =A0 =A0 =A0 =A0for(i=3D0;i<10;i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0f =3D f + 0.1f;
>
> =A0 =A0 =A0 =A0if(f =3D=3D 1.0f)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("f is 1.0 \n");
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("f is NOT 1.0\n");
>
> =A0 =A0 =A0 =A0return 0;
> }

--=20
Uriel Corfa
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
