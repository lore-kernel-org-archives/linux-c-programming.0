From: William Lee Irwin III <wli@holomorphy.com>
Subject: Re: Garbage Collection and Swap
Date: Fri, 9 Jul 2004 19:32:45 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040710023245.GE21066@holomorphy.com>
References: <40EF3BCD.7080808@comcast.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40EF3BCD.7080808@comcast.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Richard Moser <nigelenki@comcast.net>
Cc: linux-kernel@vger.kernel.org, linux-c-programming <linux-c-programming@vger.kernel.org>

On Fri, Jul 09, 2004 at 08:43:57PM -0400, John Richard Moser wrote:
> Read that.  It's in all caps, so you should read it.  It has meaning.
> How about, everything is using Bohem GC.  Bohem wanders around in the
> heap concurrently.  So all of your applications are wandering around
> through their vm space everywhere, continuously.
> You get low on ram.  Let's say an app is using 500M of ram (Mozilla).
> What's going to happen?  Obvious.  It's going to yank shit out of swap.
> If we all linked against a GC, what kinds of swap hell do you think we'd
> encounter?

Ones almost as bad as the Hell of trolls going nuts over hypothetical
problems no one is stupid enough to cause in practice anyway.


-- wli
