From: Glynn Clements <glynn.clements@virgin.net>
Subject: RE: Cannot capture SIGPIPE
Date: Wed, 4 Feb 2004 22:20:05 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16417.28693.946337.802987@cerise.nosuchdomain.co.uk>
References: <856404FAF3EDB94BB597F6316C5569B90EFED0@erlf440a.erlf.siemens.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <856404FAF3EDB94BB597F6316C5569B90EFED0@erlf440a.erlf.siemens.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: linux-c-programming@vger.kernel.org


Colovic (ext_evosoft) Aleksandar wrote:

> good comment from Glynn. But I would additionaly declare the global variable
> sigpipe as:
> 
> static volatile sig_atomic_t sigpipe;
> 
> ... to be on the safe side.
> In this example (as coded) it think it isn't necessary.

Good point. Yes, technically it should be sig_atomic_t; this type of
scenario is the essential reason for the existence of that type.

However, in practice, very few platforms would have an "int" type
which can't be written atomically. The most likely situation where the
distinction between int and sig_atomic_t would be important would be a
16-bit CPU which, for compatibility reasons, has chosen to use a
32-bit int.

In that situation, an operation which updates an int variable could be
pre-empted midway. Even then, it wouldn't matter if only the bottom
word was ever changed (as is the case here).

But it serves to illustrate the point that you have to be very careful
about what you put into a signal handler.

-- 
Glynn Clements <glynn.clements@virgin.net>
