From: "Vineet Joglekar" <vintya@excite.com>
Subject: Modules Spanning Multiple Files?
Date: Wed, 25 Feb 2004 21:57:56 -0500 (EST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040226025756.1B4473DD9@xprdmailfe8.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


Hi all,

I am trying to learn to write a kernel module in which functions are present in more than 1 file.

With ref. to the information available on web, the code looks like:

/***************** file 1 *******************/
/* hello2_start.c */

#if defined(CONFIG_MODVERSIONS)  && ! defined(MODVERSIONS)
   #include <linux/modversions.h> /* Will be explained later */
   #define MODVERSIONS
#endif
#include <linux/kernel.h>       /* We're doing kernel work */
#include <linux/module.h>       /* Specifically, a module */

int init_module(void)
{
  printk("Hello, world - this is the kernel speaking\n");
  return 0;
}

/***************** file 1 *******************/
/*  stop.c  */

#if defined(CONFIG_MODVERSIONS) && ! defined(MODVERSIONS)
   #include <linux/modversions.h> /* Will be explained later */
   #define MODVERSIONS
#endif        
#include <linux/kernel.h>  /* We're doing kernel work */
#include <linux/module.h>  /* Specifically, a module  */
#define __NO_VERSION__     /* It's not THE file of the kernel module */
#include <linux/version.h> /* Not included by module.h because of
	                                      __NO_VERSION__ */
	
void cleanup_module()
{
   printk("<1>Short is the life of a kernel module\n");
}

/********************* Makefile *******************/

CC=gcc
MODCFLAGS = -O2 -DMODULE -D__KERNEL__ -W -Wall -Wstrict-prototypes -Wmissing-prototypes
   	
hello.o:	hello2_start.o hello2_stop.o
	ld -m elf_i386 -r -o hello2.o hello2_start.o hello2_stop.o

start.o:	hello2_start.c
	${CC} ${MODCFLAGS} -c hello2_start.c

stop.o:	hello2_stop.c
	${CC} ${MODCFLAGS} -c hello2_stop.c

/********************* ************************/

when I do make, it doesnt give me any warnings/errors, but when I try to do
insmod -f hello2.o

it gives me error like:
"hello2.o: couldn't find the kernel version the module was compiled for"

What do I do regarding this?

Thanks and regards,

Vineet


_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
