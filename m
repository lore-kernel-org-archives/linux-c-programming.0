From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: File [Pointers vs Descriptors]
Date: Wed, 19 Jan 2005 09:38:43 +0100
Message-ID: <20050119083843.GT28037@lug-owl.de>
References: <50C05B7AA7D6924FB5E384EF14BC647B495FA2@inba1mx2.corp.emc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5XwDZYQieeN6n9K"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50C05B7AA7D6924FB5E384EF14BC647B495FA2@inba1mx2.corp.emc.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--f5XwDZYQieeN6n9K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-01-19 06:53:00 -0000, Honnavalli_Sreevathsa@emc.com <Honnavall=
i_Sreevathsa@emc.com>
wrote in message <50C05B7AA7D6924FB5E384EF14BC647B495FA2@inba1mx2.corp.emc.=
com>:
> Can someone pls let me know the difference b/w file pointers and file
> descriptors?? In what way do they differ intenally?

A file descriptor is an integer value, which is meaningful to the
operating system kernel. It is commonly used via

open()
read()
write()
close()

These functions use simple char buffers and upon read/write, you specify
the number of bytes to read.

File pointers are a libc thing. Internally, they contain a buffer, which
is used to allow eg. for line-buffered access (so you can read a whole
line of textual input without knowing in advance how long it is). File
pointers are handled by the "f" function:

fopen()
fgets()
fputs()
fclose()

However, there are a lot more subtle details behing it... But the short
version of "when shall I use this or that" is: if you handle textual
data, line by line, use the "f" functions. If you use raw binary data,
use the non-"f" functions instead.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--f5XwDZYQieeN6n9K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB7hyTHb1edYOZ4bsRAuQqAJ9ixwR7QuGqfsq5tTDVAe5PtdC+wwCfd9Q7
M8ZpCQH+fbgyYa1/fM3XUtE=
=CNf5
-----END PGP SIGNATURE-----

--f5XwDZYQieeN6n9K--
