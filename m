From: jnf <xjnfx@doityourself.com>
Subject: inet kernel question cont.
Date: Thu, 12 Sep 2002 00:47:21 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020912074723.1055B396E@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

ok so i have a barbones modules that registers a callback function w/ the kernel for dealing with ip packets via dev_add_pack(), the problem is, that my function never seems to be called and after an exhaustive search of google and general tinkering around, i dont know what the problem is. below is the code, any help would be appreciated.


#define MODULE
#define __KERNEL__

#include <linux/config.h>
#include <linux/module.h>
#include <linux/version.h>
#include <linux/netdevice.h>
#include <linux/if_ether.h>
#include <linux/skbuff.h>
#include <linux/kernel.h>

char *dev;

MODULE_PARM(dev,"s");

struct net_device *d;
struct packet_type pproc;

int pprocfunc(struct sk_buff *skb, struct net_device *dv, struct packet_type *pt) {

	printk("yey\n");
	kfree_skb(skb);
	return 0;
}

int __init pproc_mod_init(void) {
		
		(char *)d = dev_get(dev);
		
		pproc.dev = d;
		pproc.func = pprocfunc;
		pproc.type = htons(ETH_P_IP);
		pproc.data = (void *)1;
		pproc.next = NULL;
		dev_add_pack(&pproc);
		printk("in\n");
		return 0;
	}			

void __exit pproc_mod_cleanup(void) {
	dev_remove_pack(&pproc);
	printk("rmvd\n");
}

module_init(pproc_mod_init);
module_exit(pproc_mod_cleanup);


_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
