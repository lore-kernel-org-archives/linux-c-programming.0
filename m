From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: linux and pthread
Date: Thu, 11 Nov 2004 09:18:57 +0100
Message-ID: <20041111081857.GL10443@lug-owl.de>
References: <419273DC.3050208@bic.mni.mcgill.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oeABDT9Upm19aBf"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <419273DC.3050208@bic.mni.mcgill.ca>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux c programming list <linux-c-programming@vger.kernel.org>


--2oeABDT9Upm19aBf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-11-10 15:02:36 -0500, Simon Drouin <sdrouin@bic.mni.mcgill.ca>
wrote in message <419273DC.3050208@bic.mni.mcgill.ca>:
> Not sure it is the best place to post that. Tell me if you have any=20
> other suggestion.

At least, it's appropriate to ask here.

> I'm running Mandrake 10 and developping a C/C++ program using multiple=20
> threads. My program has a main thread that manages UI and a second=20
> thread is in a loop that continuously grabs data from a serial port. The=
=20
> communication between the 2 threads is controled by a mutex. The=20
> grabbing thread holds the mutex for most of the time in its loop. My=20

I guess here's the real problem.

> problem is that when the main thread tries to lock the mutex, it is=20
> suspended forever,  like if the grabbing thread didn't release the mutex=
=20
> lock for long enough for the main thread to lock it.

Why do you keep the lock locked? Most of the time, mutexes tend to be
unlocked nearly always and only get locked if (eg. for your example) the
serial thread got a byte and queues it in for the UI thread for
displaying/dispatching/whatnot.

Maybe the trick is to actually use a condition here: let the UI thread
(or a new one) just sleep on the condition. If you got a byte, lock a
mutex (if there are other placed that can access your global serial byte
buffer), queue it in, unlock and wake up the thread(s) sleeping in the
condition. Then, all of them (or only the UI thread) can re-display the
buffer state.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--2oeABDT9Upm19aBf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBkyBwHb1edYOZ4bsRAjgjAJ9LxpUlVM4fdrgvzLhFwQFLFXuxJgCfZmyL
hwPjQl94FOzF2a4e8hdw6a8=
=BhZH
-----END PGP SIGNATURE-----

--2oeABDT9Upm19aBf--
