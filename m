From: "Uday Karan" <uday.karan@gmail.com>
Subject: Re: Syntax of constructor
Date: Mon, 20 Mar 2006 09:04:31 +0530
Message-ID: <4f2e7cd30603191934j468334eam34ecca31e49bf649@mail.gmail.com>
References: <200603200841.16674.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603200841.16674.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>, linux-c-programming@vger.kernel.org

That's called the initializer list.  I suggest you get a book that
explains these things.  C++ Primer or The C++ Programming Language
would be good.

Here is a link that explains this particular topic:
http://www.blueturnip.com/projects/edu/cs/cpp/initializer-lists.html

-Uday

On 3/20/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> A header file contains the following class declaration:
>
> class CAA2DCoordinate
> {
> public:
> //Constructors / Destructors
>         CAA2DCoordinate(): X(0), Y(0) {};
>
> //member variables
>   double X;
>   double Y;
> };
>
> Now what I do not understand is the line:
>
>         CAA2DCoordinate(): X(0), Y(0) {};
>
> I would have thought it would be:
>
> CAA2DCoordinate() { X = 0; Y = 0; }
>
> just like the QDate constructor:
>
>     QDate() { jd = 0; }
>
> What is the meaning of the colon ":" here, and what are the (0) things, and
> why are X and Y *outside* the braces?
>
> Thanks for your patience.
>
> --
>
> Tux #395953 resides at http://samvit.org
> playing with KDE 3.51 on SUSE Linux 10.0
> $ date [] CCE +2006-03-20 W12-1 UTC+0530
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
