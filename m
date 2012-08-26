From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Subject: Re: "reboot" detection ...
Date: Sun, 26 Aug 2012 14:22:58 +0200
Message-ID: <201208261422.58413.PeterHuewe@gmx.de>
References: <CAGZFCEFLx9nu4Dcm2iX5bTC+R5GcF63Kp+TW4XUvg8EcGoM5PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAGZFCEFLx9nu4Dcm2iX5bTC+R5GcF63Kp+TW4XUvg8EcGoM5PQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org, linux-newbie <linux-newbie@vger.kernel.org>

> Is there any way to find that the machine is rebooting.  ?
> 
> Say,  i issued  a "reboot" command in one of the Konsole shell. Is
> there any way to detect this trigger in kernel space or in userspace ?
> Any clue is really appreciated .


Hi ratheesh,

in the kernel it's pretty easy.
Simply use register_reboot_notifier from kernel/sys.c and you'll get notified 
(via a callback you register) when the system gets rebooted.

You can use this stub driver as a reference (not actually tested):
--- 
#include <linux/module.h>
#include <linux/notifier.h>
#include <linux/reboot.h>

static int my_reboot_callback(struct notifier_block *self,
				unsigned long val,
				void *data){
	if (val == SYS_RESTART)
		pr_debug("We're rebooting\n");
	return NOTIFY_DONE;
}

static struct notifier_block my_reboot_notifier = {
	.notifier_call = my_reboot_callback,
};

static int __init my_reboot_init(void)
{
	return register_reboot_notifier(&my_reboot_notifier);
}

static void __exit my_reboot_exit(void)
{
	register_reboot_notifier(&my_reboot_notifier);
}

module_init(my_reboot_init);
module_exit(my_reboot_exit);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Peter Huewe <peterhuewe@gmx.de>");

---
regards,
Peter

