From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: migration from perl
Date: Fri, 16 Aug 2002 00:33:47 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15708.14939.337416.849689@cerise.nosuchdomain.co.uk>
References: <15707.56675.958362.834807@cerise.nosuchdomain.co.uk>
	<Pine.GSO.4.21.0208151528350.21083-100000@general1.asu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.21.0208151528350.21083-100000@general1.asu.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "<Iliyan Malchev>" <ibm@asu.edu>
Cc: Mat Harris <mat.harris@genestate.com>, linux-c-programming@vger.kernel.org


"<Iliyan Malchev>" <ibm@asu.edu> wrote:

> > > Should I learn C or C++?
> > 
> > I recommend learning C first. C++ is based upon C, so most of the
> > effort spent on learning C will still be relevant if you decide to use
> > C++.
> 
> I must disagree with this statement.  Bjarne Stroustrup in his book "The
> Design and Evolution of C++" has a section dedicated to questions of that
> nature, and his answer to "Should I learn C first, and then C++?" is that you
> should not learn C if you want to learn C++ eventually.  Start with C++ from
> scratch.  Yes, while C++ is superset of C, you should not think of it this
> way.  C++ lets you program around a different paradigm, and you should start
> with that.

1. The original question seemed to imply that the poster was
interested in understanding the software which comprises the OS
distribution. The vast majority of that is in C, and all of the
standard libraries use a C API.

2. While C++ isn't strictly a superset of C, it's close. A thorough
understanding of C++ inevitably incorporates a thorough understanding
of C.

3. For someone who is coming from a background of using high-level
languages (the poster mentions Perl), many of the low-level aspects
(e.g. memory allocation, pointers) are likely to be new. It will be
easier to learn these in the context of a restricted subset of C++,
i.e. in C.

4. If you aren't interested in any of the low level aspects, then
there are better languages than C++. IMHO, about the only things that
C++ has in its favour are its compatibility with C, and it's ability
to exercise the same degree of low-level control as C. If you don't
need that, you may as well use a high-level OO language like Java or
O'Caml.

-- 
Glynn Clements <glynn.clements@virgin.net>
