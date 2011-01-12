From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: printf *%f
Date: Wed, 12 Jan 2011 08:46:08 +0100
Message-ID: <AANLkTi=2DQ+YAC3vGGxfpJDLFusV+5Vkr1oE2AP6o8Tj@mail.gmail.com>
References: <AANLkTikSFEK-5m0a1mFKbyFRwA7wNqTkzejbLEv_-=73@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=amJsFYazYuPmsdOhD0nV55E+wmlZxXAVRetMdm3d260=;
        b=GY9/BIp0Ae7T+C/AiJrLIMIH2JQoSuk0K4YEP9tYrJt63nLLsnvb9QXNHYwa7G1jzy
         bHY+Q9tbYvMercw3bGuRJCbFSXbngKbSv+EP6uH3Oe7fPOAa0X1fPsc67RAhgtkiFh7g
         tYCnKmMHqSGDt5vZV4VwSWUtOEGuy3cEkPnuA=
In-Reply-To: <AANLkTikSFEK-5m0a1mFKbyFRwA7wNqTkzejbLEv_-=73@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, Jan 12, 2011 at 08:39, ratheesh k <ratheesh.ksz@gmail.com> wrot=
e:
> double x=3D45.9876 ;
>
> printf("%4.2f" , x); is working fine ... =C2=A0But printf("%*f , 4.2 =
, x) ;

printf("%*.*f" , 4, 2 , x) ;

Bert

> behaves odd in my =C2=A0fedora 8 pentium machine. any clue ?
>
> Does * =C2=A0substitute only integers ?
>
>
> -Ratheesh
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
