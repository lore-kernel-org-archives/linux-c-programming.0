From: "Vineet Joglekar" <vintya@excite.com>
Subject: RE: Modules Spanning Multiple Files?
Date: Thu, 26 Feb 2004 13:22:40 -0500 (EST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040226182240.579463DEC@xprdmailfe8.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


Hi all,

the problem is solved. It had to do something with the condition checking for versioning.
the code

#if CONFIG_MODVERSIONS==1
#define MODVERSIONS
#include <linux/modversions.h>
#endif        

instead of

#if defined(CONFIG_MODVERSIONS) && ! defined(MODVERSIONS)
   #include <linux/modversions.h> /* Will be explained later */
   #define MODVERSIONS
#endif

helped.

Thanks and regards

Vineet

 --- On Wed 02/25, Vineet Joglekar < vintya@excite.com > wrote:
From: Vineet Joglekar [mailto: vintya@excite.com]
To: linux-c-programming@vger.kernel.org
Date: Wed, 25 Feb 2004 21:57:56 -0500
Subject: Modules Spanning Multiple Files?

Hi all,<br><br>I am trying to learn to write a kernel module in which functions are present in more than 1 file.<br><br>With ref. to the information available on web, the code looks like:<br><br>/***************** file 1 *******************/<br>/* hello2_start.c */<br><br>#if defined(CONFIG_MODVERSIONS)  && ! defined(MODVERSIONS)<br>   #include <linux/modversions.h> /* Will be explained later */<br>   #define MODVERSIONS<br>#endif<br>#include <linux/kernel.h>       /* We're doing kernel work */<br>#include <linux/module.h>       /* Specifically, a module */<br><br>int init_module(void)<br>{<br>  printk("Hello, world - this is the kernel speaking\n");<br>  return 0;<br>}<br><br>/***************** file 1 *******************/<br>/*  stop.c  */<br><br>#if defined(CONFIG_MODVERSIONS) && ! defined(MODVERSIONS)<br>   #include <linux/modversions.h> /* Will be explained later */<br>   #define MOD
 VERSIONS<br>#endif        <br>#include <linux/kernel.h>  /* We're doing kernel work */<br>#include <linux/module.h>  /* Specifically, a module  */<br>#define __NO_VERSION__     /* It's not THE file of the kernel module */<br>#include <linux/version.h> /* Not included by module.h because of<br>	                                      __NO_VERSION__ */<br>	<br>void cleanup_module()<br>{<br>   printk("<1>Short is the life of a kernel module\n");<br>}<br><br>/********************* Makefile *******************/<br><br>CC=gcc<br>MODCFLAGS = -O2 -DMODULE -D__KERNEL__ -W -Wall -Wstrict-prototypes -Wmissing-prototypes<br>   	<br>hello.o:	hello2_start.o hello2_stop.o<br>	ld -m elf_i386 -r -o hello2.o hello2_start.o hello2_stop.o<br><br>start.o:	hello2_start.c<br>	${CC} ${MODCFLAGS} -c hello2_start.c<br><br>stop.o:	hello2_stop.c<br>	${CC} ${MODCFLAGS} -c hello2_stop.c<br><br>/********************* 
 ************************/<br><br>when I do make, it doesnt give me any warnings/errors, but when I try to do<br>insmod -f hello2.o<br><br>it gives me error like:<br>"hello2.o: couldn't find the kernel version the module was compiled for"<br><br>What do I do regarding this?<br><br>Thanks and regards,<br><br>Vineet<br><br><br>_______________________________________________<br>Join Excite! - http://www.excite.com<br>The most personalized portal on the Web!<br>

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
