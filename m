From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: debugging information
Date: Thu, 4 Jul 2002 17:37:26 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15652.31174.794271.102285@cerise.nosuchdomain.co.uk>
References: <20020704151533.27201.qmail@relay1.home.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020704151533.27201.qmail@relay1.home.ro>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alina Valea <avalea@home.ro>
Cc: linux-c-programming@vger.kernel.org


Alina Valea wrote:

> When I objdump the debugging information from an object file
> I see that there is already an address assigned to each line
> of code. I wonder if those are memory addresses, and if so,
> how can they be assigned at compilation time? Aren't the
> memory addresses supposed to be assigned by the kernel at
> runtime?

The addresses are relative to the beginning of the section. The final
address isn't known until the various files are linked into an
executable.

-- 
Glynn Clements <glynn.clements@virgin.net>
