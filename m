From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: undefined sqrt()
Date: Fri, 25 Oct 2002 20:29:34 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15801.39838.933933.836249@cerise.nosuchdomain.co.uk>
References: <20021024200624.GA1057@teamfinders.org>
	<Pine.SGI.4.05.10210241616510.34469-100000@angstrom.dartmouth.edu>
	<20021024205042.GA3766@teamfinders.org>
	<15800.65027.133218.947339@cerise.nosuchdomain.co.uk>
	<20021025172709.GA25272@teamfinders.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021025172709.GA25272@teamfinders.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Theo. Sean Schulze" <tschulze@teamfinders.org>
Cc: linux-c-programming@vger.kernel.org


Theo. Sean Schulze wrote:

> Thanks for the explanation. I understand now. After getting your
> explanation, I did a bit of web browsing to try to find a page that
> tells me what libraries I need for which header files, but I haven't
> been too successful. Do you know of a URL where I could find that
> info?

I'm not aware of any site which provides such a listing.

For functions which are part of the ANSI C specification, anything in
math.h is in libm, everything else should be in libc (or, in a few
cases, implemented internally by the compiler).

Non-ANSI Unix functions are normally also in libc, particularly for
systems which use GNU libc (i.e. Linux). For other Unices, "core"
functionality is in libc, while some peripheral functionality (e.g. 
networking APIs) may be in separate libraries; the exact details vary.

For anything else, the documentation for the package which provides
the functionality should state which header files contain the
declarations, and which libraries contain the implementation.

BTW, you can determine the functions which are provided by a given
library using "nm".

-- 
Glynn Clements <glynn.clements@virgin.net>
