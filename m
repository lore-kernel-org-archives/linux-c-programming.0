From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: About combined console/X11 programs
Date: Wed, 7 Aug 2002 15:30:02 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020807133002.GZ758@lug-owl.de>
References: <02080504255200.24029@linux> <20020806180852.GX758@lug-owl.de> <15696.18623.378185.959744@cerise.nosuchdomain.co.uk> <02080622481000.01227@localhost.localdomain> <15697.3024.599591.170344@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="csehs8AeUiGwWnbr"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15697.3024.599591.170344@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--csehs8AeUiGwWnbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-08-07 13:00:16 +0100, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <15697.3024.599591.170344@cerise.nosuchdomain.co.uk>:
> +Rudymartin wrote:

> > thats why I need to use the meta and control keys.
>=20
> GUI toolkits don't normally report events for pressing and releasing
> modifier keys (Ctrl, Shift, Meta etc). Instead, the modifiers are
> normally reported as flags with each key or button event.

I won't go into those my-one-is-bigger-than-... wars, but using GTK+, I
can easily fetch single keypresses/keyreleases. Look at this snipplet:

static gint
keyboard_event_handler(GtkWidget *widget, GdkEventKey *event, gpointer data)
{
	switch(event->type) {
		case GDK_KEY_PRESS:
			printf("Press:   0x%04x\n", event->keyval);
			break;
		case GDK_KEY_RELEASE:
			printf("Release: 0x%04x\n", event->keyval);
			break;
		default:
			/* Make compiler happy at using enums */;
			break;
	}

	return TRUE;
}

window_main  =3D gtk_window_new(GTK_WINDOW_TOPLEVEL);
=2E..
gtk_signal_connect(GTK_OBJECT(window_main),
	"key_press_event",
	GTK_SIGNAL_FUNC(keyboard_event_handler),
	NULL);
gtk_signal_connect(GTK_OBJECT(pl_window_main),
	"key_release_event",
	GTK_SIGNAL_FUNC(keyboard_event_handler),
	NULL);
=2E..

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--csehs8AeUiGwWnbr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9USDZHb1edYOZ4bsRAro6AJsHSod3K0v29i+rduf01lClJMujAwCgjXYp
NW2LYT5au+8e7gRhtMYSkmY=
=J0A4
-----END PGP SIGNATURE-----

--csehs8AeUiGwWnbr--
