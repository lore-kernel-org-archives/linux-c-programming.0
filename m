From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: stack trace
Date: Thu, 21 Aug 2003 06:07:31 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16196.21395.164788.849771@cerise.nosuchdomain.co.uk>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A05E5136D@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <DD9E117A8BE9F34FA4130376EC9C1F6A05E5136D@BANMLVEM01.e2k.ad.ge.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Singh, Umesh K (MED)" <Umesh.Singh@geind.ge.com>
Cc: linux-c-programming@vger.kernel.org


Singh, Umesh K (MED) wrote:

> is it possible to get the stack trace without attaching the process to
> debugger. For Ex. can i write a func let's say "print_stack_trace()"
> and call it anywhere in my program to print the stack trace at that
> point of time.
> 
> i thot it will be helpful in my big programs.
> 
> if it is possible, any direction/pointers???

Sure it's possible, but it's a fair amount of work. If your programs
is released under the GPL, the easiest solution would be to take the
relevant code from gdb. Otherwise, look at the "stabs" Info file for
the details of the format of the debug information.

However, in order to get meaningful output, you will need to compile
your program with debug info, and ideally without any optimisation
(i.e. without -O, and definitely without -fomit-frame-pointer).

-- 
Glynn Clements <glynn.clements@virgin.net>
