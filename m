From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: debugging information
Date: Thu, 4 Jul 2002 20:49:04 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020704204904.B17532@neutrino.particles.org>
References: <20020704151533.27201.qmail@relay1.home.ro>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020704151533.27201.qmail@relay1.home.ro>; from avalea@home.ro on Thu, Jul 04, 2002 at 03:15:33PM -0000
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alina Valea <avalea@home.ro>
Cc: linux-c-programming@vger.kernel.org

On Thu, Jul 04, 2002 at 03:15:33PM -0000, Alina Valea wrote:
> When I objdump the debugging information from an object file
> I see that there is already an address assigned to each line
> of code. I wonder if those are memory addresses, and if so,
> how can they be assigned at compilation time? Aren't the
> memory addresses supposed to be assigned by the kernel at
> runtime?

Yes they are. They are fixed addresses and the kernel (or the dynamic
loader) must map the executable (or the object files) in the correct
address space in order to have a normal execution.

Speaking specifically for the ELF format, what I said is achieved using
relocation techniques, when the executable is not linked statically;
the static case is quite easy, you just map the elf to the right memory
page and then jump to its entry point (e_entry field in the elf struct).

You will probably understand the whole thing better by reading the ELF
specification:

	www.muppetlabs.com/~breadbox/software/ELF.txt

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
