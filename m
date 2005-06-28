From: Steve Graegert <graegerts@gmail.com>
Subject: Re: ternary operator
Date: Tue, 28 Jun 2005 20:24:45 +0200
Message-ID: <6a00c8d505062811248ef2845@mail.gmail.com>
References: <6eee1c405062810224f4db7e5@mail.gmail.com>
	 <6a00c8d50506281049335e427d@mail.gmail.com>
	 <42C185B6.4020005@conectiva.com.br>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42C185B6.4020005@conectiva.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>
Cc: linux-c-programming@vger.kernel.org

On 6/28/05, Luiz Fernando Capitulino <lcapitulino@conectiva.com.br> wrote:
> Steve Graegert wrote:
> 
> > Just take a look at our discussion about implicit return values on
> > int- and void-valued functions a week or two ago.  If no return value
> > is given explicitly it is undefined and in most cases not zero,
> > therfore not yielding false.  It's chosen randomly.
> 
> Yes, but note that this happens because the default return value
> for functions is 'int'. So, if you change func2()'s prototype to
> return 'void', the compiler will give you a warning.

Exactly what has been discussed by Glynn, me and others a couple of
days ago.  The reference to void-valued functions was made to reflect
the nature of the discussion that has taken place before; it has no
significance in this thread.

> PS: This is not the case for the arguments, in that case func2() it's
> able to accept anything (IIRC).

As stated in the answer to James Colannino's question on function prototyping.

Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
