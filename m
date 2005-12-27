From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: How to obtain process ID that created a packet
Date: Tue, 27 Dec 2005 13:55:24 +0300
Message-ID: <43B11D9C.6000601@tls.msk.ru>
References: <20051227014710.43609.qmail@web53708.mail.yahoo.com> <Pine.LNX.4.61.0512270925020.10069@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0512270925020.10069@yvahk01.tjqt.qr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Mikado <mikado4vn@yahoo.com>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

Jan Engelhardt wrote:
>>>The question is: when do you test for the PID? You would have to do it 
>>>within send(), because anywhere else, you do not know. A socket may be 
>>>shared among multiple processes (most simple way: fork()).
>>
>>I'm hooking in NF_IP_LOCAL_OUT of netfilter code using nf_register_hook() function.
> 
> 
> In sys_send(), I would have said you could use "current", but in netfilter 
> I can't tell exactly whether it is going to work on SMP.
> 
> Check net/ipv4/netfilter/ipt_owner.c, it provides a way to match packets vs 
> pids, but it's not easy to find out.

In current 2.6 kernel, net/ipv4/netfilter/ipt_owner.c:checkentry() :

        if (info->match & (IPT_OWNER_PID|IPT_OWNER_SID|IPT_OWNER_COMM)) {
                printk("ipt_owner: pid, sid and command matching "
                       "not supported anymore\n");
                return 0;
        }

So... even netfilter, breaking backward compatibility, does not support
pid match anymore...

/mjt
