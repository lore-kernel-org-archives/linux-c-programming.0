From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Tue, 29 Jun 2004 18:43:23 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
References: <40E09FC4.50800@ig.com.br>
	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
	<20040629143238.GD6335@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040629143238.GD6335@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Micha Feigin <michf@post.tau.ac.il>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Micha Feigin wrote:

> > It appears that you are allowed to initialise constant static members
> > within the declaration, so you can do this:

> > This compiles with "g++ -ansi -pedantic", so it's probably standard
> > ISO C++.
> 
> Does this also work when put in a header or only when put directly in
> the cpp file?

It doesn't matter. A #include directive simply inserts the contents of
the header file directly into the source code which is fed to the
compiler. The compiler doesn't care which file a given piece of code
comes from.

-- 
Glynn Clements <glynn.clements@virgin.net>
