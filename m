From: "James Stevenson" <james@stev.org>
Subject: RE: Undefined reference to 'fmod'
Date: Wed, 14 Jun 2006 16:41:07 +0100
Message-ID: <010d01c68fc8$f56e1020$0500ac0a@slider>
References: <448C59BA.2090706@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <448C59BA.2090706@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'James Colannino' <james@colannino.org>, 'Linux C Programming List' <linux-c-programming@vger.kernel.org>

Hi,

It cant be not all processors have floating point unit's Therefor it cannot
be in the main standard libary

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-
> programming-owner@vger.kernel.org] On Behalf Of James Colannino
> Sent: 11 June 2006 18:58
> To: Linux C Programming List
> Subject: Re: Undefined reference to 'fmod'
> 
> Glynn Clements wrote:
> 
> > No, fmod() is in libm, so you have to add -lm to the link command.
> >
> > As a general rule, anything which uses <math.h> has to link against
> > libm.
> 
> Interesting.  Compiling with the argument -lm fixed my problem.  That
> leads me to another question: why are the functions found in math.h in a
> separate library?  I would have thought that all functions found in the
> standard C library would be in glibc (The K&R book I'm reading said that
> math.h is a part of the standard library.)
> 
> James
> --
> My blog: http://www.crazydrclaw.com/
> My homepage: http://james.colannino.org/
> 
> "Blessed is the man, who having nothing to say, abstains from giving
> wordy evidence of the fact." --George Eliot
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


