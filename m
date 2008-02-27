From: Kristof Provost <Kristof@sigsegv.be>
Subject: Re: can't initialize a constant using another constant?
Date: Wed, 27 Feb 2008 08:33:12 +0000
Message-ID: <20080227083312.GC13641@nereid>
References: <47C422E6.8050702@gmail.com> <20080227080957.GB13641@nereid>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080227080957.GB13641@nereid>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 2008-02-27 08:09:57 (+0000), Kristof Provost <Kristof@sigsegv.be> wrote:
> On 2008-02-26 20:02:06 (+0530), Shriramana Sharma <samjnaa@gmail.com> wrote:
> > A strange thing I ran across this evening. I was not allowed to do:
> > 
> > const double lunarSynodicMonth = 29.53059 ;
> > const double daysLunarPhaseAngleTakesPerDegree = lunarSynodicMonth / 360.0 ;
> > 
> > I got the following error:
> > 
> > wdf-karanas.c:17: error: initializer element is not constant
> > make: *** [wdf-karanas.o] Error 1
> > 
> > I would be grateful if anyone could shed some light. TIA.
> What compiler are you using? 
> I did a quick test on g++ 4.1.2 (x86_64) and it seemed to be accepted
> without warning.
I took a better look. I get the same error with gcc.

It looks like this is allowed in C++ and not in plain C (or at least,
g++ allows it and gcc doesn't).

Kristof
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHxSBIUEZ9DhGwDugRAkCiAJoCe+3665vkuJCWxdJTNsu/CxAAzgCePlm4
0OTsa8DQNj/CCG2eKiFrXp4=
=9GTz
-----END PGP SIGNATURE-----
