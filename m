From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: static or shared
Date: Tue, 7 Jan 2003 17:10:58 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15899.2594.867274.281756@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> If /usr/lib contains both static and shared libraries of the same name 
> eg odbc, which library compiler is going to take if I do..
> 
> gcc file.c -lodbc

Shared libraries are preferred over static libraries, unless you use
the -static flag (in which case, only static libraries are used).

> How do I explicitly I define which library to take during compilation.

You can specify an explicit filename, e.g. /usr/lib/libodbc.a
(however, you shouldn't do this for shared libraries).

IIRC, you can also use e.g.

	gcc ... -Wl,-Bstatic -lodbc -Wl,-Bdynamic ...

to link specific libraries statically.

-- 
Glynn Clements <glynn.clements@virgin.net>
