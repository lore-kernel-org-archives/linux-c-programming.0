From: Muni Sekhar <munisekharrms@gmail.com>
Subject: big number(around 100 digits) arithmetic
Date: Thu, 13 Feb 2020 22:38:44 +0530
Message-ID: <CAHhAz+iDUgjBq8vWsf-dPHwbojMwFB8CKORraT84vS3LcBrt0A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+PXn3ZGoTHRAQgmcHgDpsYfEh0kLXykuMdln03N63kk=;
        b=j7sv/IAKZLSDmj0wlMPD5cPf7Rz0tRPGVxkdBHudbOEibpp+IIu/In0r9t7c8vfg37
         8d1WWXxHtahZJCryuZ0QhsP8T7MiQEfxvUYw0jv55vsz4JTobSQ4lfY7XFI7mvo/2hPJ
         EOp3bgvRODj/g2QOxobMrvwz5s9NN4KoXS0YEHx3Pn9EQVxNJT413fj5RNOg+OXLwKH+
         LQeYXwhMnLo/ZZEqLiObupdXrrKPntfmtdgo20o7S0KmSyXdJhnkHKThTfMj8FXFcrpT
         AjSk8ZqI3/hRLgbAeTIbNP/6q5I+F+voPFm7uhSmAldHKCEFvouIULfQB8uyhGbX1yMZ
         3Akg==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

[ Please keep me in CC as I'm not subscribed to the list]

HI all,

I=E2=80=99m looking for a =E2=80=9CC=E2=80=9D program for big number(around=
 100 digits)
arithmetic i.e.
mltiplication\addition\division\subtraction\exponentiation and
modulus, etc.

Basically I want to use it for =E2=80=98Extended Euclidean Algorithm=E2=80=
=99 and
public-key encryption with the RSA algorithm which typically requires
larger integers and it will not fit into C data types. Can someone
point me the to the either source code or logical explanation on how
to handle big number arithmetic?

--=20
Thanks,
Sekhar
