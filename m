From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: Re: Basic C encryption
Date: Tue, 8 Jul 2003 09:26:44 -0600 (CST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307080924450.28267-100000@ns.isi.ulatina.ac.cr>
References: <16138.56968.622900.806213@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16138.56968.622900.806213@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

> > Hi, I need a small, basic way to encrypt a binary file saving a custom
> > class from a windoze 32 proyect.
> >
> > For example, add +1 to each character that is about to be saved in the
> > disk. How would that be?
>
> As Jan-Benedict said, that would be dumb. Substitution ciphers
> (performing an identical mapping upon individual bytes) are trivial to
> break.
>
> I suggest getting the OpenSSL code and taking what you need from there
> (e.g. RC4, as the actual encryption is only around a half-dozen lines
> of code).
>
> Of course, as with any such approach, a determined attacker can just
> reverse-engineer your program to determine the encryption algorithm
> and its key.

C'mon guys. I just need a basic encrypt from project of a subject of my
bachelor.
It's not big deal. I am out of time also.
How can I add 1 to the ascii value of a char and write it to disc. Then,
When am I going to read it, I have to reduce to 1 the ascii value.


