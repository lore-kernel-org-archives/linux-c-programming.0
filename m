From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: daemonization
Date: Fri, 28 Jun 2002 23:13:05 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15644.57201.545725.876043@cerise.nosuchdomain.co.uk>
References: <20020628154913.A377@nietzsche>
	<20020628210348.GT17216@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020628210348.GT17216@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xlp <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org


xlp wrote:

> Hi, I want to understand How can a executale object in Unix can
> become a "daemon" ? How can it deal with stdout, and ttys it's
> connected to? What are the C library function I should read man?.

Daemonisation isn't covered in any particular manual page. However, it
gets its own chapter in Stevens[1].

[1]	Advanced Programming in the UNIX(R) Environment
	W Richard Stevens
	Addison-Wesley

This book is highly recommended, but not cheap (I paid UKP42,
~= EUR60).

However, it doesn't cover sockets; there is another book on network
programming by the same author but, IIRC, it covers both sockets and
TLI, and you're unlikely to need to use TLI.

Jan-Benedict Glaw wrote:

> - chdir() to "/"
> 
> Most important are these:
> 
> - become session leader: setsid()
> - fork() and let parent exit(0)

The fork() comes first; everything else should be done in the child.

> - close() stdin, stdout and stderr and re-open() them with /dev/null

And try to close() all other descriptors.

-- 
Glynn Clements <glynn.clements@virgin.net>
