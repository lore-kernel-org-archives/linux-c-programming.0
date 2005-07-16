From: Steven Smith <sos22@cantab.net>
Subject: Re: Variable to sizeof function.
Date: Sat, 16 Jul 2005 09:26:40 +0100
Message-ID: <20050716082640.GA1623@localhost>
References: <6a00c8d505071515355f041394@mail.gmail.com> <20050716064421.85333.qmail@web31901.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050716064421.85333.qmail@web31901.mail.mud.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Vikas S <vikas_soolapani@yahoo.com>
Cc: Steve Graegert <graegerts@gmail.com>, Rechberger Markus <mrechberger@gmail.com>, linux-c-programming@vger.kernel.org, sos22@srcf.ucam.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thanks, This is a workable solution.
> But the issue is I've some 100+ structures. So, writing
> a if or case is going to be difficult.
>=20
> b) Yes. I want to pass a structure name. ie, make sizeof
> accept a variable.=20
You can't do this in C, but you might be able to achieve something
similar using gdb, if performance isn't important.  If your
application is compiled with debug symbols, you can go ``inspect
sizeof(struct my_struct)'' from the gdb prompt, and get the number
you're looking for; you may be able to automate this.

If your application doesn't have debug symbols, then the information
you need isn't preserved by the compiler, so you're stuffed.

Steven.

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC2MTAO4S8/gLNrjcRAk00AJ9Ba+NIXoP6A33wCQeEmsDb+isqTQCg0xlk
gLO1IcvNxHF/COohgC6BFbE=
=6OS8
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
