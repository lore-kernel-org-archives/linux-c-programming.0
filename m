From: =?iso-8859-1?Q?H=E5kon?= Hallingstad <hakon@ion.no>
Subject: Re: Order preserving encryption of numeric data
Date: Tue, 17 May 2005 13:47:20 +0200
Message-ID: <20050517114720.GA19119@hydrogen.ion.no>
References: <4e829fd30505170235691da664@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4e829fd30505170235691da664@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

The ordering breaks the strength of any cipher.

Let us assume we know crypt(a), and want to find 'a'. Then we could do
a binary search for 'a' starting with a =3D M/2., where M :=3D
max(crypt(a)). And so we could find 'a' after lg(M) iterations.

If this cipher would have comparable strength to today's ciphers, this
would mean lg(M) ~ 2^90., or M ~ 10^(3 10^26), unrepresentable by
todays computers.

Regards,
H=E5kon Hallingstad

On Tue, May 17, 2005 at 03:05:52PM +0530, Anindya Mozumdar wrote:
> Hi,
>     Dont know whether this is an appropriate question to ask in this
> list, but someone experienced in dealing with such a situation could
> help.
>=20
>     I would like an algorithm which will encrypt/decrypt numeric data
> using a key, such that after encryption their orders will be
> preserved,i.e, if crypt(a) denotes the encrypted form of a, and a < b=
,
> then crypt(a) < crypt(b). ( Note that this assumes that the algorithm
> will produce crypted data which can actually be ordered ). Of course,
> something like a -> ma + n, where m and n are constants would work,
> but I would like something more nontrivial.
>=20
>     The order preserving property is necessary as the crypted data
> will be stored in a database, and I would like to issue database
> queries on them. ( The other solution is to retrieve all values from
> the database, decrypt them, and find the appropriate subset, but that
> would be too expensive ).
>=20
> Thanks.
> Anindya.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
