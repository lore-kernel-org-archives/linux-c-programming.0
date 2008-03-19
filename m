From: Jason <lcprog@lakedaemon.net>
Subject: Re: select() / inotify / sysfs
Date: Wed, 19 Mar 2008 17:10:45 -0400
Message-ID: <47E18155.2020800@lakedaemon.net>
References: <47DFE6ED.9030908@lakedaemon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <47DFE6ED.9030908@lakedaemon.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jason wrote:
> All,
> 
> I've discovered that my physical environment causes intermittent wifi 
> connectivity (drops for a few seconds, then returns).  My program can 
> work through this, but needs to know that the connection has been 
> interrupted.
> 
> I've placed a watch on different files in /sys/class/net/ath0/* and 
> found that operstate changes (from 'up' to 'down') when I experience 
> these network drops.  So, I used inotify to detect changes to the file 
> as a proof of concept:
> 
> # inotifywatch -v -r /sys/class/net/ath0/operstate
> 
> No go.  It detects when I cat the file, but doesn't detect when the 
> kernel changes it (which make sense on an academic note, since it 
> doesn't have a value until it's read by userspace).
> 
> So, does anyone know of a good (hopefully select() based) method to 
> detect this change?  It doesn't have to use sysfs, that's just the 
> dragon I'm chasing right now.  ;-)  I'd really prefer not to poll the 
> file...

Update since vger is backup.  I tried netlink also, and it only reports 
IFF_UP changes (I've only tried RTMGRP_LINK/NETLINK_ROUTE so far).  So 
it tells me when I do ifconfig ath0 [up|down], but doesn't trigger when 
operstate changes and the interface is still up (IFF_UP).

Any ideas?

thx,

Jason.
