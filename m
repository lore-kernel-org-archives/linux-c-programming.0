From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Basic C encryption
Date: Tue, 8 Jul 2003 16:08:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16138.56968.622900.806213@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.44.0307080811450.26970-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0307080811450.26970-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org


Fabio Miranda Hamburger wrote:

> Hi, I need a small, basic way to encrypt a binary file saving a custom
> class from a windoze 32 proyect.
> 
> For example, add +1 to each character that is about to be saved in the
> disk. How would that be?

As Jan-Benedict said, that would be dumb. Substitution ciphers
(performing an identical mapping upon individual bytes) are trivial to
break.

I suggest getting the OpenSSL code and taking what you need from there
(e.g. RC4, as the actual encryption is only around a half-dozen lines
of code).

Of course, as with any such approach, a determined attacker can just
reverse-engineer your program to determine the encryption algorithm
and its key.

-- 
Glynn Clements <glynn.clements@virgin.net>
