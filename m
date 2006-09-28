From: Henry Margies <henry.margies@gmx.de>
Subject: Re: getdate(3) - format date
Date: Thu, 28 Sep 2006 09:38:43 +0200
Message-ID: <1159429123.3898.4.camel@localhost.localdomain>
References: <200609212236.46183.hitoc_mail@yahoo.it>
	 <200609222239.43219.hitoc_mail@yahoo.it>
	 <1159174413.3918.28.camel@localhost.localdomain>
	 <200609261927.37275.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200609261927.37275.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Tue, 2006-09-26 at 19:27 +0200, HIToC wrote:
> Hello Henry,
> 
> 	I have used "sh": sh script
> But using ./script has the same problem: DATEMSK is not exported.
> 
> Thank you for the emails
> HIToC
> 

If you execute a script via sh script.sh or ./script.sh it is executed
in a sub shell. So every exported variable is only set in all sub-sub
shells.

Try this script to see what I mean

#!/bin/sh

export V=Test
echo $V



Now execute it in a sub shell:

sh script.sh
echo $V

and execute it in the current shell (via sourcing it)

. ./script.sh
echo $V

or

source script.sh
echo $V



Best regards,

Henry

