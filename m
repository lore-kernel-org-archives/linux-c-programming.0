From: Wrazlov <wrazlov@gmx.net>
Subject: Re: dynamic linking
Date: Mon, 9 Sep 2002 13:06:17 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200209091306.17099.wrazlov@gmx.net>
References: <200209082200.26275.wrazlov@gmx.net> <200209082203.49132.wrazlov@gmx.net> <200209082306.27699.freyther@gmx.net>
Reply-To: wrazlov@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200209082306.27699.freyther@gmx.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

> Hi,
> I'm new to this list and actually didn't read the faq but man dlopen is
> your friend.
> After dlopening you need to dlsym the 'entry point' of your plugin

Thanks for that, but that's only one part, for I don't know how to compile 
such a lib.so?
Is it possible to import let's say a class using dlopen?

