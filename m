From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: should I use, getcwd() or *environ ?
Date: Sat, 5 Mar 2005 11:48:14 +0100
Message-ID: <d9def9db050305024849ce26cd@mail.gmail.com>
References: <Pine.LNX.4.21.0503042218420.2519-100000@hestia>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0503042218420.2519-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hey,

I'd recommend getcwd()

environment variables can be manipulated by the user..

$ echo $PWD
/home/mare
$ PWD=/foo
$ pwd
/home/mare
$ echo $PWD
/foo
 
Markus


On Fri, 4 Mar 2005 22:23:17 +0100 (CET), J. <mailing-lists@xs4all.nl> wrote:
> Friday, March 04 22:18:42
> 
> Hello,
> 
> I have to remember the working directory and save it in my program so that
> I can return to it later..
> 
> Which one is better/safer and why ? The environment var's or the
> getcwd() function fam... ?
> 
> Thankx.. a lot..
> 
> J.
> 
> --
> http://www.rdrs.net/
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
