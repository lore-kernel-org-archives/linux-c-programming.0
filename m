From: "Anatoly Sivov" <mm05@mail.ru>
Subject: Re: "reboot" detection ...
Date: Sun, 26 Aug 2012 20:34:45 +0400
Message-ID: <op.wjnpn71bfzo5me@stalin>
References: <CAGZFCEFLx9nu4Dcm2iX5bTC+R5GcF63Kp+TW4XUvg8EcGoM5PQ@mail.gmail.com> <201208261422.58413.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail;
	h=In-Reply-To:Message-ID:From:Content-Transfer-Encoding:MIME-Version:Date:References:Subject:Cc:To:Content-Type; bh=AZXzad+UI+UBQKn4j0t4uqRitbljok9HyettIruf8gM=;
	b=oi6x2mmibq1beQaACS4i6rZ7JKzBbpVcQ/ccqXAldAZXuEwuejeFw4t30HGxGFppF1ooF1yD/c7XbH8YGVITTSvbu8J04g4cPYWGfnam8vJnejR0q83vrqzTXZ0bV0pJ;
In-Reply-To: <201208261422.58413.PeterHuewe@gmx.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>, =?utf-8?Q?Peter_H=C3=BCwe?= <PeterHuewe@gmx.de>
Cc: linux-c-programming@vger.kernel.org, linux-newbie <linux-newbie@vger.kernel.org>

> static void __exit my_reboot_exit(void)
> {
> 	register_reboot_notifier(&my_reboot_notifier);
> }

Surely, this one should call unregister_reboot_notifier.
