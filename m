From: John Richard Moser <nigelenki@comcast.net>
Subject: Re: compression heuristic algorithm
Date: Fri, 25 Jun 2004 18:40:52 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40DCA9F4.1090009@comcast.net>
References: <004001c45af4$9b7da7c0$c901010a@zoom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <004001c45af4$9b7da7c0$c901010a@zoom>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Gimpelj <pgimpelj@sympatico.ca>, linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Try using a PRNG "wheel" algorithm with each "wheel" generating X values
each with N possible branch possibilities to alter position p to another
calculated position on the wheel, with value Z to select which wheel to
use; and use a bitlanguage to specify the changes and steps.

This actually works; the problem is that it works for finite numbers X,
N, and p; and infinite number Z.  There comes a point when Z must be
made of coumpounding values that substitute for Z such that V(A,Z1,Z2)
== V(A,Z).

Also, even though you can do it, there's no known algorithm to reverse a
stream of numbers into a set of parameters; for every input stream of
every length there is one or more output streams to define it, and so
there's no way to correlate input stream directly to one output stream.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA3KnzhDd4aOud5P8RAmZVAJ45w7tFgP8iLn/tMDlMZBlhSeo9uACeIGvE
mevAv0usOk1OIc6ZLvTBGqI=
=jPHA
-----END PGP SIGNATURE-----
