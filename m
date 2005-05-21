From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: CPU/disk usage
Date: Sat, 21 May 2005 21:27:43 +0100
Message-ID: <17039.39359.737772.996298@gargle.gargle.HOWL>
References: <428F4137.40001@tlen.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <428F4137.40001@tlen.pl>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Dyga <adeon@tlen.pl>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Adam Dyga wrote:

> What's the best way to:
> 1. Get the percent cpu usage (as in top)

The way that ps does it is to obtain the process start time and amount
of user and system time used from /proc/<pid>/stat, and the number of
seconds since boot from /proc/uptime, then compute the CPU usage as
the ratio of the total time used (user + system) to the time the
process has been running (system uptime - process start time).

Note that this gives the average CPU usage over the lifetime of the
process. If you want a current figure, measure the change in the total
usage over a given interval and divide by the interval.

-- 
Glynn Clements <glynn@gclements.plus.com>
