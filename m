From: Paolo Dovera <pdovera@bmind.it>
Subject: problem to access /proc/acpi/battery/BAT1/* files
Date: Sun, 02 Nov 2003 21:43:11 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3FA56C5F.1080600@bmind.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi all,
on my RH9 2.6.0-test6 I noticed a strange log in /var/log/messages:

Oct 17 18:15:16 localhost kernel:  dswload-0269: *** Error: Looking up 
[PBST] in namespace, AE_ALREADY_EXISTS
Oct 17 18:15:16 localhost kernel:  psparse-0589 [293932] 
ps_parse_loop         : During name lookup/catalog, AE_ALREADY_EXISTS
Oct 17 18:15:16 localhost kernel:  psparse-1121: *** Error: Method 
execution failed [\_SB_.PCI0.LPC0.BAT1._BST](Nodec12ab328), 
AE_ALREADY_EXISTS
Oct 17 18:15:25 localhost kernel:  dswload-0269: *** Error: Looking up 
[PBST] in namespace, AE_ALREADY_EXISTS
Oct 17 18:15:25 localhost kernel:  psparse-0589 [294043] 
ps_parse_loop         : During name lookup/catalog, AE_ALREADY_EXISTS
Oct 17 18:15:25 localhost kernel:  psparse-1121: *** Error: Method 
execution failed [\_SB_.PCI0.LPC0.BAT1._BST] (Node c12ab328), 
AE_ALREADY_EXISTS


the problem arises when on my system two programs access concurrently 
the files into /proc/acpi/battery/BAT1/*

for example I run the cpufrequency, a daemon to switch CPU frequency on 
my P4 laptop http://sourceforge.net/projects/cpufrequency/
(this program checks every some seconds the status of battery)
and I use
       watch -n 8 "cat /proc/acpi/battery/BAT1/*"
to see the battery state in another xterm.

Is there any kind of lock to access the status of battery?

thanks for your time,
Paolo Dovera


