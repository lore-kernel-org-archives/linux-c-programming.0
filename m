From: "Paul Gimpelj" <pgimpelj@sympatico.ca>
Subject: Re: compression heuristic algorithm
Date: Fri, 25 Jun 2004 22:44:12 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <004901c45b27$7808c7b0$c901010a@zoom>
References: <004001c45af4$9b7da7c0$c901010a@zoom> <40DCA9F4.1090009@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Richard Moser <nigelenki@comcast.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Thanks John.

You are saying for more complex streams there is more than one solution,
If I understand you. I will do some research into the prng wheel.


I'm interested in this.
Theory states it is possible. And presently for simple shift registers the
seeds can be reversed from the past history sequence, which allows
predicting 100% of the future generated  sequence values.

Then there is the idea of close enough, which may not be adequate for
program executables but may be fine for audio video.
What would it be worth, I wonder, if a dvd could be compressed by 80 to 90%?

Thanks again,


----- Original Message -----
From: "John Richard Moser" <nigelenki@comcast.net>
To: "Paul Gimpelj" <pgimpelj@sympatico.ca>;
<linux-c-programming@vger.kernel.org>
Sent: Friday, June 25, 2004 6:40 PM
Subject: Re: compression heuristic algorithm


> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
> Try using a PRNG "wheel" algorithm with each "wheel" generating X values
> each with N possible branch possibilities to alter position p to another
> calculated position on the wheel, with value Z to select which wheel to
> use; and use a bitlanguage to specify the changes and steps.
>
> This actually works; the problem is that it works for finite numbers X,
> N, and p; and infinite number Z.  There comes a point when Z must be
> made of coumpounding values that substitute for Z such that V(A,Z1,Z2)
> == V(A,Z).
>
> Also, even though you can do it, there's no known algorithm to reverse a
> stream of numbers into a set of parameters; for every input stream of
> every length there is one or more output streams to define it, and so
> there's no way to correlate input stream directly to one output stream.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>
> iD8DBQFA3KnzhDd4aOud5P8RAmZVAJ45w7tFgP8iLn/tMDlMZBlhSeo9uACeIGvE
> mevAv0usOk1OIc6ZLvTBGqI=
> =jPHA
> -----END PGP SIGNATURE-----

