From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: using the correct tool to time my program
Date: Sat, 9 Jun 2007 14:32:57 +0100
Message-ID: <18026.44041.790708.628961@cerise.gclements.plus.com>
References: <aaf549e0706082218l7232c813o27def48e8c6432e5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <aaf549e0706082218l7232c813o27def48e8c6432e5@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Farnell <mark.farnell@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Mark Farnell wrote:

> I have a parallel program, which calls some message passing functions
> which block.  Then I attempted to use times() (with struct tms) to
> time the program.
> 
> the struct tms gives me the "program time" and the "system time" as
> well as the child process time (if any).  However does it also include
> the time spent when my program is blocked (i.e. network time).

No. times() measures CPU usage; any time spent idle isn't measured. 
Ditto for getrusage().

> This is important because although I use gprof to separate the CPU
> time spent by my program vs libraries, when I calculate the total time
> spent, I really need to include the time spent waiting for message
> from network (network time).
> 
> Therefore is times() really appropriate for my purpose?  If not, what
> other functions can I use instead? (such as gettimeofday?)

If you need to measure real time (aka "wall-clock time"), use
gettimeofday() or clock_gettime().

-- 
Glynn Clements <glynn@gclements.plus.com>
