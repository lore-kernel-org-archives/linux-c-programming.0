From: Hemant Mohan <hemantm@pune.tcs.co.in>
Subject: Re: strtok_r crashing
Date: Fri, 15 Nov 2002 11:15:04 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF1E8B2BE6.A1A44EE2-ON65256C72.001F30A5@pune.tcs.co.in>
References: <OF8E547BE6.AC22B859-ON65256C71.0045BBB6@pune.tcs.co.in> <20021114125013.GN1525@lug-owl.de>
Reply-To: hemantm@pune.tcs.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021114125013.GN1525@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming-owner@vger.kernel.org, linux-c-programming@vger.kernel.org

Does that mean thaat I need to malloc the ptr before passing it to the 
strtok_r.  If so then what sould be the size ?? should it be the size of the 
str (strlen(str))??

On Thursday 14 November 2002 06:20 pm, 
linux-c-programming-owner@vger.kernel.org wrote:
> On Thu, 2002-11-14 18:16:04 +0530, Hemant Mohan <hemantm@pune.tcs.co.in>
>
> wrote in message <OF8E547BE6.AC22B859-ON65256C71.0045BBB6@pune.tcs.co.in>:
> > Hi,
> >
> > I am trying to parse a string using strtok_r (I need reentrant code) as
> > follows:
> >
> > #include <string.h>
> > #include <stdio.h>
> > #include <stdlib.h>
> >
> > int main()
> > {
> >   char *str = NULL;
> >   char *temp = NULL;
> >   char **ptr = NULL;   // Note that this is a char**
>
> Note that there's no memory allocated for *ptr.
>
> > This code receives a SIGSEGV in strtok_r.
>
> Surely. Accessing random memory.
