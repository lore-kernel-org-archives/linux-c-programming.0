From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Calling fortran from C
Date: Sat, 12 Apr 2003 11:15:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16023.59187.84926.103292@cerise.nosuchdomain.co.uk>
References: <20030412114620.B10166@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030412114620.B10166@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: linux-c-programming@vger.kernel.org


Elias Athanasopoulos wrote:

> Does anyone know if I can call fortran code from C using the GCC toolchain?

Yes.

Include g2c.h to get definitions for the fortran types, and link with
-lg2c to get the functions which fortran code requires.

You also need to write the prototypes for any fortran functions which
you wish to call from C.

-- 
Glynn Clements <glynn.clements@virgin.net>
