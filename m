From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: A Calendar app on C
Date: Wed, 02 Jun 2004 05:18:57 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1086167937.23773.24.camel@localhost>
References: <Pine.LNX.4.58.0406012354140.12322@ns.isi.ulatina.ac.cr>
	 <200406020910.41006.Christian.Beckel@gmx.de>
	 <200406020917.10404.Christian.Beckel@gmx.de>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200406020917.10404.Christian.Beckel@gmx.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

isn't there some rule about if the year is year%100=0  then is has to
also be yea%400 to be a leap year?    



On Wed, 2004-06-02 at 03:17, Christian Beckel wrote:
> oops, I forgot to test if there is a leap or not, the first line should be:
> 
> if (i == 2)
> 	days = (i % 4 != 0) ? 28 : 29;
> 
> 
> > Hi,
> >
> > there are several possibilities to compute the number of days in a month or
> > if there is a leap or not.
> >
> > if (i == 2)
> > 	days = 28;
> > else
> > 	days = 31 - ( (i != 4 || i != 6 || i != 9 || i != 11) ? 1 : 0 );
> >
> > I think there is no simpler way, because the numbers of months are
> > unregular.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

