From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Integer arithmetic vs double precision arithmetic
Date: Mon, 27 Mar 2006 14:02:07 +0530
Message-ID: <200603271402.08010.samjnaa@gmail.com>
References: <200603262044.37068.samjnaa@gmail.com> <200603270505.42464.samjnaa@gmail.com> <17447.14781.949111.245955@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17447.14781.949111.245955@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Monday, 27 March 2006 06:32 samaye, Glynn Clements alekhiit:

> E.g. The Unix API uses either seconds since midnight UTC, Jan 1st 1970
> (time(), typically 32 bits) or seconds and microseconds since that
> time (gettimeofday(), typically 32 bits for each component), while
> Java uses milliseconds since that date (64 bits).

Oh! I did not know that Java can return system time to millisecond precision. 
Is there a C or C++ function that can do that?

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-27 W13-1 UTC+0530
