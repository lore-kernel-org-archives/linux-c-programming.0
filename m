From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: include guards
Date: Wed, 20 Jun 2007 17:09:31 +0200
Message-ID: <6a00c8d50706200809i7f2f2d7aq9dfe073932535cc0@mail.gmail.com>
References: <46720AFF.6070402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=Sm5tumaFYK3/ogrr6v+9mRjZ2wRGcMReseE+NBUpYKQBKvi9MW7+ZPmXlr+56dInOkTb5BqrdJCTWTsjxJ8xPLE1Wv8jAie3C/wKXF8Ga44qnXcKFqJjcG/olUnFdMgC+MMAen+WBQkVDWusMpfcQVWi2yfuD7IEHpltoE4KTvc=
In-Reply-To: <46720AFF.6070402@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Shriramana,

Please see inline.  Thanks.

On 6/15/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Hello.
>
> To prevent header files from being included more than once in the sam=
e
> translation unit, we use include guards like
>
> # ifndef FOO_H
> # define FOO_H
> ...
> # endif
>
> Recently I came to know that I can use simply:
>
> # pragma once
>
> instead of the above group of sentences and the desired effect is sti=
ll
> accomplished.
>
> This leads me to think of two things:
>
> 1. why use the ifndef-define-endif method when the pragma once method=
 is
> simpler and cleaner?

pragma(s) are, as most language extensions, not portable.

> 2. why should we need to use either method at all? If it is a
> universally undesirable behaviour that the same header file is includ=
ed
> in a translation unit more than once, then an intelligent compiler (o=
r
> preprocessor) itself can by default take of this, right?

Yes, if a header file is contained entirely in a `#ifndef'
conditional, then the preprocessor records that fact.  But if a
subsequent `#include' specifies the same file, and the macro in the
#ifndef is already defined, then the file is entirely skipped, without
even reading it.  How else should a preprossessor deal with this in a
portable manner?  Keep in mind that preprocessing is a distinct step
in the compilation process.

> I understand that to write portable code that compiles on
> not-so-intelligent compilers, we may need to do something manually, s=
o
> question 2 is answered, but question 1 still stands...

Does it?  Correct, pragmas are not standard, and probably never will
be, due to the difficulty of specifying exactly what it is that
'#pragma once' is supposed to do. (Think of two identical copies of a
header file in different source directories, and a translation unit
that #includes both of them. What is the effect of '#pragma once'
here?)  Inclusion safe guards work perfectly well, are
standard-compliant and portable.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
