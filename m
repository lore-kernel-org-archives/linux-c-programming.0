From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: efficiency in passing a value to a function
Date: Sun, 08 Apr 2007 20:47:13 +0530
Message-ID: <46190779.3040508@gmail.com>
References: <4613DCB8.8030007@gmail.com>	 <6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>	 <17940.58896.512698.269693@cerise.gclements.plus.com> <6a00c8d50704050602j1c7a7543le5ebeb3b19994977@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50704050602j1c7a7543le5ebeb3b19994977@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert wrote:

> If a programmer has chosen to pass a reference rather than a value,
> even if no reference is actually required, intentions to improve
> run-time performance come into mind.  It is much more intuitive to
> pass primitives by value and use references only where appropriate,
> since performance gains due to the use of the const qualifier are very
> small and negligible in most cases.

I am somewhat confused. As I see it, the usage of a const ref for 
passing a parameter by reference is to improve runtime performance, yes, 
but it is not through the "const" part of it. It is through the 
reference part of it, which avoids a copy of the parameter being 
constructed which can be costly with large classes or structs. The const 
part of it is only there to prevent the function from modifying the 
source data, whether intentionally or accidentally. There may be a 
side-effect of optimization, but at least to my understanding the intent 
of const here is making the source read-only. Is this understanding wrong?

I agree of course that in case of tiny tidbits of parameters like a few 
int-s, double-s or even std::string-s, there is not much meaning in 
using const ref-s, and it is more intuitive to pass these by value. It 
is only practically useful to pass big classes / struct-s by reference.

Shriramana Sharma.

