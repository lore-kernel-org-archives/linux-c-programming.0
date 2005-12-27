From: Mikado <mikado4vn@yahoo.com>
Subject: Re: How to obtain process ID that created a packet
Date: Mon, 26 Dec 2005 17:47:10 -0800 (PST)
Message-ID: <20051227014710.43609.qmail@web53708.mail.yahoo.com>
References: <Pine.LNX.4.61.0512262334210.12671@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0512262334210.12671@yvahk01.tjqt.qr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

> >Hi,
> >
> >Is there any way to catch REAL pid that generated a packet from 'struct sk_buff', 'struct
sock', 'struct socket', 'struct file' or etc... ? direct/indirect ways are accepted.
> 
> The question is: when do you test for the PID? You would have to do it 
> within send(), because anywhere else, you do not know. A socket may be 
> shared among multiple processes (most simple way: fork()).

I'm hooking in NF_IP_LOCAL_OUT of netfilter code using nf_register_hook() function.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
