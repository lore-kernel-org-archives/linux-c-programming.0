From: szonyi calin <caszonyi@yahoo.com>
Subject: Re: Unix Time
Date: Mon, 27 Sep 2004 12:59:47 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040927105947.64643.qmail@web52904.mail.yahoo.com>
References: <20040927051048.25873.qmail@web52902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040927051048.25873.qmail@web52902.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

 --- Ankit Jain <ankitjain1580@yahoo.com> a =E9crit=A0:=20
> well still the problem exists
>=20
> 7360568 sec how to interpret this no. in seconds?
>=20
> do u know about any manula to understand htis unix
> time
>=20

The linux's libc manual covers afaik the topic of time=20
functions in linux/unix
also here you may find some informartion
http://www.unix.org/single_unix_specification/onlinepubs/000095399/func=
tions/contents.html

to convert a number of secconds in actual time:
a minute has 60 seconds
an hour has 60 minutes =3D 3600 seconds
a day has 24 hours =3D 86400 seconds

Hope this helps

> thanks
>=20
> ankit
>=20
>=20
> =20

=3D=3D=3D=3D=3D
--
A mouse is a device used to point at=20
the xterm you want to type in.
Kim Alm on a.s.r.


=09

=09
	=09
Vous manquez d=92espace pour stocker vos mails ?=20
Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/

Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez toutes les nouve=
aut=E9s pour dialoguer instantan=E9ment avec vos amis. A t=E9l=E9charge=
r gratuitement sur http://fr.messenger.yahoo.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
