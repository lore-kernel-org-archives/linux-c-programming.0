From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: out of memory
Date: Wed, 8 Oct 2003 09:44:28 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A33402CE4E51@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qhwang <qhwang@ieeta.pt>
Cc: linux-c-programming@vger.kernel.org


Then you have to send us the piece of code that contains this hungry loop.


-----Original Message-----
From: qhwang [mailto:qhwang@ieeta.pt] 
Sent: quarta-feira, 8 de outubro de 2003 09:36
To: Dangui, Sandro [CMPS:RY11:EXCH]
Cc: linux-c-programming@vger.kernel.org
Subject: Re: out of memory




> Do you have recursive calls?
> If you alloc all memory you need in the beginning, then the only 
> problem that I can figure is that you have an infinite recursive 
> call... or a loop between calls. It may be causing a stack overflow.

In my program there is a loop over 10k iteratives (image). In each loop
there are some kind of statistical learning algorithm running. It is killed
after it uses about 650 MB space (code + mainly data) with my laptop after
out of memory and swap.  I believe the problem lies inside the loop but
there should be no infinite loop because when I reduce the loop to over 1k
iteratives the program runs well. In this case it uses more 100 MB space.

I wonder where is this huge data space requirement coming from, since there
is no memory allocation inside the loop?



> BTW: You have problems with your e-mail:
It's very strange.

QingHua


