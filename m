From: wwp <subscript@free.fr>
Subject: Re: Function call
Date: Wed, 1 Mar 2006 08:39:13 +0100
Message-ID: <20060301083913.73d0fb2c@localhost.localdomain>
References: <CB6A009F461BE24BA3E10DAC95A4B25E12CE1A73@kormail01.in.bosch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=Sig_NzGjDsmdewOSAj5RMwaMNfh;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CB6A009F461BE24BA3E10DAC95A4B25E12CE1A73@kormail01.in.bosch.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--Sig_NzGjDsmdewOSAj5RMwaMNfh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Subbulakshmi,


On Wed, 1 Mar 2006 10:54:03 +0530 "Subbulakshmi Sadagopal (RBIN/EDS2) *" <S=
ubbulakshmi.S@in.bosch.com> wrote:

>=20
> Hello,
>=20
> I have a doubt regarding the following code. There is a void function
> funckey().
>=20
> void funckey()
> {
> ;
> }
>=20
> void main()
> {
> funckey;
> funckey();
> }
>=20
> During execution, the second statement calls the function funckey().
>=20
> What does the compiler do in the first statement funckey?

It evaluates the expression "funckey", which is just a pointer to a function
(as char* foo; is a pointer to char). Function names can be used in some few
situations (passed as parameter to some functions for signal/callback
hooking for instance).


Regards,

--=20
wwp

--Sig_NzGjDsmdewOSAj5RMwaMNfh
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.7 (GNU/Linux)

iD8DBQFEBU+hadgnuQFKG88RApnlAJ9m85j9yT4F91yhnQ6llbP/h7Q65ACffX5t
g/WlkPCMG8a/JzX13bKBd2s=
=VW/4
-----END PGP SIGNATURE-----

--Sig_NzGjDsmdewOSAj5RMwaMNfh--
