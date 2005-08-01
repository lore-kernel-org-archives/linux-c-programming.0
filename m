From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Query in C
Date: Mon, 1 Aug 2005 08:44:25 +0200
Message-ID: <6a00c8d5050731234411b2bbaa@mail.gmail.com>
References: <6a00c8d505071515355f041394@mail.gmail.com>
	 <20050716064421.85333.qmail@web31901.mail.mud.yahoo.com>
	 <6eee1c405071709277b5568dd@mail.gmail.com>
	 <d5b9712e05073123104617be93@mail.gmail.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d5b9712e05073123104617be93@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: avinash pawar <lkmails@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 8/1/05, avinash pawar <lkmails@gmail.com> wrote:
> Hello Everyone ,
> 
>   Can anyone of you please tell me..
> 
>       what does extern "C" int func(int *,foo) accomplish ?
> 

When using existing C headers that already conform to ANSI C in C++
they need to be slightly modified to enable proper linkage for the
language and to ensure that C++ keywords are not used as identifiers.

This means that you can use C headers in C++ projects in the following way:

#ifdef __cplusplus
       extern "C" {
#endif
...
int func(int *,foo);
...
#ifdef __cplusplus
       }
#endif

Code placed between the two ifdefs is either linked as C or C++.  The
__cplusplus macro is usually predefined in appropriate system headers.

To answer your question: when a routine will be called from another
language (here C is called from C++) it should be declared in C++ as

extern "C" int func(int *,foo);

The extern "C" causes the routine to have a so called 'unmangled' name
that can be refered to not only from C but also from Fortran or Cobol.
 Without extern "C" the routine will get a link 'mangled' link name
like func__abc.

Regards

        \Steve

-- 

Steve Graegert
Software Consultancy
Mobile: +49 (176)  21248869   
Office: +49 (9131) 7126409
