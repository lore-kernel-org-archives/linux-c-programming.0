From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: any compelling reasons to use "offsetof"?
Date: Fri, 19 Aug 2005 11:16:44 +0530
Message-ID: <de3rgv$72p$1@sea.gmane.org>
References: <Pine.LNX.4.63.0508181019570.10814@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508181019570.10814@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Robert P. J. Day wrote:
>   in a legacy project i just inherited, i did a quick recursive grep
> and noticed a number of invocations of "offsetof".  from experience,
> i've concluded that the majority of these calls are because of sloppy
> programming or laziness or just plain doing something incredibly hacky
> that could be done in a more straightforward way.
> 
>   are there any really compelling reasons to need to know the offset
> of a structure field?  just curious.
> 
I don't much about that macro. Anyway I came across a couple of articles 
from which I have a vague idea of why it is used.
<http://www.cepba.upc.es/docs/sgi_doc/SGI_Developer/books/CLanguageRef/sgi_html/ch01.html>
<http://www.freshsources.com/19950054.HTM>
Mostly, if the project is of ANSI standard, then it is just there for 
standards compliance. Otherwise, the macro is used for the reasons 
mentioned here in this article 
<http://www.embedded.com/showArticle.jhtml?articleID=18312031>.


_z33
-- 
I love TUX; well... that's an understatement :)

