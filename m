From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: segfault with strdup
Date: Tue, 20 May 2003 17:32:39 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16074.22695.413401.35248@cerise.nosuchdomain.co.uk>
References: <20030520112034.GZ674@gre.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030520112034.GZ674@gre.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Buchan <M.J.Buchan@gre.ac.uk>
Cc: linux-c-programming@vger.kernel.org


Martin Buchan wrote:

> This is all working now, however, it only works if i run it in the
> directory that i have done all my coding in. I.e. If i compile and
> install to a different location, i get a seg fault when parsing the
> XML file. Its not that it cant find the file, it goes thru and
> parses the first entry in the file and then croaks on the 2nd
> while parsing the name of the app - which is "Netscape Navigator"
> If i shorten the name to just "Netscape", it then croaks on the 3rd
> entry which is "Lynx Text Only Browser", if i then shorten this to
> just "Lynx Browser", it then croaks on the 4th and so on and so on.

There is a problem in parseTermXpm:

144	gchar *xpmdir;
145	xpmdir = strdup(XPMDIR);
	...
154	termPtr[0].termxpm = strcat(xpmdir, termPtr[0].termxpm);

The buffer which is being allocated isn't guaranteed to be any larger
than XPMDIR itself (in practice it may be slightly larger due to
padding, but you can't rely on it), so the strcat() call is corrupting
the heap.

Once you corrupt the heap, all bets are off; usually what happens is
that a later call to a heap-management function (malloc, calloc, free
etc) will segfault.

You are also doing exactly the same thing with HELPDIR.

The most obvious solution is:

	gchar *xpmdir;
	xpmdir = malloc(strlen(XPMDIR) + strlen(termPtr[0].termxpm) + 1);
	strcpy(xpmdir, XPMDIR);
	...
	termPtr[0].termxpm = strcat(xpmdir, termPtr[0].termxpm);

-- 
Glynn Clements <glynn.clements@virgin.net>
