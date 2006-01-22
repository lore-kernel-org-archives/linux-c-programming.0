From: Jesse Ruffin <jesse@ajp-services.net>
Subject: Re: Help: need to prevent infinite loop
Date: Sun, 22 Jan 2006 06:28:45 -0500
Message-ID: <43D36C6D.4080500@ajp-services.net>
References: <200601171006.36978.samjnaa@gmail.com>	<43CC996D.4050100@ajp-services.net> <17363.23676.751524.480464@cerise.gclements.plus.com>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17363.23676.751524.480464@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I had hoped to convey that the standard library uses an ungetc() like
operation on the data it acquires, hence the quotes. This does not
consume anything from the user's point of view, and my GNU libc (2.3.5)
does use ungetc() for [f]scanf in a macro form.

I'll have to go read the standard to make sure, but I don't see anywhere
that scanf has to put anything back after it gets it. My manual says
this to say generally:

| If processing of a directive fails, no further input is read, and
| scanf() returns. A "failure" can be either of the following: input
| failure, meaning that input characters were unavailable, or matching
| failure, meaning that the input was inappropriate (see below).

This says (to me at least) that input is read, then matched. if there is
no match it returns. I am curious if this non consumptive behavior is
specified in the standard. I would prefer a non consumptive version
myself as I assume that operations on a stream affect the state of the
stream, whether  or not they succeed. You can always use the return code
to seek yourself back if necessary. Consumption also makes more sense
when applied to non seeking streams as the junk input (like in the code
under discussion) will get thrown out.

Jesse Ruffin
AJP Services
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFD02xs8GGeAXLl3osRApIiAJ9Y9P+41L0yIPmp+DCyIvFNn0vX7QCfXfQW
+pqE6A8zCvgcgWQHSQp3mWo=
=OGj+
-----END PGP SIGNATURE-----
