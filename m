From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: Debug flag for libraries.
Date: Wed, 2 Jul 2003 21:48:59 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030702214859.D1260@neutrino.particles.org>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A048B48B7@BANMLVEM01.e2k.ad.ge.com> <16129.27206.195388.670340@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16129.27206.195388.670340@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Tue, Jul 01, 2003 at 12:02:30PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: "Ramanan, Venkat (MED)" <Venkat.ramanan@geind.ge.com>, linux-c-programming@vger.kernel.org

On Tue, Jul 01, 2003 at 12:02:30PM +0100, Glynn Clements wrote:
> > I need to compile a program with the debug flag "-g". The program uses
> > some (static) libraries which have already been compiled without the
> > "-g" flag. So, if I need all the debugging information ( line numbers
> > etc. ) even from the libraries, do I need to recompile the libraries?
> 
> Yes.

And pick the same debugging information format (stabs or dwarf) for both, 
app and libs.

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
