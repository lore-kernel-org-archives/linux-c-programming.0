From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: getdate(3) - format date
Date: Tue, 26 Sep 2006 19:27:37 +0200
Message-ID: <200609261927.37275.hitoc_mail@yahoo.it>
References: <200609212236.46183.hitoc_mail@yahoo.it> <200609222239.43219.hitoc_mail@yahoo.it> <1159174413.3918.28.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1159174413.3918.28.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Henry Margies <henry.margies@gmx.de>
Cc: linux-c-programming@vger.kernel.org

Hello Henry,

	I have used "sh": sh script
But using ./script has the same problem: DATEMSK is not exported.

Thank you for the emails
HIToC



On Monday 25 September 2006 10:53, Henry Margies wrote:
> Hello HIToc,
>
> On Fri, 2006-09-22 at 22:40 +0200, HIToC wrote:
> > Now I have tried your script but it does not exports the DATEMSK to the
> > environment: if next the execution of the script I type
> > echo $DATEMSK it prints nothing.
>
> How did you execute the script? In order to have the variable exported,
> you have to source this shell script. Try something like this:
>
> . ./script
>
> or
>
> source ./script
>
>
>
> Best regards,
>
> Henry
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
