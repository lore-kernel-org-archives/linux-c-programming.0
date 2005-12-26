From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: How to obtain process ID that created a packet
Date: Mon, 26 Dec 2005 23:36:46 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0512262334210.12671@yvahk01.tjqt.qr>
References: <20051226162218.78162.qmail@web53704.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20051226162218.78162.qmail@web53704.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikado <mikado4vn@yahoo.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

>Hi,
>
>Is there any way to catch REAL pid that generated a packet from 'struct sk_buff', 'struct sock',
>'struct socket',
>'struct file' or etc... ? direct/indirect ways are accepted.

The question is: when do you test for the PID? You would have to do it 
within send(), because anywhere else, you do not know. A socket may be 
shared among multiple processes (most simple way: fork()).



Jan Engelhardt
-- 
