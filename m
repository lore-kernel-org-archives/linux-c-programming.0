From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Wed, 30 Jun 2004 03:01:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16610.7915.923533.301196@cerise.nosuchdomain.co.uk>
References: <40E09FC4.50800@ig.com.br>
	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
	<20040629143238.GD6335@luna.mooo.com>
	<16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
	<20040630013316.GF9412@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040630013316.GF9412@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Micha Feigin <michf@post.tau.ac.il>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Micha Feigin wrote:

> > > > It appears that you are allowed to initialise constant static members
> > > > within the declaration, so you can do this:
> > 
> > > > This compiles with "g++ -ansi -pedantic", so it's probably standard
> > > > ISO C++.
> > > 
> > > Does this also work when put in a header or only when put directly in
> > > the cpp file?
> > 
> > It doesn't matter. A #include directive simply inserts the contents of
> > the header file directly into the source code which is fed to the
> > compiler. The compiler doesn't care which file a given piece of code
> > comes from.
> 
> It is a problem since a header can be included more then once, and
> since the static value is put into the data section of the object, the
> linker should give an error if the file was included more the once
> since it will have multiple definitions for the same variable and it
> wont know how to link the objects (it doesn't care if it the same
> values, it does care if the static variable gets its value more then
> once).

But in this case, there isn't a variable. Foo::DEFSIZE is a
compile-time constant; it doesn't exist in memory. Compiling the code
in question and running "nm" on both the object files and the
resulting executable confirms this.

If it was treated as a constant lvalue (i.e. stored in the .rodata
section), you wouldn't be able to use it to specify the array
dimension.

I can't state for certain that this is defined behaviour, because I
don't have a copy of the ISO C++ standard. OTOH, it works with
"g++ -ansi -pedantic ...", and that's usually fairly rigorous about
generating errors for non-standard code.

-- 
Glynn Clements <glynn.clements@virgin.net>
