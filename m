From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: Division in loop
Date: Tue, 8 Sep 2009 16:57:07 +0200
Message-ID: <36ca99e90909080757o6b9e0d4i927af10186060f73@mail.gmail.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=eZgVIg82NA+/g38pwu2MhSg9HfdqBo6HOAS5lFWRGdU=;
        b=dhXrL9JoGcelXeZ+DgWdKO2oZCMTQb7tM9+BavlcQRxrRhK2S57qQke4Wl2QlSmeDd
         jQkCUi8JemUNwqaHHb4fbK2XKxn+Ayk4phw0bJhiQDuX/iFYIoX4m22bvDa6f4/kfrdS
         cToNrMzhV5eLF1MFojbW0p1PHgA1dVeJDITIo=
In-Reply-To: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, Sep 8, 2009 at 16:40, Randi Botse<nightdecoder@gmail.com> wrote=
:
> hi all,
Hi,

>
> while (bytes < size) {
:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0progress =3D (int) ((bytes / size) * 100);
This is an integer division, and because bytes is always smaller than
size will result in 0. You should cast bytes to double, or multiply by
100 first and than divide by size.

Bert
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
