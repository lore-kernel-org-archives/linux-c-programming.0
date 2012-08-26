From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Subject: Re: "reboot" detection ...
Date: Sun, 26 Aug 2012 20:14:51 +0200
Message-ID: <201208262014.51840.PeterHuewe@gmx.de>
References: <CAGZFCEFLx9nu4Dcm2iX5bTC+R5GcF63Kp+TW4XUvg8EcGoM5PQ@mail.gmail.com> <201208261422.58413.PeterHuewe@gmx.de> <op.wjnpn71bfzo5me@stalin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <op.wjnpn71bfzo5me@stalin>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Anatoly Sivov <mm05@mail.ru>
Cc: ratheesh kannoth <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org, linux-newbie <linux-newbie@vger.kernel.org>

Am Sonntag, 26. August 2012, 18:34:45 schrieb Anatoly Sivov:
> > static void __exit my_reboot_exit(void)
> > {
> > 
> > 	register_reboot_notifier(&my_reboot_notifier);
> > 
> > }
> 
> Surely, this one should call unregister_reboot_notifier.

Hehe, yes. This was just a test to see if you pay attention.

Peter

