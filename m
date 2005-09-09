From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: typecasting - explain
Date: Fri, 9 Sep 2005 14:17:25 +0100
Message-ID: <17185.35685.552865.149286@cerise.gclements.plus.com>
References: <dfrckc$ts5$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrckc$ts5$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org


_z33 wrote:

>    I'm not able to understand what exactly happens when I typecast a 
> data type from one to other. What I had in mind was, that by typecasting 
> you are making it clear to the compiler how to handle the data. For 
> example, when you get a "void *" from malloc, the reason you typecast it 
> to the required data type, is to make sure later the compiler doesn't 
> complain or throw an error, when doing some pointer arithmetic on it. Am 
> I wrong completely?

>    If my conception is correct, then I'm having a serious problem in 
> understanding typecasting of function pointers. First of all, I thought 
> it is meaningless and the compiler won't allow it. However, to my shock 
> I came across a posting today morning on a different newsgroup, claiming 
> that it is in fact supported by the ANSI standard. Is it? If so, what 
> does such a typecasting mean?

If you cast numeric values (char, short, int, long, float, double, and
similar), the compiler may insert code to actually convert the value.

OTOH, casting a pointer doesn't in itself add any code; it just
changes the compiler's interpretation of the pointer. It changes the
multiplier used for pointer arithmetic, and the effect of
dereferencing a pointer; it also determines the type used for type
checking.

For a function pointer, only the last one of the above makes sense. 
IOW, typecasting a function pointer changes the type used in type
checking, and may change what data is passed if you call the function
through the pointer.

In general, typecasting function pointers is a bad idea. Or rather,
you shouldn't call a function through a pointer which doesn't
represent the exact type of the function (casting to a different type
for storage is fine, so long as you cast back to the correct type
before calling). The reason is that you are making certain assumptions
about the format in memory of the function's argument list.

A classic example of this is the last argument to qsort, which is a
pointer to a function of type:

	int compar(const void *, const void *);

If you want to sort an array of e.g. int, you need to write:

	int compare_int(const void *a, const void *b)
	{
		const int *aa = a;
		const int *bb = b;

		return a - b;
	}

If you were to use:

	int compare_int(const int *a, const int *b)

then pass compare_int to qsort() (either casting it explicitly or
allowing it to be cast implicitly), it will only work so long as void*
and int* are passed in exactly the same way. In particular, they have
to be the same size, which isn't guaranteed (a void* can be larger
than an int* on some architectures).

-- 
Glynn Clements <glynn@gclements.plus.com>
