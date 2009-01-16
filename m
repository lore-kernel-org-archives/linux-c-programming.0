From: ben <brouits@free.fr>
Subject: Re: extract the data from buffer
Date: Fri, 16 Jan 2009 18:47:08 +0100
Message-ID: <4970C81C.5030308@free.fr>
References: <1f714d50901160754m4568738ev27879b0e9ba72fab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1f714d50901160754m4568738ev27879b0e9ba72fab@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org


this /RE/ should match the desired 3 numbers (inside parenthesis):

/^([0-9]*) of ([0-9]*) max .* ([0-9]*\.*[0-9]*)% of.*/
- ben
Jai Sharma a =E9crit :
> Hi
>=20
> I want to extract variables values from a string buffer. Can anyone
> pleease tell me how can i do that.
> In C how to use perl like regular expressions.
>=20
> [...]
> SIP/63.111.11.135-09 tsihomephoneservice@ Up      Queue(tsihomephones=
ervice||||9
> 10 active channels
> 5 of 200 max active calls ( 2.50% of capacity)
>=20
>=20
> I want to extract three numeric data fields from last line:
> as
>=20
> %d of %d max active calls ( %l% of capacity)
> result : 5,200,2.50
>=20
> means 2.5
>=20
>=20
> Thanks and Regards
>=20
> Jai
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
