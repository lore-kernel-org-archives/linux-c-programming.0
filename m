From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Basic C encryption
Date: Tue, 8 Jul 2003 20:52:08 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030708185207.GR20605@lug-owl.de>
References: <DDFD9B60F648D411AD670000F80822EA03FCAAB6@mail7.monmouth.army.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sxhug0Teuf3tiWmo"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DDFD9B60F648D411AD670000F80822EA03FCAAB6@mail7.monmouth.army.mil>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--sxhug0Teuf3tiWmo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-07-08 13:48:14 -0400, Huber, George K CECOM RDEC STCD SRI <Geo=
rge.K.Huber@us.army.mil>
wrote in message <DDFD9B60F648D411AD670000F80822EA03FCAAB6@mail7.monmouth.a=
rmy.mil>:
> Just add one.

[...]

Nice examples, but mostly worthless. It was asked to "encrypt" a
function (or a class/instance), not a file. Starting with the binary,
you'd first need to find your function/method. Note that objects per se
don't need to have _one_ block of bytes in the binary file. After
loading the binary you'd need to modify the text segment (forget on
objects and their instances). Many systems don't even allow you to
modify pages marked as executable (X^W -> Executeable xor writeable).

And even if you'd manage to make it up to here - the binary file might
be hard to "decrypt", but the CPU needs to execute the "real", decrypted
function. Send a SIGABRT (-> application will core dump) and load the
core into your favourite debugger - the hidden function now read as
decrypted:)

Well, SIGABRT is SIGIGNored? No problem - a little LD_PRELOAD library
containing the signal function will easily solve that:)

Who teaches such bad and evil hacking methods? Think real life! So many
vendors produce a whole *shit* of applications (w/o sources) and
oftenly, it's simply no way to make them to debug their shit. If you
need to run it (or need to make it run, even if there are grave bugs),
you need to work around them (including fixing the binary application,
substituting library functions and all the fun...).

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--sxhug0Teuf3tiWmo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/CxLXHb1edYOZ4bsRAmtHAKCS2RVGMWM0q2ecfcPwU/GK3WZtiQCggOyN
l4QzLJ/ZJIy1vVRp/NpLKLU=
=UcVI
-----END PGP SIGNATURE-----

--sxhug0Teuf3tiWmo--
