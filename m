From: Eric <eric@cisu.net>
Subject: Re:  Pointers to classes
Date: Sun, 20 Jun 2004 08:30:08 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200406200830.08098.eric@cisu.net>
References: <200406192346.34166.eric@cisu.net> <1087708009.11838.13.camel@localhost> <1087708691.11832.32.camel@localhost>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1087708691.11832.32.camel@localhost>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jtwilliams@vt.edu
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Sunday 20 June 2004 12:18 am, John T. Williams wrote:
> Sorry wrong terminology. its not prototyping, but I can't remember what
> you call it when you give a partial class, i.e.
> class SomeClass;
>
> rather then full class
>
> class SomeClass {
> private:
> ...
> public:
> ...
> };
>
> ?Maybe forward declaration ?

 The abstract class worked like a charm! I think I had some weird include 
problems where they werent going in the order I needed them to and I couldn't 
trace it down. Firthermore I didnt want to redefine the class inside 
connection.h...that would just be silly. But an abstract class worked 
beautifully.

> > you might also want to add the lines
> >
> > #ifndef CONNECT_H
> > #define CONNECT_H
> >
> > to the very top of connect.h
> >
> > and
> >
> > #endif
> >
> > to the very bottom of connect.h

Thats a great tip. Ill implement that from now on.
