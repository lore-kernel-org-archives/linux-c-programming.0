From: "Theo. Sean Schulze" <tschulze@teamfinders.org>
Subject: Re: undefined sqrt()
Date: Fri, 25 Oct 2002 19:27:09 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021025172709.GA25272@teamfinders.org>
References: <20021024200624.GA1057@teamfinders.org> <Pine.SGI.4.05.10210241616510.34469-100000@angstrom.dartmouth.edu> <20021024205042.GA3766@teamfinders.org> <15800.65027.133218.947339@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15800.65027.133218.947339@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Glynn,

Thanks for the explanation.  I understand now.  After getting your explanation, I did a bit of web browsing to try to find a page that tells me what libraries I need for which header files, but I haven't been too successful.  Do you know of a URL where I could find that info?

Thanks,
Sean

On Fri, Oct 25, 2002 at 09:17:07AM +0100, Glynn Clements hunted and pecked out:
> 
> Theo. Sean Schulze wrote:
> 
> > Thanks. The "-lm" did it. Why? I see from the gcc man page that the
> > "-l" is a linker option. Am I right that the linker then searches for
> > "libm.a"?
> 
> To be precise, it will normally look for libm.so (shared library)
> first (unless the -static switch was used), then look for libm.a.
> 
> > Again, why, if I am right, would it need to after I included
> > math.h? Isn't sqrt() in math.h?
> 
> The declaration is in math.h, but a declaration simply tells the
> compiler that the function exists, along with the number and types of
> its arguments and its return type.
> 
> In order to produce a working program, you have to provide the actual
> code which implements that function. In the case of sqrt(), the code
> is in libm.
> 
> For functions which are in libc, you don't have to provide any -l
> switches, as gcc (when used for linking) automatically instructs the
> compiler to link against libc.
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>

-- 
Theo. Sean Schulze
tschulze@teamfinders.org
