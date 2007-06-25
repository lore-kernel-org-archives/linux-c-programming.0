From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: various meanings of static
Date: Mon, 25 Jun 2007 22:35:06 +0100
Message-ID: <18048.13578.542604.949301@cerise.gclements.plus.com>
References: <467CB8EC.8080209@gmail.com>
	<84bd26ef0706230555x35fdceber20d5788370b602ee@mail.gmail.com>
	<18045.17976.961868.834988@cerise.gclements.plus.com>
	<38511efb0706241408m42241137n254944e32902262c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <38511efb0706241408m42241137n254944e32902262c@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pedro de Medeiros <pedrovmm+lists@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Pedro de Medeiros wrote:

> The problem is that some people already consider a good practice to
> create their own 'decorators' when they use GCC extensions, but they
> need to turn them off when the compiler doesn't support such features.
> Consider this, for instance:
> 
> #ifdef __GNUC__
> #define format(si, ftc) __attribute__ ((format(printf(si, ftc)))
> #define internal __attribute__ ((visibility("hidden")))
> #define public __attribute__ ((visibility("default")))
> #define useful __attribute__ ((warn_unused_result))
> #else
> #define format(si, ftc)
> #define internal
> #define public
> #define useful
> #endif
> 
> Some of those 'decorators' are valuable assets when detecting code
> mistakes, maintaining library encapsulation and whatnot. Not using
> #defines is not an option, since other compilers may not support those
> GCC extensions.

The usual solution is to use __attribute__ directly, and redefine that
for non-gcc compilers, e.g.:

	#if !defined __GNUC__ || __GNUC__ < 2
	#undef __attribute__
	#define __attribute__(x)
	#endif

> Should we discard them because some highlighting
> editors don't know what to do with them?

In the specific case of defining macros for gcc attributes, the impact
upon human-readability is the main factor against using them. In terms
of machine-readability, the macros are no worse than explicit
__attribute__ declarations.

Using the preprocessor to create a project-specific language is seldom
as good an idea as it may seem at the time, as you tend to end up with
code which only the author understands.

In general, to be able to work on a C source file should only require
knowledge of C along with the types, variables and functions used by
that particular file. Having to be familiar with a large number of
project-specific conventions and idioms before you can touch anything
tends to result in code which is hard to maintain.

E.g. one of the coding conventions for the Linux kernel is that
typedefs aren't used for structure or pointer types, so that variables
which contain structures or pointers can be readily identified from
their declaration alone.

-- 
Glynn Clements <glynn@gclements.plus.com>
