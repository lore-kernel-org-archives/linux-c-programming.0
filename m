From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Re: segfault with strdup
Date: Wed, 21 May 2003 10:50:20 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030521095020.GF674@gre.ac.uk>
References: <20030520112034.GZ674@gre.ac.uk> <16074.22695.413401.35248@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16074.22695.413401.35248@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: Glynn Clements <glynn.clements@virgin.net>

On Tue, May 20, 2003 at 05:32:39PM +0100, Glynn Clements wrote:
> 
> There is a problem in parseTermXpm:
> 
> 144	gchar *xpmdir;
> 145	xpmdir = strdup(XPMDIR);
> 	...
> 154	termPtr[0].termxpm = strcat(xpmdir, termPtr[0].termxpm);
> 
> The buffer which is being allocated isn't guaranteed to be any larger
> than XPMDIR itself (in practice it may be slightly larger due to
> padding, but you can't rely on it), so the strcat() call is corrupting
> the heap.
> 
> Once you corrupt the heap, all bets are off; usually what happens is
> that a later call to a heap-management function (malloc, calloc, free
> etc) will segfault.
> 
> You are also doing exactly the same thing with HELPDIR.
> 
> The most obvious solution is:
> 
> 	gchar *xpmdir;
> 	xpmdir = malloc(strlen(XPMDIR) + strlen(termPtr[0].termxpm) + 1);
> 	strcpy(xpmdir, XPMDIR);
> 	...
> 	termPtr[0].termxpm = strcat(xpmdir, termPtr[0].termxpm);

This highlights my fundamental misunderstanding of memory management
in C :-( (I come from lightweight langs like perl where i dont need
to worry about this stuff)

However, this has given me a better grasp of where i am going wrong
and now i realise that i was very lucky to get the prog to work at
all in the first place as I am doing this kind of thing all over the
place.

I tried as you suggested and it cured that problem but has given
birth to more problems of the same ilk i think. Now i know where i
am going wrong though so hopefully i can fix them. (Although i
havent yet :-)

Thanks again

Martin
