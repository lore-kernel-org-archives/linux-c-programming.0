From: "John T. Williams" <jowillia@vt.edu>
Subject: ipaddress from hostname
Date: Sun, 1 Jun 2003 17:14:58 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <007901c32882$f08148d0$ed64a8c0@descartes>
References: <EF836A380096D511AD9000B0D021B527013AD2E1@narmada.techmas.hcltech.com> <001a01c3236e$6249bc00$ed64a8c0@descartes> <000c01c32693$4d336e10$ed64a8c0@descartes> <002801c32759$5c6c9b60$a885bc3e@alanmari>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

I want to be able to get the ipv4 address of a hostname, what function can i
use?

Sincerely,
John T. Williams
jtwilliams@vt.edu

----- Original Message ----- 
From: "Andrew" <inbox@andy.co.uk>
To: "John T. Williams" <jowillia@vt.edu>
Cc: "linux-c-programming" <linux-c-programming@vger.kernel.org>
Sent: Saturday, May 31, 2003 5:05 AM
Subject: Re: Password Encryption & Philosophy


> Is it necessary to store the password? IMHO it is bad policy to store the
> password anyway because if someone gets physical access to your box they
can
> access everything without having to even look in the password file. This
> could be collegues at work, friends or family at home, quite a lot of
people
> really. I'd avoid it if possible and not add the 'feature'.
>
> If it has to go in I would encrypt it to disk, what you need to find is
> something reasonably uniqe to seed it with. Perhaps a nic mac address or
> something like that. Lets face it, if someone is really serious about it
> they can get round anything, it only took a couple of weeks for versions
of
> XP with the security functions completely by-passed to start making the
> rounds for instance.
>
>
> ----- Original Message -----
> From: "John T. Williams" <jowillia@vt.edu>
> To: "John T. Williams" <jtwilliams@vt.edu>
> Cc: "linux-c-programming" <linux-c-programming@vger.kernel.org>
> Sent: Friday, May 30, 2003 11:07 AM
> Subject: Password Encryption & Philosophy
>
>
> > I had a problem, and I was wondering if anyone had a solution.
> > I'm writing a client which gives the user the option to store their
> > password, and I want to lend some security to the password being stored.
> My
> > problem is that no matter what algorithm I use to encrypt and decrypt
the
> > password (it can't be a one way hash, bc I have to be able to send it to
> the
> > server in its original form), anyone who has access to the source code
and
> > the encrypted password can get the original password back. Does anyone
> have
> > any suggestions on how to encrypt a password with an open source
algorithm
> > and yet lend more security stored information.
> >
> > Sincerly,
> > John T. Williams
> > jtwilliams@vt.edu
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> >
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

