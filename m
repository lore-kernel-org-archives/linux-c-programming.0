From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: wcscat problem
Date: Thu, 19 Jan 2006 19:24:21 +0100
Message-ID: <20060119192421.2674b02a.leslie.polzer@gmx.net>
References: <20060119163800.1b45d984.leslie.polzer@gmx.net>
	<d9def9db0601190957v78b9ca71yaac25a0c7ef43d09@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_Jan_2006_19_24_21_+0100_=iNxDkEAi+I3l7.i"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d9def9db0601190957v78b9ca71yaac25a0c7ef43d09@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Markus Rechberger <mrechberger@gmail.com>
Cc: linux-c-programming@vger.kernel.org

--Signature=_Thu__19_Jan_2006_19_24_21_+0100_=iNxDkEAi+I3l7.i
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Jan 2006 18:57:57 +0100
Markus Rechberger <Markus Rechberger <mrechberger@gmail.com>> wrote:

 | some headers are missing within your source too.
Obviously, but this was intended to be a minimal example, and
most compilers will get it without the headers.

 | it should look like the code attached then it will work.
I'm not sure whether you understood my problem.
Perhaps I should have made myself clearer:

The code compiles and runs.
The problem ist that the wcscat operation seems to not overwrite
the terminating null byte of the first string "abc" and thus
printf will only print "abc" instead of "abcdef".  To clarify this
I added 4 to the string -- and lo, the missing half is there, but a
null bytes separates both halves.

So my question is: why does strcat remove the \0, but the wide char
pendant does not?

Leslie

--=20
gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289

--Signature=_Thu__19_Jan_2006_19_24_21_+0100_=iNxDkEAi+I3l7.i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDz9lXn/ep3VLXAokRAoDbAKCsVelHaiuXY4vLk237/2Zzkv4A5gCbBWkC
IQNVJjfziTZkjT1ZvOsrALM=
=loMZ
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Jan_2006_19_24_21_+0100_=iNxDkEAi+I3l7.i--
