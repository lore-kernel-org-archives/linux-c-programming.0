From: "Steven Smith" <sos22@cam.ac.uk>
Subject: Re: Implementing a file counter (like "ls | wc")
Date: Tue, 13 Apr 2004 13:52:58 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040413125258.GA2565@archibold.chu.cam.ac.uk>
References: <20040407183558.77510679.alphex@crew.org.ru> <4074148E.9060205@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4074148E.9060205@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> while ((pFile=readdir(pDir))!=NULL) {
>      sprintf(szBuf, "%s/%s", pPath, pFile->d_name);
>      stat(szBuf, &statFile);
>      if (S_ISDIR(statFile.st_mode))
>         continue;
If the only reason you're statting the files is to check whether
they're directories, then you can save yourself a system call per
file:

while ((pFile=readdir(pDir))!=NULL) {
     if (pFile->d_type == DT_DIR)
        continue;

This'll probably be quite a bit quicker, and may also save you needing
to call sprintf(), which can be somewhat expensive.

Steven Smith.

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (FreeBSD)

iD8DBQFAe+KqO4S8/gLNrjcRAgJRAJ9+ax08fJRtpGkbdOVBA4fg8qUdugCgji1J
CCsdR7tjQ18NLTsOy9n4T+g=
=rIPd
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
