From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: C/Fortran mixing - Passing arrays
Date: Sun, 18 May 2003 20:29:18 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16071.57102.120653.190096@cerise.nosuchdomain.co.uk>
References: <20030518193753.A1662@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030518193753.A1662@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: linux-c-programming@vger.kernel.org


Elias Athanasopoulos wrote:

> I have a fortran subroutine with the prototype:
> 
> subroutine evolvePDF (x, Q, f)
> ...
> real*8 f(-6,6)
> 
> which I want to call from C. My problem is that C, IIRC, doesn't support 
> negative indexes.

C supports negative indices in the sense that the following works:

	int f[8] = {1,2,3,4,5,6,7,8};
	int *p = f + 4;
	int i;
	
	for (i = -4; i < 4; i++)
		printf("%d\n", p[i]);

-- 
Glynn Clements <glynn.clements@virgin.net>
