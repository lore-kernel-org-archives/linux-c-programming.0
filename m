From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: How to obtain process ID that created a packet
Date: Tue, 27 Dec 2005 09:26:42 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0512270925020.10069@yvahk01.tjqt.qr>
References: <20051227014710.43609.qmail@web53708.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932265AbVL0I0p@vger.kernel.org>
In-Reply-To: <20051227014710.43609.qmail@web53708.mail.yahoo.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikado <mikado4vn@yahoo.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org


>> The question is: when do you test for the PID? You would have to do it 
>> within send(), because anywhere else, you do not know. A socket may be 
>> shared among multiple processes (most simple way: fork()).
>
>I'm hooking in NF_IP_LOCAL_OUT of netfilter code using nf_register_hook() function.

In sys_send(), I would have said you could use "current", but in netfilter 
I can't tell exactly whether it is going to work on SMP.

Check net/ipv4/netfilter/ipt_owner.c, it provides a way to match packets vs 
pids, but it's not easy to find out.



Jan Engelhardt
-- 
