From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mixing C/C++
Date: Tue, 25 Nov 2003 11:42:34 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16323.16426.473841.162971@cerise.nosuchdomain.co.uk>
References: <20031124111050.GI1819@pcmag.gr>
	<200311242218.40158.steven_shaw@iprimus.com.au>
	<20031124175501.GA1022@velka.phys.uoa.gr>
	<200311251221.39488.steven_shaw@iprimus.com.au>
	<1069757381.3fc333c52bf2b@webmail.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1069757381.3fc333c52bf2b@webmail.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: elathan@phys.uoa.gr
Cc: Steven Shaw <steven_shaw@iprimus.com.au>, linux-c-programming@vger.kernel.org


elathan@phys.uoa.gr wrote:

> > > Apparently it is fine. The problem occures when I am wrapping 
> > > a class which inherits from multiple classes with virtual 
> > > functions. 
> >  
> > That should be fine too. 
> >  
> > > Any workarounds? 
> >  
> > Maybe you have C++ code with static members. If so you need to compile main() 
> >  
> > with a C++ compiler. Here is an excellent resource: 
> >  
> > 	http://www.parashift.com/c++-faq-lite/mixing-c-and-cpp.html 
>  
> This is what I read and came to the above conclusion. 
>  
> It states (32.9): 
>  
> You can safely access a C++ object's data from a C function if the C++ class:  
>  
> Has no virtual functions (including inherited virtual functions) 
>   
> So I guess that is a problem.

Not for you. You aren't trying to access an object's data (member
variables) from a C function. The only C function in your original
example was main(), and that doesn't access an object's data. All of
the other functions are C++ functions; some of them have C linkage
(extern "C"), but they are still C++ functions.

> I verified that with the attached source file. Compile 
> the lib.cxx as a shared libfoo.so file and then try to call f->dump3() (f is struct 
> *Foo).   

It works fine for me:

	$ g++ -c -Wall lib.cxx 
	lib.cxx:5: warning: `class Taz' has virtual functions but non-virtual 
	   destructor
	lib.cxx:13: warning: `class Bar' has virtual functions but non-virtual 
	   destructor
	lib.cxx:21: warning: `class Foo' has virtual functions but non-virtual 
	   destructor
	$ g++ -shared -o libfoo.so lib.o 
	$ gcc -c -Wall foo.c
	$ gcc foo.o -L. -lfoo
	$ LD_LIBRARY_PATH=. ./a.out 
	Foo Hello!
	Bar Hello
	$ cat foo.c
	
	extern void *wrap_foo_ctor(void);
	extern void wrap_foo_dump(void *);
	extern void wrap_bar_dump2(void *);
	extern void wrap_taz_dump3(void *);
	
	int main(void)
	{
		void *f;
	
		f = wrap_foo_ctor();
		wrap_foo_dump(f);
		wrap_bar_dump2(f);
	
		return 0;
	}


> Also, I don't have main() in my project since it is a shared library. 

If you're getting a segfault, you are running a program, and that
program has a main() function.

In any case, I'm not sure that the comment about compiling main() with
a C++ compiler is applicable to using C++ shared libraries on Linux. 
There are plenty of shared libraries which are written in C++ but are
usable from C programs without special treatment (GLU is probably the
most common example).

-- 
Glynn Clements <glynn.clements@virgin.net>
