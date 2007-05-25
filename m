From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Function pointers to inline functions
Date: Fri, 25 May 2007 23:45:02 +0100
Message-ID: <18007.26350.946287.490717@cerise.gclements.plus.com>
References: <4613DBC2.8060708@gmail.com>
	<6a00c8d50704041133u30d98daavec529753606fc7e9@mail.gmail.com>
	<465668F6.6060206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <465668F6.6060206@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Steve Graegert <graegerts@gmail.com>, linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> > Whenever you request a pointer to an inline function the compiler will
> > place a normal subroutine version of the inline's implementation in an
> > object file and return its address.
> 
> Does this mean that the compiler will check the entire translation unit 
> where the inline function is visible for pointer-request operations on 
> the function and if any are present, the compiler will place a normal 
> version in the object file?

Yes. A pointer to a function requires that the function actually
exists somewhere in the process' address space. Inline functions don't
"exist" in that sense.

> This would mean that the function is output separately even if 
> -finline-functions is used. Is that true?

Yes.

> Do I have a way of checking whether a function is output separately or 
> not using nm? Do I just check to see whether the function name is there 
> in the output or do I have to look for some flag on the function name? I 
> am still not aware of the full depth of using nm.

If the name appears in the output from "nm", then the function exists.
If it's inlined, it won't appear in the output from "nm".

-- 
Glynn Clements <glynn@gclements.plus.com>
