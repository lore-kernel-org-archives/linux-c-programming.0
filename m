From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Re:How to make a program to run as a daemon
Date: Thu, 4 Jul 2002 13:48:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15652.17427.840924.624506@cerise.nosuchdomain.co.uk>
References: <3D243B1D.650C7E3B@cogeco.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3D243B1D.650C7E3B@cogeco.ca>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Graydon Smith wrote:

> > How can I make a program writen in C to run as a daemon?
> 
> Some systems supply a daemon function for running a process in the background.
> 
> #include <unistd.h>
> int daemon (int nochdir, int noclose);

Hmm. GNU libc 2.1 provides this function (declared in unistd.h), but
doesn't document it in either a man page or the Info file.

For a portable solution, refer to chapter 13 of Stevens, or see the
archives for this list (this is the third time this question has been
asked in about a month).

-- 
Glynn Clements <glynn.clements@virgin.net>
