From: Jan Opacki <opacki@acn.waw.pl>
Subject: Re: LKM programming - problem with chars from user space (?)
Date: Sun, 15 Aug 2004 23:03:15 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1092603795.234.10.camel@200-ego-4.acn.waw.pl>
References: <200408082306.15656.opacki@acn.waw.pl>
	 <5845af7d040808233536cd5cf4@mail.gmail.com>
Reply-To: opacki@acn.waw.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <5845af7d040808233536cd5cf4@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Mon, 2004-08-09 at 08:35, Thiago Rondon wrote:
Ok, but im not talking only about printing it into log file, but also
with compareing chars.For example, when i have string like:
"somestring"
and i want to print it by one string (with %s") then i've got in log
file:
somestring
when i want to print it char by char (with %c):
<1>s<1>o<1>m<1>e (...and it goes)
But how i say it's not only problem with printing couse when i want to
compare for ex. third char from this string with static allocated char
then it's false also if chars are same! (this <1> is "connected" in some
way with char?)
So how to play with this char ? i want to compare'em.
Regards.
> Yeah, because you put KERN_ALERT as the first argument in the 
> printk() function..
> 
> See this file, ~linux/include/linux/kernel.h
> 
> -Thiago Rondon
> 
> On Sun, 8 Aug 2004 23:06:15 +0200, authn <opacki@acn.waw.pl> wrote:
> > Hello,
> > I am coding a linux kernel module and have problem with some string from user
> > space (from execve system call). There is no problem with useing this string
> > as a one, for example printk(KERN_ALERT "%s", string) works fine.
> > Problem appears when i want to printk or compare single char, in first case it
> > is printked with some extra '<1>' and in second case, when i compare it with
> > other one, it doesnt fit to real char (it is "connected" with '<1>' in some
> > way ?). I tried to copy it to kmalloced buffer:
> > 
> > if ((k_space=(char *)kmalloc(len, GFP_KERNEL))==NULL)
> >                         return -1;
> > memcpy_fromfs((void *)k_space, (void *)argv[argc], len);
> > 
> > but then playing with k_space[i] was the same. Can anybody help me with this ?
> > 
> > Regards,
> > apacz
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

