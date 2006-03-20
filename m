From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Syntax of constructor
Date: Mon, 20 Mar 2006 13:47:20 +0530
Message-ID: <200603201347.20132.samjnaa@gmail.com>
References: <200603200841.16674.samjnaa@gmail.com> <4f2e7cd30603191934j468334eam34ecca31e49bf649@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4f2e7cd30603191934j468334eam34ecca31e49bf649@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Monday, 20 March 2006 09:04 samaye tvayaa likhitam:

> That's called the initializer list.  I suggest you get a book that
> explains these things.  C++ Primer or The C++ Programming Language
> would be good.

Thanks. I am reading/referring to a PDF copy of Thinking in C++ but of course 
without knowing the name of this syntax "initializer list" I cannot search 
through the PDF.

Now what I would like to know is: Is

> >         CAA2DCoordinate(): X(0), Y(0) {};

much different from:

> > CAA2DCoordinate() { X = 0; Y = 0; }

? Seeing as X and Y are not const-s, I do not see the point in initializing 
outside the (empty) braces. If they were const-s, TICP tells me that they 
must be initialized before the *start* of the function so the X(0) syntax is 
necessary. But here they are not const-s...

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-20 W12-1 UTC+0530
