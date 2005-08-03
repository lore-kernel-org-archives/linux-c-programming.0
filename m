From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: relationship between standard C and gcc compiler suite?
Date: Wed, 3 Aug 2005 13:22:00 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0508031319220.25465@localhost.localdomain>
References: <Pine.LNX.4.63.0508030942160.7360@localhost.localdomain>
 <6a00c8d5050803101241bcceb5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d5050803101241bcceb5@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Graegert <graegerts@gmail.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Wed, 3 Aug 2005, Steve Graegert wrote:

> In case of GCC, including <stdbool.h> cleans up #defines and allows
> C++ compilation.  It is therefore recommended to #define these
> identifiers only when _needed_ and after including <stdbool.h>.
> <stdbool.h> is provided as an extension and, for this reason, not
> placed into the include directory of the C standard library.

ok, this is where i might be having my difficulty.  in H&S (5th ed),
p. 325, i read (emphasis added):

"Certain Standard C libraries can be considered part of the language.
The provide standard definitions and parameterization that help make C
programs more portable... These core libraries consist of the header
files ... stdbool.h, ..."

my reading of this is that stdbool.h is not an extension, it's a part
of the core.  what am i mnisreading here?

rday
