From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Why does linking a.so with b.so require execs to be linked both -la
 and -lb?
Date: Tue, 12 Aug 2003 14:16:39 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16184.59575.161561.642766@cerise.nosuchdomain.co.uk>
References: <m3k79jj4av.fsf@bfnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <m3k79jj4av.fsf@bfnet.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Wuertele <dave-gnus@bfnet.com>
Cc: linux-c-programming@vger.kernel.org


David Wuertele wrote:

> #  I'm creating a shared library like this:
> libDaveA.so: $(LIB_OBJECTS)
> 	$(CXX) -shared -ldl -rdynamic -o $@ $^ -lDaveB -lDaveC -lDaveD -lDaveE
> 
> #  And I have some executables that use the shared lib:
> daveprog: daveprog.cpp
> 	$(CXX) -o $@ $^ -lDaveA
> 
> The executable doesn't use any of the functions from libDaveB.so,
> libDaveC.so, libDaveD.so, or libDaveE.so.  It only uses functions from
> libDaveA.so.  But when I compile with the above makefile, gcc
> complains:
> 
>   /usr/tools/lib/gcc-lib/mipsel-linux/2.96/../../../../mipsel-linux/bin/ld: warning: libDaveB.so.0, needed by /usr/local/lib/libDaveA.so, not found (try using -rpath or -rpath-link)
> 
> Why is that?  Why should daveprog, which never uses any functionality
> AT ALL from libDaveB.so, have to link to it?

Because libDaveB is listed as a dependency of libDaveA.

Does libDaveA really require all of those other libraries? If not,
don't list them as dependencies. OTOH, if something in libDaveA
requires libDaveB, anything which requires libDaveA will also require
libDaveB.

Dependencies apply to the library as a whole, not to individual
functions. Even if the program only used functions which don't
themselves require libDaveB, the linker has no way of knowing that.

-- 
Glynn Clements <glynn.clements@virgin.net>
