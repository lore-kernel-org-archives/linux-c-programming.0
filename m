From: Jason <lcprog@lakedaemon.net>
Subject: select() / inotify / sysfs
Date: Tue, 18 Mar 2008 11:59:41 -0400
Message-ID: <47DFE6ED.9030908@lakedaemon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

All,

I've discovered that my physical environment causes intermittent wifi 
connectivity (drops for a few seconds, then returns).  My program can 
work through this, but needs to know that the connection has been 
interrupted.

I've placed a watch on different files in /sys/class/net/ath0/* and 
found that operstate changes (from 'up' to 'down') when I experience 
these network drops.  So, I used inotify to detect changes to the file 
as a proof of concept:

# inotifywatch -v -r /sys/class/net/ath0/operstate

No go.  It detects when I cat the file, but doesn't detect when the 
kernel changes it (which make sense on an academic note, since it 
doesn't have a value until it's read by userspace).

So, does anyone know of a good (hopefully select() based) method to 
detect this change?  It doesn't have to use sysfs, that's just the 
dragon I'm chasing right now.  ;-)  I'd really prefer not to poll the 
file...

tia,

Jason.
