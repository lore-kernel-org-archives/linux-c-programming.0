From: Matthew Harrison <matth@3d-computers.co.uk>
Subject: Re: ncurses help
Date: Thu, 11 Sep 2003 09:06:09 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030911080609.GB29005@3d-computers.co.uk>
References: <20030910122511.GC15788@3d-computers.co.uk> <Pine.LNX.4.56.0309101206290.3269@halley.i-veritel.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.56.0309101206290.3269@halley.i-veritel.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
To: "William N. Zanatta" <william@veritel.com.br>
Cc: linux-c-programming@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

thanks William,
	That has solved the problem totally. I know that it seems quite
simple, but I'm finding ncurses quite hard to learn the basics of because
i've never programmed any sort of gui before.

it's taking some hard work.

thanks again, I'm on my way.

On Wed, Sep 10, 2003 at 12:32:11PM -0300, William N. Zanatta wrote:
>=20
>   Try changing getstr() to wgetstr(). When doing window manipulation you
> must use the functions with support to WINDOW pointers. If you don't,
> you'll get the results you're experiencing, because getstr() comes into
> action when it is reached while wgetstr() only comes into action after the
> wrefresh().
>=20
>   Also, it showed some problems with placement of the stuff.
>=20
>   You have set login_window to (login_win.startx, login_win.starty) from
> 0,0 of the mainscreen. But, when you write stuff into that new window, you
> must set the (x,y) from the login_window. iE, here I had:
>=20
>   login_win.starty -> 7
>   login_win.startx -> 25
>=20
>   thus, after creating the window, (25,7)-terminal turns to
> (0,0)-login_window.
>=20
>   That's it you're working with absolute values when you should work with
> relative.
>=20
>   After all your code turned to...
>=20
> <inventory.c>
>    was
>         attron(COLOR_PAIR(1));
>         mvwprintw(login_window, ..., ..., "Username: ");
>         mvwprintw(login_window, ..., ..., "Password: ");
>         attroff(COLOR_PAIR(1));
>=20
>    changed to
>=20
>         wattron(login_window, COLOR_PAIR(1));
>         mvwprintw(login_window, 1, 1, "Username: ");
>         mvwprintw(login_window, 2, 1, "Password: ");
>         wattroff(login_window, COLOR_PAIR(1));
>=20
>    --------
>=20
>    was
>         echo();
>         wmove(login_window, ..., ...);
>         getstr(username);
>         wmove(login_window, ..., ...);
>         getstr(password);
>         noecho();
>=20
>    changed to
>=20
>         echo();
>         wmove(login_window, 1, 11);
>         wgetstr(login_window,username);
>         wmove(login_window, 2, 11);
>         wgetstr(login_window,password);
>         noecho();
>=20
> </inventory.c>
>=20
>   Hope I've helped... =3D]
>=20
>   Just a note, you should use wgetnstr() to limit the length of input
> data.
>=20
>   william

--=20
Mat Harrison
Technical Developer
3d Computer Systems Ltd.
matth@3d-computers.co.uk

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (OpenBSD)

iD8DBQE/YCzwmbMTrp/jhicRAu19AJ48BWPfZcgCsVxtmsnXpLyxoV56XQCffMJF
WUI2Kfmz0BWq5P3srY7H/Bs=
=X3P0
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
