From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Calling fortran from C
Date: Wed, 16 Apr 2003 18:42:57 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16029.38433.687171.868280@cerise.nosuchdomain.co.uk>
References: <20030412114620.B10166@neutrino.particles.org>
	<16023.59187.84926.103292@cerise.nosuchdomain.co.uk>
	<20030416195300.D16619@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030416195300.D16619@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: linux-c-programming@vger.kernel.org


Elias Athanasopoulos wrote:

> > > Does anyone know if I can call fortran code from C using the GCC toolchain?
> > 
> > Yes.
> > 
> > Include g2c.h to get definitions for the fortran types, and link with
> > -lg2c to get the functions which fortran code requires.
> 
> Thank you for the reply and extremely sorry for my late response.
> 
> I have done all these, except from...
> 
> > You also need to write the prototypes for any fortran functions which
> > you wish to call from C.
> 
> ...this.
> 
> My problem is that my app crashes whenever it calls a simple fortran 
> function.
> 
> I've tested the whole stuff with:
> 
> 	PROGRAM FOO 
> 
>         END 
> 
> 	FUNCTION DUMMY (I)
> 	INTEGER I
> 	DUMMY = I               
> 	END
> 
> which I compiled: % g77 bar.f -c -o bar.o
> 					
> and with:
> 
> int main (void)
> {
> 	printf ("%d\n", dummy_ (10);
> 	return 1;
> }
> 
> which I compiled: %gcc foo.c bar.o -lg2c -L/path/to/g2c -o main
> 
> (libg2c is an archive located in: /usr/lib/gcc-lib/i386-redhat-linux/2.96)
> 
> Now, 'main' crashes in dummy_ () and gdb doesn't help, since it produces
> no further stack output. 

Fortran functions are call-by-reference, so you have to pass a pointer
to a C variable:

#include <stdio.h>
#include <g2c.h>

extern integer dummy_(integer *);

int main (void)
{
	integer x = 10;
	printf ("%ld\n", dummy_ (&x));
	return 0;
}

Aslo, you need to declare the function as returning an integer, i.e.:

	INTEGER FUNCTION DUMMY (I)
	INTEGER I
	DUMMY = I
	END

-- 
Glynn Clements <glynn.clements@virgin.net>
