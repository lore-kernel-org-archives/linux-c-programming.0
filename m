From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: warnings appearing during preprocessor string concatenation (##)
Date: Thu, 6 Mar 2003 14:10:47 +0100
Sender: linux-newbie-owner@vger.kernel.org
Message-ID: <20030306131047.GA17788@schiele.local>
References: <b45mva$re8$2@main.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-newbie-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b45mva$re8$2@main.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: Jamie Risk <jamie_risk@yahoo.ca>
Cc: linux-gcc@vger.kernel.org, linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2003 at 03:34:39PM -0500, Jamie Risk wrote:
> I have the following line in my code,
>=20
> #define FEATURE(select)     feature_structure. ## select ## .member
>   ...
>    FEATURE(test);
>=20
> and when I run it through the compiler (gcc 3.2.2 on Linux x86) I get the
> _warning_
>=20
>   file.c:111:32: warning: pasting "." and "test" does not give a valid
> preprocessing token
>   file.c:111:32: warning: pasting "test" and "." does not give a valid
> preprocessing token
>=20
> If I look at the preprocessor output, (gcc's -E option) it produces what =
I'm
> hoping for, although I'd like to avoid the warning.  Suggestions?

Just remove the '##' operator.  The preprocessor is right here, there
is nothing to concatenate to a token in your example.

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iQEVAwUBPmdI18QAnns5HcHpAQE6awf+JpGHaD18oeDEdz0fgadM3jES0rJ7R/mp
Q9NywLBh4qPtYCC+8dE2Zibtr5RT5RkwYyVMp7szucDBx6juWmgzgLIfk9F1ac9C
cD12h3tk5NAUN0Y1wttDYs6ITQL9cSKQ0HpdSho2PL0x1uqgQB0zA2sCYK3LKVI6
qUk38VbZR/p+DJrqGLqlOrb3vZl2USvMkZVsOj5NuuoOHyAnCS0W6aTmoT/RUOv2
DVoOvXE4mkUQDgmGsNUV5sU0PsO0p9KicA23U9cU+82O+91LlLv1tSn2HT0x/4cG
TPTv86bbGsY+V8L2XPi6vsqp1UTAMA1IO/H/p9N0K2LUojiSwkDRqQ==
=1c79
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

-
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
