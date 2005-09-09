From: Steve Graegert <graegerts@gmail.com>
Subject: Re: default function parameters
Date: Fri, 9 Sep 2005 08:47:07 +0200
Message-ID: <6a00c8d505090823472706ba98@mail.gmail.com>
References: <dfr8v1$kn7$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfr8v1$kn7$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 9/9/05, _z33 <timid.Gentoo@gmail.com> wrote:
>   I had a wierd doubt today morning. If a function's return type is not
> defined, "C" takes it as returning "int". Now, what does it do when I
> don't specify the arguments of the function. Something like this -
> 
>   void sampleFunc ()
>   {
>        /* ... */
>   }
> 
>   Is this equivalent to saying,
> 
>   void sampleFunc (void)
>   {
>        /* ... */
>   }

Yes, technically both are equivalent.  The latter is the new style
while the former is the "old" style.  But be aware: A function defined
using the old style does __not__ establish a prototype, but if a
previously declared prototype for that function exists, the parameter
declarations in the definition must exactly match those in the
prototype after the default argument promotions are applied to the
parameters in the definition.

Conclusion: avoid mixing old style and prototype style
declarations/definition for a given function. It is allowed but not
recommended.


Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
