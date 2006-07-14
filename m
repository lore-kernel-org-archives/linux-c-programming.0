From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: How to write apps dependent on external libraries?
Date: Fri, 14 Jul 2006 12:32:09 +0200
Message-ID: <d9def9db0607140332jb349136k13dc3107f2766325@mail.gmail.com>
References: <200607132134.57378.samjnaa@gmail.com>
	 <17590.58653.143536.23451@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17590.58653.143536.23451@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>

Hey,

Ulrich Drepper has written quite alot about shared libraries. He also
did some performance tests uppon that topic.

* http://people.redhat.com/drepper/ (look at papers)
* http://udrepper.livejournal.com/

think it's better to read his papers first, bet noone will explain it
that accuratly here.

Markus

On 7/14/06, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Shriramana Sharma wrote:
>
> > Often I see apps which are dependent on this .so file or that. I don't know
> > how apps can be written that depend on libraries that are not linked into the
> > executable. So far I have been linking all needed libraries into the
> > executable.
> >
> > A .so is a collection of what?
>
> A .so (shared object) is structurally quite similar to a single .o
> file. The difference is that a .so is meant to be able to be linked at
> run-time.
>
> Linking against a .so file doesn't copy the code/data from the .o file
> to the executable; it just stores references to the .so file in the
> executable.
>
> The loader (ld-linux.so) will load any shared libraries which the
> executable requires when the executable is loaded. If it can't find
> one or more libraries, you get an error when you try to run the
> executable.
>
> > An .a is a collection of .o-s, right?
>
> It can be a collection of anything (a .a file is just an archive,
> similar to a .zip file), but it's usually just a collection of .o
> files.
>
> Linking against a .a file is similar to linking against the individual
> .o files which it contains, except that only those .o files which
> supply a required symbol (function, variable) are used.
>
> > What is a .la?
>
> A .la file is a metadata file created and used by libtool. It contains
> information (e.g. dependencies) which libtool needs to link against a
> static library.
>
> --
> Glynn Clements <glynn@gclements.plus.com>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Markus Rechberger
