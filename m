From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: The stickybit!!
Date: Fri, 17 Dec 2004 16:20:27 +0100
Message-ID: <20041217152027.GC16958@lug-owl.de>
References: <1103265276.6880.8.camel@myLinux> <20041217093402.GW16958@lug-owl.de> <1103279900.3797.13.camel@myLinux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XqFDY9bHNWRmuMQr"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1103279900.3797.13.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming <linux-c-programming@vger.kernel.org>


--XqFDY9bHNWRmuMQr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-12-17 16:08:20 +0530, Jagadeesh Bhaskar P <jbhaskar@hclinsys.c=
om>
wrote in message <1103279900.3797.13.camel@myLinux>:
> On Fri, 2004-12-17 at 15:04, Jan-Benedict Glaw wrote:
> > On Fri, 2004-12-17 12:04:36 +0530, Jagadeesh Bhaskar P <jbhaskar@hclins=
ys.com>
> > wrote in message <1103265276.6880.8.camel@myLinux>:

> > > 	Is there a way to findout the data if residing in swap area after the
> > > process is terminated, using a C program??
> >=20
> > Not (easily), at last. You can try to open the swap area(s) with
> > O_DIRECT and prepare a copy of it. However, you don't know which pages
> > were owned by the terminated process formerly so you only can step
> > through all the bytes and hope to find something useful...
> Im not able to get that part completely. Can a bit more explanation be
> given!!

Well, facts about swapping (or paging, what Linux actually does):

	- After detecting memory shortage, some chunk of RAM is put onto
	  some stable medium (most probably partitions of HDDs or swap
	  files).
	- You don't know IF memory of some application actually gets
	  paged out. Though, you can try to force that by allocating and
	  using lots of memory, but you cannot force a specific page to
	  be swapped out.
	- If a page was swapped out, you don't know (a) which memory
	  region of the process it belonged to and (b) to which area of
	  the swap space the given page was written to.

If you attempt to get access to the swap area(s), you want your
application to *not* swap. If you're root (certainly you need to be
root: only a moron would allow ordinary users to directly access block
device's partitions...), you may lock all your address space to be
non-pageable. Additionally, you want that no other apps get paged out:
this would possibly overwrite important data you want to recover.

O_DIRECT is a method to tell the kernel you know better about what needs
to be cached -- and what not. Because you're reading and writing a whole
lot of data (typically several hundreths of megabytes), you don't want
to pressure that into RAM. Just tell the kernel the data is never ever
accessed again, so there's no point in wasting RAM for it (which could
make other applications to swap more).

The same thing counts for your private output file, of course.

But even then, you've got a large file with a lot of binary garbage. I
guess it'll be fun (TM) to recover useful data from it. Actually, I've
played with that some time ago by searching for previously issued input
(while forcing a near-out-of-memory situation). It works, but honestly,
I hadn't been able to actually *find* the information in question
without priorly knowing what to search for...

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

--XqFDY9bHNWRmuMQr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBwvk7Hb1edYOZ4bsRAqhyAJ9dY0RbDe3i2csGKxHKB0cg2kCZMwCcC7xf
xLAYUq/+lt9WhVB2XbM3KZw=
=jzUN
-----END PGP SIGNATURE-----

--XqFDY9bHNWRmuMQr--
