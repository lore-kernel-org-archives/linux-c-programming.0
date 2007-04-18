From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: unable to link to a static library present alongside a shared
 library
Date: Wed, 18 Apr 2007 21:18:02 +0100
Message-ID: <17958.31994.242710.443269@cerise.gclements.plus.com>
References: <46260A74.90309@gmail.com>
	<17958.13648.425008.752038@cerise.gclements.plus.com>
	<46266604.8090103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46266604.8090103@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> > But for a shared library, the end result will be a library which
> > cannot actually be shared: effectively just a DLL (dynamically-linked
> > library) rather than a *shared* library.
> 
> I thought dll : Windows :: so : *nix. Apparently it is not so. After 
> reading your mail I read through the 
> http://en.wikipedia.org/wiki/Library_(computing) article and learnt some 
> things but I'm still not fully clear:
> 
> 1)
> 
> A Windows DLL is a dynamic link library. I hope I am right in 
> understanding that to "link" means to basically resolve external 
> references in an object module. 
> http://en.wikipedia.org/wiki/Position_independent_code#Windows_DLLs 
> tells me that Windows DLLs would largely be shareable only on disk and 
> not on memory were it not for the fact that they are premapped to 
> certain addresses in memory.
> 
> But Unix SO files are truly shareable on memory since they use PIC.
> 
> Is that all the functional difference between Windows DLL-s and Unix SO-s?

That's most of it, although the situation isn't quite as clear-cut
(early Linux implementations of shared libraries also didn't use PIC,
so had to be pre-mapped).

Another significant difference is that Windows executables and DLLs
associate any unresolved symbols with the DLL from which they are
meant to be loaded. OTOH, the Linux loader doesn't care where a symbol
comes from, so long as something defines it.

> 2)
> 
> Is there a difference between a dynamic link library and a dynamic load 
> library? Would I be right in understanding that a dynamic link lib needs 
> to be loaded at the same time as (or previous to) the loading of the 
> caller, but a dynamic load lib can be loaded *after* the loading of the 
> caller? This might mean that the latter would be valid for functions. Is 
> my understanding correct?

The two are often just used as alternative expansions of "DLL".

There is no techinical difference between a library which is
explicitly linked against an executable (or another library) and one
which is meant to be loaded dynamically with e.g. dlopen().

> 3)
> 
> Is there a conflict between 
> http://en.wikipedia.org/wiki/Library_(computing)#Dynamic_linking and 
> http://en.wikipedia.org/wiki/Linker#Dynamic_linking . They have 
> different explanations of dynamic linking...

There's no conflict; the first one is just slightly more detailed.

> 4)
> 
> Anyway, the first article has the phrase "index names or numbers" but it 
> does not say names or numbers of what. (If you tell me I will edit the 
> article myself.)

Windows (and maybe other systems) allows numeric references to symbols
in an external DLL. The executable or DLL can refer to e.g. symbol #7
in foo.dll rather than to the name of the function.

At one time, this probably provided a significant saving in terms of
file size.

> 5)
> 
> The article http://en.wikipedia.org/wiki/Static_Library further confuses 
> me. It says that a static lib is a lib *in which* references to external 
> variables/functions are resolved at compile time. I thought it was a lib 
> which *satisfies* the references present *in a caller* and where the 
> linking is done at compile time. Should the wording be corrected?

You're reading too much into the use of the word "in". When linking an
executable or shared library against a static library, external
references (those external to the executable or shared library) are
resolved at compile time.

> The article also says "... or at runtime by the linker or linking 
> loader". I think the word "respectively" should be added after "loader", 
> but still I don't understand how refs to symbols provided by a static 
> lib can be resolved at runtime. To me it goes against the very nature of 
>   a static lib. What am I missing?

It is possible to use a static library as a dynamically-loaded library
(the XFree86/X.org module loader does this), but it's debatable
whether it's reasonable to call this "static linking".

Ultimately, if a linker can merge various object files and libraries
together and write the result to a file, it can do the same in memory
and execute the result.

> > Also, on SELinux systems, you typically need to modify the security
> > policy to allow such libraries to be used, 
> 
> Such libraries meaning?

Those which contain relocations as a result of including code which
isn't position-independent.

Search Google for the phrase:

	"cannot restore segment prot after reloc: Permission denied"

This is not all that uncommon; it usually arises from using a library
which is only available as a static library. E.g. the BLAS/LAPACK
linear algebra libraries are written in Fortran; on some systems, you
can't generate position-independent code from Fortran, so any shared
library which uses BLAS/LAPACK ends up requiring run-time relocation.

-- 
Glynn Clements <glynn@gclements.plus.com>
