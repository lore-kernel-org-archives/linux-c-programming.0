From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Returned mail: delivery problems encountered
Date: Thu, 28 Oct 2004 06:42:02 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16768.34474.595530.427895@cerise.gclements.plus.com>
References: <2004102722581901500p7n00e@A@000000000000@comcast.net>
	<1098934436.6437.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1098934436.6437.7.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Parrilla <eparrilla@comcast.net>
Cc: linux prg <linux-c-programming@vger.kernel.org>


Edward Parrilla wrote:

> > I have the following:

> > FD_SET(msock, &afds);
> > nfds=getdtablesize();
> > msock=passiveTCP(service, 5); <--listening socket

You should initialise msock *before* you use it.

-- 
Glynn Clements <glynn@gclements.plus.com>
