From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: strtok_r crashing
Date: Fri, 15 Nov 2002 06:26:04 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15828.37756.772593.757143@cerise.nosuchdomain.co.uk>
References: <OF8E547BE6.AC22B859-ON65256C71.0045BBB6@pune.tcs.co.in>
	<20021114125013.GN1525@lug-owl.de>
	<OF1E8B2BE6.A1A44EE2-ON65256C72.001F30A5@pune.tcs.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF1E8B2BE6.A1A44EE2-ON65256C72.001F30A5@pune.tcs.co.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hemantm@pune.tcs.co.in
Cc: linux-c-programming-owner@vger.kernel.org, linux-c-programming@vger.kernel.org


Hemant Mohan wrote:

> > > I am trying to parse a string using strtok_r (I need reentrant code) as
> > > follows:
> > >
> > > #include <string.h>
> > > #include <stdio.h>
> > > #include <stdlib.h>
> > >
> > > int main()
> > > {
> > >   char *str = NULL;
> > >   char *temp = NULL;
> > >   char **ptr = NULL;   // Note that this is a char**
> >
> > Note that there's no memory allocated for *ptr.
> >
> > > This code receives a SIGSEGV in strtok_r.
> >
> > Surely. Accessing random memory.
> 
> Does that mean thaat I need to malloc the ptr before passing it to the 
> strtok_r.  If so then what sould be the size ?? should it be the size of the 
> str (strlen(str))??

No, you don't need to use malloc(). You just need to ensure that the
third argument points to valid memory, e.g.

	char *temp;
	char *ptr; /* this is NOT a char ** */
	...
	temp = strtok_r ( str, "Xx", &ptr );
	x = atoi(temp);
	temp = strtok_r ( NULL, "Xx", &ptr);
	y = atoi(temp);

-- 
Glynn Clements <glynn.clements@virgin.net>
