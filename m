From: Holger Freyther <freyther@gmx.net>
Subject: Re: dynamic linking
Date: Sun, 8 Sep 2002 23:06:27 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200209082306.27699.freyther@gmx.net>
References: <200209082200.26275.wrazlov@gmx.net> <200209082203.49132.wrazlov@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200209082203.49132.wrazlov@gmx.net>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Sunday 08 September 2002 22:03, Wrazlov wrote:
> *darn* i shouldn't send messages too fast...
> I wanted to know if someone could help me... :o)
>  thanks..
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Hi,
I'm new to this list and actually didn't read the faq but man dlopen is your 
friend.
After dlopening you need to dlsym the 'entry point' of your plugin


regards Holger
_____________________________________________
Holger 'zecke' Freyther
core member
Project OPIE- the Open Palmtop Integrated Environment
http://opie.handhelds.org | http://www.opie.info (german)
IRC: irc.freenode.net #opie #opie.de
