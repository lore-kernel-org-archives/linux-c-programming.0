From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Wed, 30 Jun 2004 04:33:16 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040630013316.GF9412@luna.mooo.com>
References: <40E09FC4.50800@ig.com.br> <16608.44836.384260.844173@cerise.nosuchdomain.co.uk> <20040629143238.GD6335@luna.mooo.com>
	 <16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Tue, Jun 29, 2004 at 06:43:23PM +0100, Glynn Clements wrote:
> 
> Micha Feigin wrote:
> 
> > > It appears that you are allowed to initialise constant static members
> > > within the declaration, so you can do this:
> 
> > > This compiles with "g++ -ansi -pedantic", so it's probably standard
> > > ISO C++.
> > 
> > Does this also work when put in a header or only when put directly in
> > the cpp file?
> 
> It doesn't matter. A #include directive simply inserts the contents of
> the header file directly into the source code which is fed to the
> compiler. The compiler doesn't care which file a given piece of code
> comes from.
> 

It is a problem since a header can be included more then once, and
since the static value is put into the data section of the object, the
linker should give an error if the file was included more the once
since it will have multiple definitions for the same variable and it
wont know how to link the objects (it doesn't care if it the same
values, it does care if the static variable gets its value more then
once).

I had that problem with the arpack++ library which is implemented in
headers only and it sets such a variable and crashes miserably if I
split the code between files.

> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
