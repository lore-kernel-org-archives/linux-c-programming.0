From: Steve Graegert <graegerts@gmail.com>
Subject: Re: relationship between standard C and gcc compiler suite?
Date: Wed, 3 Aug 2005 19:31:47 +0200
Message-ID: <6a00c8d505080310317af26dc2@mail.gmail.com>
References: <Pine.LNX.4.63.0508030942160.7360@localhost.localdomain>
	 <6a00c8d5050803101241bcceb5@mail.gmail.com>
	 <Pine.LNX.4.63.0508031319220.25465@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508031319220.25465@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On 8/3/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Wed, 3 Aug 2005, Steve Graegert wrote:
> 
> > In case of GCC, including <stdbool.h> cleans up #defines and allows
> > C++ compilation.  It is therefore recommended to #define these
> > identifiers only when _needed_ and after including <stdbool.h>.
> > <stdbool.h> is provided as an extension and, for this reason, not
> > placed into the include directory of the C standard library.
> 
> ok, this is where i might be having my difficulty.  in H&S (5th ed),
> p. 325, i read (emphasis added):
> 
> "Certain Standard C libraries can be considered part of the language.
> The provide standard definitions and parameterization that help make C
> programs more portable... These core libraries consist of the header
> files ... stdbool.h, ..."
> 
> my reading of this is that stdbool.h is not an extension, it's a part
> of the core.  what am i mnisreading here?

It is not an extension to the standard, namely C99, but an extension
of GCC in order to allow native C code to be compiled as C++ in a
clean way.  So you're reading was absolutely correct.  Almost every
vendor ships with <stdbool.h>, sometimes it is placed in the include
directory for the compiler (on Linux/GNU systems at least), but HP,
for example, puts it in /usr/include.  It's just a Linux thing to put
it elsewhere.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
