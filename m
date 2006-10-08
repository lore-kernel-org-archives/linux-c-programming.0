From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: pointer indirection on the LHS of an assignment
Date: Sun, 8 Oct 2006 13:17:39 +0100
Message-ID: <17704.60515.225828.672044@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0610070909590.6332@localhost.localdomain>
	<17704.12250.231544.173434@cerise.gclements.plus.com>
	<Pine.LNX.4.64.0610080252420.12188@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0610080252420.12188@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

> > The problem with the first example is that the
> > __SEMAPHORE_INITIALIZER macro uses C99 features, which probably
> > aren't supported in gcc 2.7.x.
> >
> > The LHS has nothing to do with it.
> 
> ah, sorry, i didn't look closely enough.  so if one could count on a
> C99-compilant compiler being available, then the first form would be
> perfectly acceptable?  thanks.

Yes.

-- 
Glynn Clements <glynn@gclements.plus.com>
