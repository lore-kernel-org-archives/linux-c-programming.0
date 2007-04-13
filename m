From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: efficiency in passing a value to a function
Date: Fri, 13 Apr 2007 18:23:33 +0100
Message-ID: <17951.48277.259221.382596@cerise.gclements.plus.com>
References: <4613DCB8.8030007@gmail.com>
	<6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
	<17940.58896.512698.269693@cerise.gclements.plus.com>
	<6a00c8d50704050602j1c7a7543le5ebeb3b19994977@mail.gmail.com>
	<46190779.3040508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46190779.3040508@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> > If a programmer has chosen to pass a reference rather than a value,
> > even if no reference is actually required, intentions to improve
> > run-time performance come into mind.  It is much more intuitive to
> > pass primitives by value and use references only where appropriate,
> > since performance gains due to the use of the const qualifier are very
> > small and negligible in most cases.
> 
> I am somewhat confused. As I see it, the usage of a const ref for 
> passing a parameter by reference is to improve runtime performance, yes, 
> but it is not through the "const" part of it. It is through the 
> reference part of it, which avoids a copy of the parameter being 
> constructed which can be costly with large classes or structs. The const 
> part of it is only there to prevent the function from modifying the 
> source data, whether intentionally or accidentally. There may be a 
> side-effect of optimization, but at least to my understanding the intent 
> of const here is making the source read-only. Is this understanding wrong?

The const is primarily for correctness (ensuring that the callee
doesn't modify the data), but there may also be a performance gain.

-- 
Glynn Clements <glynn@gclements.plus.com>
