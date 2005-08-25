From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Nanoseconds precision
Date: Thu, 25 Aug 2005 15:45:44 +0200
Message-ID: <6a00c8d505082506456afb0af8@mail.gmail.com>
References: <6a00c8d505082505406cec57eb@mail.gmail.com>
	 <OF3E405C3B.BEC69946-ON83257068.0048A143-83257068.004942CA@Cyclades.com>
	 <6a00c8d505082506372bc67a42@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505082506372bc67a42@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ronaldo.Afonso@cyclades.com" <Ronaldo.Afonso@cyclades.com>
Cc: linux-c-programming@vger.kernel.org, linux-c-programming-owner@vger.kernel.org

On 8/25/05, Steve Graegert <graegerts@gmail.com> wrote:
> On 8/25/05, Ronaldo.Afonso@cyclades.com <Ronaldo.Afonso@cyclades.com> wrote:
> >
> > All the functions in the libc do not show me nanosecond's precision. What
> > they do is get a microsecond number and multiply it by 1000. So, I realized
> > that it has to be that way because it's impossible to get a nanosecond's
> > precison on a machine with a 2Ghz clock. The system needs more than a
> > nanosecond to execute an instruction, so any nanosecond's precision, at
> > leas on a 2Ghz machine, should be inaccurate. I'm just sharing what I've
> > found.
> >
> > Anyway, I'd like to thank everyone who helped me with this question.
> 
> #include <time.h>
> int clock_gettime(clockid_t clock_id, struct timespec *tp);
> 
> timespec.nv_nsec provides nanosecond resolution.  Use CLOCK_REALTIME
> for clock_id.

BTW: Most of the existing implementations have been fixed to cope with
these new, fast machines.  There is a technique known as Time
Interpolation which is implemented on most IA64 machines an in almost
every current 1,6 GHz+ system.  So you can be quite sure that the
results are as accurate as possible.  I am aware of patches that
utilize memory mapped or CPU counter to do the time interpolations for
any platforms.  This allows an easy way to realize a nanosecond
resolution for all platforms.

 
Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
