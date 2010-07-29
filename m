From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: Error in compiling a module
Date: Thu, 29 Jul 2010 18:21:45 +0200
Message-ID: <87lj8u9s2u.fsf@erwin.mina86.com>
References: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com>
	<AANLkTikqZ5YWqgnHbB3Y03kZfC0OpJ7POYKSeU6JESVt@mail.gmail.com>
	<AANLkTimkzbse8B0_kUMbaP-DT8Zm1CnZxOnCA+S5CHnE@mail.gmail.com>
	<AANLkTimeJrRs4Bd1aw--FKPYyqcuu8_O-Xi5G0FOh0yd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-face:face:x-url:x-pgp-fp:x-pgp:date:in-reply-to
         :message-id:user-agent:mime-version:content-type;
        bh=2sFZGMl/rO6Goh2zQ1XtkV4vC5XLPNJyI0M9szy6cKI=;
        b=lySJz++8RDazdWZw9/ZtUthUJ1iQRv+w/oaQcin+EyaK8LePVtqUO9q33gJWnFZkU9
         UNE2DwwHHenD/KMESzZNvu6HIkt58i2LtTHnSSxQX9+/om/UeWVGJESXOHkKzk7tYtQi
         spduAqWR6ixCSP1HBkp/LqMxejdi6n3PQ+ius=
In-Reply-To: <AANLkTimeJrRs4Bd1aw--FKPYyqcuu8_O-Xi5G0FOh0yd@mail.gmail.com>
	(Mulyadi Santosa's message of "Thu, 29 Jul 2010 11:51:04 +0700")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Mulyadi Santosa <mulyadi.santosa@gmail.com>
Cc: Balachandar <bala1486@gmail.com>, kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

--=-=-=
Content-Transfer-Encoding: quoted-printable

Mulyadi Santosa <mulyadi.santosa@gmail.com> writes:

> Hi...
>
> On Thu, Jul 29, 2010 at 00:28, Balachandar <bala1486@gmail.com> wrote:
>> Thank you for your help. I figured out the mistake. I missed a
>> semicolon in one of the header file that was included in the file that
>> showed the error.
>
> I think it would be great if you and some guys here write about
> "mistakes I ever did when I write kernel codes" in kernelnewbies
> wiki....so that others might learn about it.

Personally, I see it as a suggestion for a wikibooks or similar.

=2D-=20
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=3D./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAkxRqqQACgkQUyzLALfG3x6yVACgj/mqMXs6NPjB5fZtNvP/XWRX
fBMAn05bcssh0vb2BzRbFi3jGk16GVrI
=2tJ1
-----END PGP SIGNATURE-----
--=-=-=--
