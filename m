From: Alberto <apedrero@upsa.es>
Subject: dereferencing pointer to incomplete type in current->pid
Date: Fri, 22 Nov 2002 20:10:01 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DDE8109.375DA70C@upsa.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I'm triying to work with the current macro. When i compile this code i
get the message:
"dereferencing pointer to incomplete type".

Any idea?

Thanks in advance


#include <sys/types.h>
#include <linux/kernel.h>
#include </usr/src/linux-2.4.18-18.7.x/include/asm-i386/current.h>
#include <sched.h>

main (void)
{
        printf (" pid  %l\n", current->pid );
}





