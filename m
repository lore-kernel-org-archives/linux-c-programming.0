From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: writing logfile
Date: Wed, 26 Feb 2003 19:45:07 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15965.6467.762493.359428@cerise.nosuchdomain.co.uk>
References: <20030225105740.A31033@genestate.com>
	<20030225133810.C28473@neutrino.particles.org>
	<20030225124937.B31033@genestate.com>
	<15964.5048.368429.404765@cerise.nosuchdomain.co.uk>
	<20030226092502.A12697@genestate.com>
	<20030226100914.GO7826@lug-owl.de>
	<20030226101811.A13475@genestate.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030226101811.A13475@genestate.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mat Harris <mat.harris@genestate.com>
Cc: linux-c-programming@vger.kernel.org


Mat Harris wrote:

> ok and now i am getting something weird. when I try to log a successful
> request, and then make the request again, it ands to the previous printf
> message and prints it again so it repeats all the previous messages again
> and again. Also, the garbage in the logfile is the beginning of my webroot
> "/home....". I do not know what is going on here.

Line 52 of webserver.c:

>	  strcat(logmsg, filename);

should be

	  strcpy(logmsg, filename);

Also:

> #include "log.h" /* logging functions */

Don't use #include for actual code. Put it in a separate .c file and
compile it separately.

> void write_log(int loghandle, char *string)
> {
>   write(loghandle, string, sizeof(string));
> }

   write(loghandle, string, strlen(string));

Applying sizeof() to a "char *" will return the size of the pointer
(typically 4 on a 32-bit system, 8 on a 64-bit system), not the length
of the string to which it points.

-- 
Glynn Clements <glynn.clements@virgin.net>
