From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: integrating c code and c++ code
Date: Fri, 3 Jan 2003 03:49:41 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15893.2133.819501.402598@cerise.nosuchdomain.co.uk>
References: <004601c2acf2$a442cea0$70ab88c1@ieeta.pt>
	<15883.27533.81795.913324@cerise.nosuchdomain.co.uk>
	<av1p1u$aog$1@main.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <av1p1u$aog$1@main.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Risk <jamie_risk@yahoo.ca>
Cc: linux-c-programming@vger.kernel.org


Jamie Risk wrote:

> It's also useful to surround your c code with "extern c { ... code ... }"
> when compiling c files with a cpp compiler. Doing so will avoid confusion
> when calling C routines compiled by a cpp compiler from C routines compiled
> by a C compiler (name mangling issues).

Using 'extern "C" ...' only forces C linkage; the code is still
compiled according to the rules of C++, which isn't necessarily
compatible with C. The only robust solution is not to compile C code
with a C++ compiler (or ensure that your code is 100% valid as both C
and C++, which is harder than it seems; just getting 100% valid ANSI C
is difficult enough).

> #ifdef __c_plus_plus /* Check this macro defnition, it's a close variant of
> this */

It's actually "__cplusplus".

-- 
Glynn Clements <glynn.clements@virgin.net>
