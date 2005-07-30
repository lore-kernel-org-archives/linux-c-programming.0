From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: errno usage.
Date: Sat, 30 Jul 2005 13:56:24 +0100
Message-ID: <17131.30968.320224.626111@cerise.gclements.plus.com>
References: <42EA448D.6080904@conectiva.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42EA448D.6080904@conectiva.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>
Cc: linux-c-programming@vger.kernel.org


Luiz Fernando Capitulino wrote:

>   I have a question about 'errno' which I'm postponing for some
> time: is it a bad pratice to set 'errno' by hand in libraries
> and even in ordinary programs?
> 
> I mean, AFAIK 'errno' was created to store error codes from system
> calls, but it's widely used by several libraries. Sometimes is even
> helpful to set 'errno' in the program itself, something like:
> 
> int get_foobar_info(char *value)
> {
> 	if (!value) {
> 		errno = EINVAL;
> 		return -1;
> 	}
> 
> ...
> 
> 	return 0;
> }
> 
> Is it a bad pratice? Is there a 'limit' for 'errno' usage?

No; there's no reason you can't use errno for your own purposes.

Many library functions will set errno; even if they don't set it
explicitly, they can call libc (etc) function which can set it.

-- 
Glynn Clements <glynn@gclements.plus.com>
