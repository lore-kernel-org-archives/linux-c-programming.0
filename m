From: Lei Yang <leiyang@nec-labs.com>
Subject: Re: Segmentation fault from free()
Date: Tue, 24 Aug 2004 17:25:07 -0400
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <412BB233.3020400@nec-labs.com>
References: <412BA650.6050305@nec-labs.com> <20040824211236.GB25368@schiele.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <20040824211236.GB25368@schiele.dyndns.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schiele <rschiele@uni-mannheim.de>
Cc: linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org

Do you mean that something 'free' needs has been destroyed?
Why this wouldn't happen with small files?

THe memory debugger idea is definitely a good one, I'll try that.

Thanks a lot!
Lei

Robert Schiele wrote:
> On Tue, Aug 24, 2004 at 04:34:24PM -0400, Lei Yang wrote:
> 
>>Could anyone please point me out what could possibly be the reason?
> 
> 
> Cannot say something definitely with incomplete source code.
> 
> The bug is not necessarily in the malloc/free pair of this construct.  Likely
> you destroyed the heap structure in earlier memory allocation/deallocation
> operations (e.g. during list processing).  You may want to check your program
> with a memory debugger, e.g. valgrind for i386 platform.
> 
> Robert
> 
