From: packz@autistici.org
Subject: Re: Plot graph using C
Date: Fri, 23 Jan 2009 11:02:52 +0100
Message-ID: <glc4l9$2qj$1@ger.gmane.org>
References: <1f714d50901220739t1dabc3ado89ed0f3c9de5ce86@mail.gmail.com>	 <1C57F306-C631-41F5-885C-2A2AE3370621@arcor.de> <1f714d50901220920n15dcf308yec582e91488f0a7f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1f714d50901220920n15dcf308yec582e91488f0a7f@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Jai Sharma ha scritto:
> Dear Friends
> 
> After a one day search I found libploticus.
> 
> but when i compile this program. I got errors:
> 
> root@linux:/data/programming/c/chart# cc main.c -lploticus -lpng -lz
> -lm -o api_exampmain.c: In function 'main':
> main.c:16: warning: incompatible implicit declaration of built-in
> function 'exit'
> /usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
> undefined reference to `XDrawString'
> /usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
> undefined reference to `XLoadFont'
[cut]
> Plz help to solve this problem.

You are missing the -lgd linker flag...

> 
> 
> 
> Thanks and Regards
> Jai
> 

