From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: writing logfile
Date: Tue, 25 Feb 2003 16:18:25 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030225161825.E28473@neutrino.particles.org>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org> <20030225124937.B31033@genestate.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030225124937.B31033@genestate.com>; from mat.harris@genestate.com on Tue, Feb 25, 2003 at 12:49:37PM +0000
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mat Harris <mat.harris@genestate.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, Feb 25, 2003 at 12:49:37PM +0000, Mat Harris wrote:
> void write_log(int loghandle, char string[1024])
> {
>   fputs(string, loghandle);
> }

You should compiling with -Wall. This will save you a lot and help you
find out your errors. 

Remember: a warning is a virtual error, which can break the balance 
conservation of the application for a small period of time, allowed by 
the uncertainty principle, enough to make the application segfault. :-)

Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
