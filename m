From: p.boehm@d-trust.net
Subject: Antwort: Re: building shared libaries
Date: Mon, 25 Oct 2004 10:30:37 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF13D54B06.74864BF5-ONC1256F38.002E97E4@bln.d-trust.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eshwar <eshwar@moschip.com>
Cc: linux-c-programming@vger.kernel.org



I've found a wunderfull abstract from Luis Colorado that answers most questions about Libraries:

http://www.linuxfocus.org/English/November1997/article6.html




                                                                                                     
                    "eshwar"                                                                         
                    <eshwar@mosch        An:     <p.boehm@d-trust.net>                               
                    ip.com>              Kopie:                                                      
                                         Thema:  Re: building shared libaries                        
                    24.10.2004                                                                       
                    21:21                                                                            
                                                                                                     
                                                                                                     




you can use -shared option of gcc

Eshwar
----- Original Message -----
From: <p.boehm@d-trust.net>
To: <linux-c-programming@vger.kernel.org>
Sent: Monday, October 25, 2004 12:47 PM
Subject: building shared libaries


> Hi,
> I need to know how to build up shared libaries. e.g. how do I export
libary-functions, what
> (gcc-)compiler-
> options are necessary to create .so-files, what other stuff (e.g. libtool)
I need?
> To understand it would reach an explanation with a short pseudo-example.
> thanks in advance
> pb
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html





