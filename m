From: Miguel Griffa <mgriffa@technisys.com.ar>
Subject: Re: start learning gcc ... how to ?
Date: Tue, 9 Apr 2002 10:04:44 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020409130444.GA276@wotan>
References: <200204091150.g39Bo4825347@jupiter.centrin.net.id>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <200204091150.g39Bo4825347@jupiter.centrin.net.id>
List-Id: <linux-c-programming.vger.kernel.org>
To: fox@sby.centrin.net.id
Cc: linux-c-programming@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,=20
	gcc has lots of options, but theses are (almost) all I've needed:

-Wall  (Warnings:ALL)
-g	(generate debug info)
-ggdb	(idem but with gdb extensions)
-o 	(output to file)
-c 	(compile only, don't link for makeing .o)
-ansi 	(kindda obvious)

Well, I know is little but it might help you to start
I'd strongly recomend you reading a make tutorial


On Tue, Apr 09, 2002 at 06:50:05PM +0700, fox@sby.centrin.net.id wrote:
> Hi...
>=20
> I'm newbie here...:)(also newbie in Linux)
> I  know  a  little  about C/C++ programming (in DOS) and now I want to
> learn  about GCC, where I can find some (good) tutorials about it (urls
> please)?
> may be I need some example for compiling (and debugging) with
> gcc...because gcc's option too many and it's not simple I think.
>=20
> And, also, where I can find some good tutorials about using KDevelop ?
>=20
> thank you...
>=20
> --=20
> Best regards,
>  adwin
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-program=
ming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8subrwMrEAQ/L9toRAnNcAJ9Ja12pigJwrVf0DOO2wDWpBx6K5ACfZepj
MFqUlPVFgnxqg15jl9+ywHw=
=J8WF
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
