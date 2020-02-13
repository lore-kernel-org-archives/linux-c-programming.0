From: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: big number(around 100 digits) arithmetic
Date: Thu, 13 Feb 2020 23:40:45 +0530
Message-ID: <CAHhAz+jYYpjycZxnn9LjP0NahxxDNO+763t6H+KtGqBD_SaQRQ@mail.gmail.com>
References: <CAHhAz+iDUgjBq8vWsf-dPHwbojMwFB8CKORraT84vS3LcBrt0A@mail.gmail.com>
 <CADWT_cPu-1H1gYj62R+pdJznu9CishtQoJ=wO=4XOkQigxzWxA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IeboyfMv9EmN3JmFevSXBHn8DfKeP4PXsCHQSj0/+cQ=;
        b=gupKUNUg/TNL+3erAAkK0Bc6GXlE9mbkvNNbGrgaONCn5L6K4/eS1zCJ3MPudNt8I0
         Lpz7KecftHbpWwm/Krfvqao/6xDDJBiFzJIbCz+PPHQvQfMpdNUhpjputhMk9BLc5Tx5
         pQe4OoMH6Sz8lNA9+aasAz/Tvf6aJMKxQvKLdP0GHTYjf8wGhrp0QR7UfPaSnfYX/mNC
         wNf6C2sAugi0CMs182v2PXtlr41uTxwJsbiMnlMhFykSKO2aqs8JtFl8Sh//+Np+HZ//
         S5vOui0SlpTtjTKLSKW3yl+4qPXkdbhgKn++4PnFJN2j5U6K4Zk3UKuRlIc/+EljMfnN
         sOLQ==
In-Reply-To: <CADWT_cPu-1H1gYj62R+pdJznu9CishtQoJ=wO=4XOkQigxzWxA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jon Mayo <jon.mayo@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Thu, Feb 13, 2020 at 11:10 PM Jon Mayo <jon.mayo@gmail.com> wrote:
>
> libgmp or LibTomMath will let you deal with large numbers. With GMP being=
 the oldest, most general purpose, most widely available, and largest.
>
> If you have only a few kinds of operations and are not very performance s=
ensitive it is not hard to write a simple big num library. It's one of thos=
e things that you should do once on your own, them never again. The librari=
es I listed above are much better than anything you or I could write in a r=
easonable amount of time.
Yes, I have only few kinds of operations on big number integers. If
any one already implemented the simple big number library please share
some pointers.
Thanks for letting me know about the libgmp  and LibTomMath .

>
> - Jon Mayo
>
> On Thu, Feb 13, 2020, 9:11 AM Muni Sekhar <munisekharrms@gmail.com> wrote=
:
>>
>> [ Please keep me in CC as I'm not subscribed to the list]
>>
>> HI all,
>>
>> I=E2=80=99m looking for a =E2=80=9CC=E2=80=9D program for big number(aro=
und 100 digits)
>> arithmetic i.e.
>> mltiplication\addition\division\subtraction\exponentiation and
>> modulus, etc.
>>
>> Basically I want to use it for =E2=80=98Extended Euclidean Algorithm=E2=
=80=99 and
>> public-key encryption with the RSA algorithm which typically requires
>> larger integers and it will not fit into C data types. Can someone
>> point me the to the either source code or logical explanation on how
>> to handle big number arithmetic?
>>
>> --
>> Thanks,
>> Sekhar



--=20
Thanks,
Sekhar
