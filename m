From: "Paul Gimpelj" <pgimpelj@sympatico.ca>
Subject: Re: compression heuristic algorithm, and more interesting trivia
Date: Fri, 25 Jun 2004 18:33:22 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001301c45b04$6d2a9300$c901010a@zoom>
References: <004001c45af4$9b7da7c0$c901010a@zoom> <cbi5v9$36n$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charlie Gordon <gmane@chqrlie.org>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

thats still 200mb , which is (1 -200/700)  > 1%,
nice but not compact enough.

thanks
----- Original Message -----
From: "Charlie Gordon" <gmane@chqrlie.org>
To: <linux-c-programming@vger.kernel.org>
Sent: Friday, June 25, 2004 5:39 PM
Subject: Re: compression heuristic algorithm, and more interesting trivia


> A more lucrative variation on the same algorithm :
> Find a heuristic and starting matrix whereby each draw of a casino
roulette
> can be accurately predicted (to better than 1 percent)
> Or a patriotic variation : find practical algorithm to predict the votes
of
> pseudo random population of 50 states, do away with election costs and
> uncertainty.
>
> Surely you're joking !
>
> No, in fact I already have an implementation : matrix is just 10000 by
10000
> 64 bit integers for a single 700 MB file !
> just doubling matrix sizes allows for 4 fold increase on file size ability
!
> 3D version of said double matrix compresses google database down to 1 byte
!
> Maybe I should patent it a make lots of dollars...
>
> Chqrlie.
>
>
>
> "Paul Gimpelj" <pgimpelj@sympatico.ca> wrote in message
> news:004001c45af4$9b7da7c0$c901010a@zoom...
> > hi,
> >
> > I am looking for an algorithm.
> >
> > Can anyone help.
> >
> > Hypothesis:  There is a shift register system that will produce a
> repeatable
> > and predictable sequence of values. This sequence can be totally defined
> > with a starting value and the input parameters to the shift register
> system.
> >
> > In other words 700mb of file can be compacted to one byte and a matrix
of
> > parameters to input into the shift register system.
> > And the file will be compacted by 99.9% or greater. So 10 cds can be
> > distributed in 1.44 floppy format.
> >
> > The pratical aspect is to have an heuristic to determine the matrix of
> > parameters, Time to compute is relatively unimportant since the file is
to
> > be archived.
> >
> > Thanks,
> >
> > regards,
> > Paul ( operations research graduate)
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

