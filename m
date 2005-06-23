From: James Colannino <james@colannino.org>
Subject: Re: comparing char to other known char's
Date: Thu, 23 Jun 2005 16:58:21 -0700
Message-ID: <42BB4C9D.5030309@colannino.org>
References: <42B9F2C7.2030205@colannino.org> <200506231610.55260.adix@vendio.ro> <42BB1E25.1050500@colannino.org> <200506231757.58518.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200506231757.58518.eric@cisu.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Eric Bambach wrote:

> Generally speaking (in terms of input validation), its better practice to 
> check against a LEGAL set of characters rather than an illegal set. That way 
> you can get all the characters you need, but everything else is blocked. If 
> you block illegal ones you're bound to miss a few or even ones from extended 
> charsets and input methods that you might not have thought of that could 
> wreck havoc in your program.

You're right.  I didn't think of that.  Thanks for the warning.

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

" Those who would give up essential Liberty, to purchase a little
temporary Safety, deserve neither Liberty nor Safety." --Benjamin Franklin
