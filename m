From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: gcc -S option
Date: Fri, 14 Mar 2003 20:56:04 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030314205604.T1234@neutrino.particles.org>
References: <20030314184046.85169.qmail@web8006.mail.in.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030314184046.85169.qmail@web8006.mail.in.yahoo.com>; from mshanks79@yahoo.co.in on Fri, Mar 14, 2003 at 10:40:46AM -0800
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shanks <mshanks79@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org

On Fri, Mar 14, 2003 at 10:40:46AM -0800, Shanks wrote:
> Can someone tell me if i need to pass some extra options
> while compiling using gcc to get the desired data.

I think you can't. You can use objdump with '-dS' to dump a mixture
of asm and C code, when that is possible.

Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
