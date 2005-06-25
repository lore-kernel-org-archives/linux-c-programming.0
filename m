From: Steve Graegert <graegerts@gmail.com>
Subject: Re: How to prototype functions that return pointers
Date: Sat, 25 Jun 2005 08:56:52 +0200
Message-ID: <6a00c8d50506242356dd6717a@mail.gmail.com>
References: <42BC7A4F.60304@colannino.org>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42BC7A4F.60304@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org

On 6/24/05, James Colannino <james@colannino.org> wrote:
> Ok, so this is a very embarassing question.  I tried googling for the
> answer but haven't figured it out yet, and everything I've tried results
> in compilation errors. I want to prototype a function that takes nothing
> as an argument but returns a pointer to a character.
> 
> I've tried the following:
> 
> char * readline();
> char *readline();

I can't see a problem with this declaration, thus I am not able to
reproduce the error(s).  What I see here is a function taking an
arbitrary number of arguments returning a pointer to a char.

> These first two result in 4 errors, each one identical and each one
> telling me "error: two or more data types in declaration of 'readline' "
> 
> *char readline();
> * char readline();

This is obviously wrong because you're trying to dereference a data
type, not an identifier. Everything else that follows in this line is
discarded by the parser.

I have compiled three different function declarations that all have a
different meaning to help you understand what could have been wrong:

/* pointer to func() returning a char */
char (*func)();

/* function taking a char pointer and returning char-pointer */
char* f(char *);

/* 
 * pointer to a function taking pointer to a char,
 * returning a pointer to a char
 */
char* (*fp)(char *);

Hope this clarifies the relations between pointers and functions and
their arguments.


Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
