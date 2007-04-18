From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: unable to link to a static library present alongside a shared
 library
Date: Thu, 19 Apr 2007 00:10:04 +0530
Message-ID: <46266604.8090103@gmail.com>
References: <46260A74.90309@gmail.com> <17958.13648.425008.752038@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17958.13648.425008.752038@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Please take some time to read the following as I have been reading some 
Wikipedia articles about libraries and have a few questions. You don't 
have to answer the entire mail at once but please don't ignore it 
because it's a bit long. You are my teachers here since I am neither 
neither a professional programmer nor do I have a computer science 
degree so I am trusting in you...

Glynn Clements wrote:

> But for a shared library, the end result will be a library which
> cannot actually be shared: effectively just a DLL (dynamically-linked
> library) rather than a *shared* library.

I thought dll : Windows :: so : *nix. Apparently it is not so. After 
reading your mail I read through the 
http://en.wikipedia.org/wiki/Library_(computing) article and learnt some 
things but I'm still not fully clear:

1)

A Windows DLL is a dynamic link library. I hope I am right in 
understanding that to "link" means to basically resolve external 
references in an object module. 
http://en.wikipedia.org/wiki/Position_independent_code#Windows_DLLs 
tells me that Windows DLLs would largely be shareable only on disk and 
not on memory were it not for the fact that they are premapped to 
certain addresses in memory.

But Unix SO files are truly shareable on memory since they use PIC.

Is that all the functional difference between Windows DLL-s and Unix SO-s?

2)

Is there a difference between a dynamic link library and a dynamic load 
library? Would I be right in understanding that a dynamic link lib needs 
to be loaded at the same time as (or previous to) the loading of the 
caller, but a dynamic load lib can be loaded *after* the loading of the 
caller? This might mean that the latter would be valid for functions. Is 
my understanding correct?

3)

Is there a conflict between 
http://en.wikipedia.org/wiki/Library_(computing)#Dynamic_linking and 
http://en.wikipedia.org/wiki/Linker#Dynamic_linking . They have 
different explanations of dynamic linking...

4)

Anyway, the first article has the phrase "index names or numbers" but it 
does not say names or numbers of what. (If you tell me I will edit the 
article myself.)

5)

The article http://en.wikipedia.org/wiki/Static_Library further confuses 
me. It says that a static lib is a lib *in which* references to external 
variables/functions are resolved at compile time. I thought it was a lib 
which *satisfies* the references present *in a caller* and where the 
linking is done at compile time. Should the wording be corrected?

6)

The article also says "... or at runtime by the linker or linking 
loader". I think the word "respectively" should be added after "loader", 
but still I don't understand how refs to symbols provided by a static 
lib can be resolved at runtime. To me it goes against the very nature of 
  a static lib. What am I missing?

> Also, on SELinux systems, you typically need to modify the security
> policy to allow such libraries to be used, 

Such libraries meaning?

Thanks, as always.

Shriramana.
