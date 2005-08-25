From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Nanoseconds precision
Date: Thu, 25 Aug 2005 14:40:46 +0200
Message-ID: <6a00c8d505082505406cec57eb@mail.gmail.com>
References: <OF521F2662.0BD8AB88-ON83257068.0043C29B-83257068.00448E01@Cyclades.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF521F2662.0BD8AB88-ON83257068.0043C29B-83257068.00448E01@Cyclades.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ronaldo.Afonso@cyclades.com" <Ronaldo.Afonso@cyclades.com>
Cc: linux-c-programming@vger.kernel.org

On 8/25/05, Ronaldo.Afonso@cyclades.com <Ronaldo.Afonso@cyclades.com> wrote:
> 
> Hello all,
> 
> I need to get nanosecond's precision from the time of my system. I've
> analyzing the code of the "date command" and it seems it really doesn't
> show me  nanosecond's precision, what it, in fact, does is just multiply by
> 1000 a microsecond's precison number that it gets from a system call. Does
> anybody know how I can really get a nanosecond's precision from my system?

librt contains time-related functions with nanosecond precision.  To
see what inside try this:

	$ nm /lib/librt.so.1 | grep clock_

I am sure, there is something of use for you.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
