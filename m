From: Richard Webb <rcsw@periscon.com>
Subject: Re: parsing with fscanf().
Date: Wed, 11 Sep 2002 23:14:26 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200209112314.47300.rcsw@periscon.com>
References: <20020911212428.A1167@neutrino.particles.org>
Reply-To: rcsw@periscon.com
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_2GOARTBICUAJCWIEYT9W"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020911212428.A1167@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: Elias Athanasopoulos <eathan@otenet.gr>
Cc: linux-c-programming@vger.kernel.org


--------------Boundary-00=_2GOARTBICUAJCWIEYT9W
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Using flex :

%%
[,\t]+          putchar(',');
[,\t]+$		

will replace multiple commas and tabs with a single comma.

R.

On Wednesday 11 September 2002 7:24 pm, Elias Athanasopoulos wrote:
> Hi,
>
> A really newbie question, but I have no time for research (my deadline
> is counted in hours).
>
> I have to parse a text file, which has been exported from MS Excel (I
> have no access to this thingie) using TABs as delimeters. The text
> is like:
>
> 4	3	2.0
> 5		1.2
> 4	3	2.4
>
> I use fscanf() to insert the data to my structures, but the "gap" (between
> 5 and 1.2) breaks the sequence. fscanf() places the 3rd column to the 2nd
> field in my structure.
>
> Is there a trivial way to bypass the problem using fscanf() or I have to do
> the parsing using read()?
>
> Elias
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9f8BJbwZ8a5Bkl7QRArNfAJ0RwoHwJvl8DPlXYQld7rZdDOnTYQCfeJL8
fQ+CUQycjmtZ0iLxOKlZHXc=
=Jolb
-----END PGP SIGNATURE-----

--------------Boundary-00=_2GOARTBICUAJCWIEYT9W
Content-Type: application/pgp-keys;
  name="my pgp key"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=public_key.asc

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.0.7 (GNU/Linux)

mQGiBD1qJR4RBADH+SaoVG/n+XJ3TuwWsr9WEkxoC6zbc4O/NBR3afXxXeqG8TMY
aQklT9MX3+HlHXKpXVlSdqxg/1DUCMB3Uv1xJSWlVpICxnGW5Xbj7WtfJntZmgQo
Db44aQLEBGtgFLfVp8gL3w2Vtt6IO40z3EMT/B1mjD/uH9e7vOFFw9gBXwCgqxmj
13GZkCv5Pu8VoAOh98TP7gkEAKBUDrN9+pXijJIY7F0VwNwM6n7TUXACkhUFA1oA
fgWz1nV6U2TtZTdBFFZkBg145aJkwjjoo1iRc49wSL+TILyM3mdUujCViGlZBmsF
vX8Jz+JB32Of1jUolMcE3/DPubyu96lgvkzKo5WGx504SJweFizuikYTmYvF/ocS
ez0nBADFuvuZgd7DqCO3xOJXH7UufCsIUS4uSrirONZ/wYVmmJgLkChSyKez4YEI
5WRlmnyUj6FGZXNiU7DdPcvy4+g+zB960BakvXiQupIr29L80EbEnxusUdrO4HzS
X4/ErlIrLpUk27GgR9yacxQx8IqQc+yvg+GHTAtJR49YevKhZrQgUmljaGFyZCBX
ZWJiIDxyY3N3QHBlcmlzY29uLmNvbT6IWQQTEQIAGQUCPWolHgQLBwMCAxUCAwMW
AgECHgECF4AACgkQbwZ8a5Bkl7QYRwCfRUnD8VVHIRyogqE1kr65pdL/dIcAoKY9
r9gpo5LXZB3krxlaIrY1rU5VuQINBD1qJZwQCACUqy+ZTddDsuzkYyn9dkQF45t+
celVJ5F5czpM81cC5K/j/BKcPrenEq2ga3hsBuI4Q/SHKzuIbS1jbSq+BBKJyRlA
jG3hx5pF9EDrmRMqF7h1HDj7a6gJPQHUagIt0kxCkPttA0vUwVJWXWptX4Oqc2Zv
xGCnrf01YeaB2T0mS7ygnwOxtG2pk3O0SySchc3AfMLjwY6OV00VuZEpbOz9BbWw
09FBP7R2eAeXtQSncUb3w1kLZ/YEe9TKq5Jv9sUVtrLgws9uJs6moLSAArKctabS
QQWmNH/kTZVqszanCX/O4dy4n61+giusxrJy/RkYpwRvSSKRHOXzg1aNTjy7AAMF
B/9g18zIAVeKx3vC6ez23ZbgAdUJmE16gxQYbSSckqFcyEips9DNrcq+vVZ+VZgy
mmJKjNURVaHJcZ+mlgs0ELgqe6X4LL3gsGP6WocaaWrS7lKLtSV1ITSHkDLTW444
9wBhjfAIRsUEazVyQNkNt5Id7h7vGhyo8WIqEoYGRc6HAZlTQioB776x0RpDQKEc
+KOGIwy8pnTC/0WO4wfNEP/0eRN4ybMi/rssBdkgMGKq9FX60/qUzbjc8av6hyDN
0xshhToCH4D/DVTUd7+6Py9+JOxOXHje19YrdxZ6id1uSgmshJHrAyPYAXeKgbis
TPqlMpWw9mESUep1/9LMv0A7iEYEGBECAAYFAj1qJZwACgkQbwZ8a5Bkl7Tn0QCf
d4oinQuwwVS9aa1FE3vZNiEtJMkAn3seOaRA3d0BXs5uQE6ld/YQZbEt
=FQcH
-----END PGP PUBLIC KEY BLOCK-----

--------------Boundary-00=_2GOARTBICUAJCWIEYT9W--

