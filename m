From: John Bothe <john@beonline.com.au>
Subject: Kernel to User Space Copying
Date: Mon, 29 Mar 2004 11:03:37 +1000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1080522217.406775e91d6b1@www.beonline.com.au>
References: <S262545AbUC2AvO/20040329005114Z+282@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <S262545AbUC2AvO/20040329005114Z+282@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi,

I have a set of counters in a Kernel module that i want to export to a
userspace application. I originally decided to use a /proc entry and parse
the output whenever the userspace application needed this data, however,
i need more than the 4096 that is allowed in /proc and i'm not too keen
on parsing large chunks of text anyway.

What i would like to do is copy these slabs of text from the kernel to my
userspace application (whenever the application requests it). I've seen the
'copy_to_user' function and it looks usefull, but have no idea where to start
or how to use it :-/

Can someone provide an example or point me in the right direction?

Regards
-J
