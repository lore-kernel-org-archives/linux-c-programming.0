From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: mmap() to a specific address
Date: Tue, 2 Jul 2002 21:42:03 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020702214203.C2129@neutrino.particles.org>
References: <20020701220351.A2129@neutrino.particles.org> <15648.44039.491676.479663@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15648.44039.491676.479663@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Mon, Jul 01, 2002 at 08:22:47PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org, Mehran Rezaei <mehran@cs.unt.edu>

Hi Glynn, Mehran,

On Mon, Jul 01, 2002 at 08:22:47PM +0100, Glynn Clements wrote:
> If you specify MAP_FIXED, either the segment will be mapped at the
> specified address, or mmap() will fail.

Thanks for your replies. Actually I have tried MAP_FIXED but it doesn't
help since I want to map a file in a memory area which most probably is
occupied from the running executable. So, it's 100% a redesign issue on
my side. :-)

Just for the record: what I try to do is to run a static elf from user-
land, without using execve() and friends.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
