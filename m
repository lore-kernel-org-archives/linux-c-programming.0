From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Nanoseconds precision
Date: Thu, 25 Aug 2005 15:37:27 +0200
Message-ID: <6a00c8d505082506372bc67a42@mail.gmail.com>
References: <6a00c8d505082505406cec57eb@mail.gmail.com>
	 <OF3E405C3B.BEC69946-ON83257068.0048A143-83257068.004942CA@Cyclades.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF3E405C3B.BEC69946-ON83257068.0048A143-83257068.004942CA@Cyclades.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ronaldo.Afonso@cyclades.com" <Ronaldo.Afonso@cyclades.com>
Cc: linux-c-programming@vger.kernel.org, linux-c-programming-owner@vger.kernel.org

On 8/25/05, Ronaldo.Afonso@cyclades.com <Ronaldo.Afonso@cyclades.com> wrote:
> 
> All the functions in the libc do not show me nanosecond's precision. What
> they do is get a microsecond number and multiply it by 1000. So, I realized
> that it has to be that way because it's impossible to get a nanosecond's
> precison on a machine with a 2Ghz clock. The system needs more than a
> nanosecond to execute an instruction, so any nanosecond's precision, at
> leas on a 2Ghz machine, should be inaccurate. I'm just sharing what I've
> found.
> 
> Anyway, I'd like to thank everyone who helped me with this question.

#include <time.h>
int clock_gettime(clockid_t clock_id, struct timespec *tp);

timespec.nv_nsec provides nanosecond resolution.  Use CLOCK_REALTIME
for clock_id.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
