From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: C/Fortran mixing - Passing arrays
Date: Sun, 18 May 2003 19:37:53 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030518193753.A1662@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello!

I have a fortran subroutine with the prototype:

subroutine evolvePDF (x, Q, f)
...
real*8 f(-6,6)

which I want to call from C. My problem is that C, IIRC, doesn't support 
negative indexes. Is there a workaround?

Regards,
Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
