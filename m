From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Syntax of constructor
Date: Mon, 20 Mar 2006 13:09:20 +0000
Message-ID: <17438.43392.485814.611416@cerise.gclements.plus.com>
References: <200603200841.16674.samjnaa@gmail.com>
	<4f2e7cd30603191934j468334eam34ecca31e49bf649@mail.gmail.com>
	<200603201347.20132.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603201347.20132.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > That's called the initializer list.  I suggest you get a book that
> > explains these things.  C++ Primer or The C++ Programming Language
> > would be good.
> 
> Thanks. I am reading/referring to a PDF copy of Thinking in C++ but of course 
> without knowing the name of this syntax "initializer list" I cannot search 
> through the PDF.
> 
> Now what I would like to know is: Is
> 
> > >         CAA2DCoordinate(): X(0), Y(0) {};
> 
> much different from:
> 
> > > CAA2DCoordinate() { X = 0; Y = 0; }
> 
> ? Seeing as X and Y are not const-s, I do not see the point in initializing 
> outside the (empty) braces. If they were const-s, TICP tells me that they 
> must be initialized before the *start* of the function so the X(0) syntax is 
> necessary. But here they are not const-s...

In which case, both forms are valid, and equivalent.

You also need to use an initialiser if you need to initialise the
member variable through a constructor.

Given that you have to use an initialiser in some cases, and you are
allowed to use it in the other cases (i.e. non-const primitive types),
you may as well *always* use initialisers to initialise member
variables, rather than a mix of initialisers and assignments.

-- 
Glynn Clements <glynn@gclements.plus.com>
