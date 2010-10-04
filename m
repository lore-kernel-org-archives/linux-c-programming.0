From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: printf and long double
Date: Mon, 4 Oct 2010 02:44:26 +0100
Message-ID: <19625.12666.629645.64590@cerise.gclements.plus.com>
References: <20101003225652.GA3618@dinofilaria.home>
	<AANLkTi=rmOmUX2cKxdjPwB1Bo3233TYqhR8O=HN1AnV5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=rmOmUX2cKxdjPwB1Bo3233TYqhR8O=HN1AnV5@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gedare Bloom <gedare@gwmail.gwu.edu>
Cc: Nanakos Chrysostomos <nanakos@wired-net.gr>, linux-c-programming@vger.kernel.org


Gedare Bloom wrote:

> > =A0 =A0 =A0 =A0printf("%llf %lle\n",c,c);
>=20
> I think you want %llg instead of %llf.  g is for double-precision, f
> is for single.

That is incorrect. The difference between %f, %e and %g is the
notation used.

%f uses normal decimal notation, %e uses scientific (exponential)
notation, %g uses either notation depending upon what is appropriate
for the magnitude of the value, specifically: %e for values whose
exponent is greater than the precision or less than -4, %f otherwise.

It is impossible to pass a single-precision "float" to printf() etc
due to C's implicit conversion rules: passing a "float" as an argument
whose type isn't specified by a function prototype results in the
value being converted to "double".

Also, using the "ll" modifier for floating-point conversions ("%llf"
etc) is a GNU extension. The C99 standard specifies the "L" modifier
for "long double" conversions ("%Lf" etc); the "ll" modifier only
applies to integer conversions.

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
