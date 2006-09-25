From: Henry Margies <henry.margies@gmx.de>
Subject: Re: getdate(3) - format date
Date: Mon, 25 Sep 2006 10:53:33 +0200
Message-ID: <1159174413.3918.28.camel@localhost.localdomain>
References: <200609212236.46183.hitoc_mail@yahoo.it>
	 <6a00c8d50609220028n76b35f37v9603746100804c44@mail.gmail.com>
	 <200609222239.43219.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200609222239.43219.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello HIToc,

On Fri, 2006-09-22 at 22:40 +0200, HIToC wrote:
> Now I have tried your script but it does not exports the DATEMSK to the
> environment: if next the execution of the script I type
> echo $DATEMSK it prints nothing.

How did you execute the script? In order to have the variable exported,
you have to source this shell script. Try something like this:

. ./script

or

source ./script



Best regards,

Henry


