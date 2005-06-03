From: Jason Sallis <jsallis@gmail.com>
Subject: Re: looking for a recommendation for C logging library
Date: Fri, 3 Jun 2005 14:20:13 -0600
Message-ID: <73a776530506031320617c40ac@mail.gmail.com>
References: <Pine.LNX.4.61.0506031306450.29227@localhost.localdomain>
Reply-To: Jason Sallis <jsallis@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0506031306450.29227@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

I've never personally tried it, but log4c
(http://log4c.sourceforge.net/) might be worth checking out.  I've
worked with both log4j and log4net extensively and since this project
is based on log4j, I would assume that it would meet your needs.

j-sa

On 6/3/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> 
>  in some code i inherited, i'm tempted to replace the current,
> cumbersome, in-house collection of logging code with a public package
> of some kind.  any recommendations for a decent C logging library?
> it should support selectable output files, multiple warning levels,
> all the usual stuff.
> 
>  thoughts?
> 
> rday
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
