From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: Newbie question on malloc()
Date: Wed, 02 Jun 2004 13:52:32 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1086198752.29988.21.camel@localhost>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
	 <1086196092.29970.2.camel@localhost>
	 <16574.4399.288522.256729@cerise.nosuchdomain.co.uk>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16574.4399.288522.256729@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: jtwilliams@vt.edu, Wen Guangcheng <wen.guangcheng@cnt.sp.qnes.nec.co.jp>, linux-c-programming <linux-c-programming@vger.kernel.org>

What you never had win98 crash on you after running for an hour? ;) 

May statement is based on something I remember vaguely from my OS class
2 years ago, so I'm quite happy to believe I'm wrong.  I remember there
was some major issue with how win98 handled dynamic allocated memory,
but I can't exactly remember what.  

After googling a little I seems that win95 had some problems with
Garbage Collection not win98.
 

On Wed, 2004-06-02 at 13:41, Glynn Clements wrote:
> John T. Williams wrote:
> 
> > As I understand it, that is entirely up to the operation system.  Linux
> > and NT Kernel systems do reclaim unfreed memory, however I believe one
> > the major problems with Win98 was that it did not.
> > 
> > Anyone with more information feel free to correct me
> 
> I very much doubt that the above is accurate.
> 
> It may be that Win98 had some specific memory leaks, but any OS which,
> in the general case, failed to recover a process' memory upon
> termination would run out of memory very quickly.

