From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: Calling fortran from C
Date: Thu, 17 Apr 2003 18:23:14 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030417182314.F16619@neutrino.particles.org>
References: <20030412114620.B10166@neutrino.particles.org> <16023.59187.84926.103292@cerise.nosuchdomain.co.uk> <20030416195300.D16619@neutrino.particles.org> <16029.38433.687171.868280@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16029.38433.687171.868280@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Wed, Apr 16, 2003 at 06:42:57PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

Hi Glynn,

On Wed, Apr 16, 2003 at 06:42:57PM +0100, Glynn Clements wrote:
> Fortran functions are call-by-reference, so you have to pass a pointer
> to a C variable:

Thank you very much! :-) It worked and you really saved me a lot of time of
research, since I know almost null about fortran.

Regards,
Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
