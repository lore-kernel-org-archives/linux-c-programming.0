From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: writing logfile
Date: Wed, 26 Feb 2003 01:09:12 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15964.5048.368429.404765@cerise.nosuchdomain.co.uk>
References: <20030225105740.A31033@genestate.com>
	<20030225133810.C28473@neutrino.particles.org>
	<20030225124937.B31033@genestate.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030225124937.B31033@genestate.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mat Harris <mat.harris@genestate.com>
Cc: Elias Athanasopoulos <elathan@phys.uoa.gr>, linux-c-programming@vger.kernel.org


Mat Harris wrote:

>   loghandle = open(logfile, O_CREAT);

This should probably be:

   loghandle = open(logfile, O_WRONLY | O_CREAT | O_APPEND, 0600);

You may also wish to use the O_SYNC flag, to force data to be written
to disk immediately (so that it isn't lost if the system crashes or
the power fails).

As William pointed out, if you open the file with open(), you need to
use write() to write data to the file. Alternatively, you could use
fopen() and fputs(), but fopen() doesn't give you as much control
(e.g. you can't set the permissions or the O_SYNC flag on creation).

Also, you can create an ANSI stream (a "FILE *") from a descriptor
using fdopen(), and you can get the descriptor for an ANSI stream
using fileno(). But you need to be careful about accessing a file
using both methods (which basically means that you need to understand
how the two relate to each other).

-- 
Glynn Clements <glynn.clements@virgin.net>
