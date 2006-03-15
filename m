From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Significance of using + before function calls.
Date: Wed, 15 Mar 2006 13:11:45 +0100
Message-ID: <6a00c8d50603150411i770b4e51j96c8647c26632aa5@mail.gmail.com>
References: <44180FBC.50703@wipro.com>
	 <6a00c8d50603142351u2def5e49vc6c40c221da40e5e@mail.gmail.com>
	 <4417C928.6070008@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4417C928.6070008@computer.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/15/06, Per Jessen <per@computer.org> wrote:
> Steve Graegert wrote:
> >
> > The unary plus operator returns the value of an expression.  Neither
> > the unary plus nor unary minus operators produce lvalues and is of
> > limited use.
>
> So what might be the intention of someone using it like the OP
> described?  It doesn't make much sense, right?

I suppose it's there for a clean implementation of operators in C. 
While the unary minus returns the negative of the operand the unary
plus returns the value to avoid ambiguity, i.e. shall the unary plus
return the positive of a negative operand, as the unary minus does? 
IMHO, not a result I'd expect.

	\Steve
