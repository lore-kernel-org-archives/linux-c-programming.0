From: "Steven" <sos22@cam.ac.uk>
Subject: Re: Why does linking a.so with b.so require execs to be linked both -la and -lb?
Date: Tue, 12 Aug 2003 20:12:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030812191241.GA1063@archibold.chu.cam.ac.uk>
References: <m3k79jj4av.fsf@bfnet.com> <tmml01xphg.ln2@thune.mrc-home.org> <m3vft320sv.fsf@bfnet.com> <16184.61520.502240.104624@cerise.nosuchdomain.co.uk> <m3r83qzv2j.fsf@bfnet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m3r83qzv2j.fsf@bfnet.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: David Wuertele <dave-gnus@bfnet.com>
Cc: linux-c-programming@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Glynn> One consequence of this difference is that Linux allows an
> Glynn> executable to export symbols to a library. Thus you can create
> Glynn> a library with unresolved references (i.e. symbols not provided
> Glynn> by either the library or any of it's explicit dependencies). So
> Glynn> long as that symbol actually gets provided at run-time (e.g. by
> Glynn> the executable itself), everything works.
> Does this "flexibility" have practical applications?
If it's combined with weak symbols it's often handy.  Suppose library
A arranges to libA_error whenever it suffers an error, which prints an
error message and terminates the program.  If the libA_error is weak,
then an application can define its own libA_error as a strong symbol,
which will then override the weak variant and be called in preference
to the library's own version.

Systems with multiple, incompatible, threading libraries, such as
FreeBSD, often do something similar with symbols be provided by the
application's chosen threading library.  This means that libA should
be able to work reasonably well whether the application uses libkse or
libthr, without the author of libA having to do anything special.

Steven Smith,
sos22@cam.ac.uk.

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (FreeBSD)

iD8DBQE/OTwpO4S8/gLNrjcRAhiMAKCBmrBYyktmBY7hh1f/jEl2lL9AVQCfaSkc
0ewf6aTOVZZhdM3hREXywRk=
=Wpy1
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
