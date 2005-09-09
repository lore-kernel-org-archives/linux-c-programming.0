From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: default function parameters
Date: Fri, 09 Sep 2005 12:38:13 -0700
Message-ID: <dfrc52$rro$1@sea.gmane.org>
References: <dfr8v1$kn7$1@sea.gmane.org> <6a00c8d505090823472706ba98@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505090823472706ba98@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert wrote:
> On 9/9/05, _z33 <timid.Gentoo@gmail.com> wrote:
> 
>>  I had a wierd doubt today morning. If a function's return type is not
>>defined, "C" takes it as returning "int". Now, what does it do when I
>>don't specify the arguments of the function. Something like this -
>>
>>  void sampleFunc ()
>>  {
>>       /* ... */
>>  }
>>
>>  Is this equivalent to saying,
>>
>>  void sampleFunc (void)
>>  {
>>       /* ... */
>>  }
> 
> 
> Yes, technically both are equivalent.  The latter is the new style
> while the former is the "old" style.  But be aware: A function defined
> using the old style does __not__ establish a prototype, but if a
> previously declared prototype for that function exists, the parameter
> declarations in the definition must exactly match those in the
> prototype after the default argument promotions are applied to the
> parameters in the definition.
> 
> Conclusion: avoid mixing old style and prototype style
> declarations/definition for a given function. It is allowed but not
> recommended.

   I'm clear... but, now wondering why for two days a guy from an R&D 
dept of an MNC is arguing with me, saying that a function with empty 
argument specification implies having implicit "int" type arguments. 
(similar to the implicit assumption of return type of functions to "int" 
when none is specified explicitly).

_z33
-- 
I love TUX; well... that's an understatement :)

