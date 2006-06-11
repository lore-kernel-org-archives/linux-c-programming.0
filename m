From: James Colannino <james@colannino.org>
Subject: Re: Undefined reference to 'fmod'
Date: Sun, 11 Jun 2006 10:58:18 -0700
Message-ID: <448C59BA.2090706@colannino.org>
References: <448B9DA5.7050708@colannino.org> <17547.46674.360830.637227@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17547.46674.360830.637227@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Glynn Clements wrote:

> No, fmod() is in libm, so you have to add -lm to the link command.
> 
> As a general rule, anything which uses <math.h> has to link against
> libm.

Interesting.  Compiling with the argument -lm fixed my problem.  That
leads me to another question: why are the functions found in math.h in a
separate library?  I would have thought that all functions found in the
standard C library would be in glibc (The K&R book I'm reading said that
math.h is a part of the standard library.)

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"Blessed is the man, who having nothing to say, abstains from giving
wordy evidence of the fact." --George Eliot
