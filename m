From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: reading back characters from terminal
Date: Thu, 14 Aug 2003 00:29:12 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16186.51656.538526.570457@cerise.nosuchdomain.co.uk>
References: <Pine.A41.4.20.0308132043580.88086-100000@delfin.unideb.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.A41.4.20.0308132043580.88086-100000@delfin.unideb.hu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fekete Gabor <feketga@delfin.unideb.hu>
Cc: linux-c-programming@vger.kernel.org


Fekete Gabor wrote:

> is there a way to read back characters from the terminal (e.g. xterm).

No. There isn't even any guarantee that the characters are actually
stored anywhere. Certainly, hardcopy terminals don't store the text,
nor do graphics terminals (Tek4014 etc).

Even when the terminal (or emulator) does store the text, there isn't
any portable mechanim for reading it. For specific terminals, there
may be specific mechanims to obtain the data; e.g. for the Linux
console, you could read it from video memory, provided you had the
appropriate privileges.

-- 
Glynn Clements <glynn.clements@virgin.net>
