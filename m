From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: How to obtain process ID that created a packet
Date: Tue, 27 Dec 2005 19:03:49 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0512271903180.3068@yvahk01.tjqt.qr>
References: <20051227014710.43609.qmail@web53708.mail.yahoo.com>
 <Pine.LNX.4.61.0512270925020.10069@yvahk01.tjqt.qr> <43B11D9C.6000601@tls.msk.ru>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43B11D9C.6000601@tls.msk.ru>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Mikado <mikado4vn@yahoo.com>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org


>In current 2.6 kernel, net/ipv4/netfilter/ipt_owner.c:checkentry() :
>
>        if (info->match & (IPT_OWNER_PID|IPT_OWNER_SID|IPT_OWNER_COMM)) {
>                printk("ipt_owner: pid, sid and command matching "
>                       "not supported anymore\n");
>                return 0;
>        }
>
>So... even netfilter, breaking backward compatibility, does not support
>pid match anymore...

Because they do not work on SMP. That's the reason they are disabled.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/
| jengelh's site, http://jengelh.hopto.org/
