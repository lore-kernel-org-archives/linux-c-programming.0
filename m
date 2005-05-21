From: Adam Dyga <adeon@tlen.pl>
Subject: CPU/disk usage
Date: Sat, 21 May 2005 16:09:59 +0200
Message-ID: <428F4137.40001@tlen.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hello,

What's the best way to:
1. Get the percent cpu usage (as in top)
2. Get disk activity (eg. number of bytes read/written from/to disk 
during some period of time).

Ad1) I know I could find the cpu usage in top sources, but unfortunately 
I don't have enough time
to do it currently - maybe some of you did this already.
There is sysinfo() system call that returns average loads during the 
last 1, 5, and 15
minutes but average load, AFAIK, is a average number of tasks waiting 
for cpu, so it's not
exactly what I want.

Cheers
AD
