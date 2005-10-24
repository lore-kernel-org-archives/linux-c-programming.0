From: fabio <fabio@crearium.com>
Subject: MIsc C programming questions
Date: Mon, 24 Oct 2005 03:02:43 -0600
Message-ID: <435CA333.3010904@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

I have some questions about C programming not exactly on Linux but
Solaris, I hope you can help me:

- Why I cant include this __asm___ lines on a C program and compile it
on Sun cc on Solaris 10?

-bash-3.00$ cat ret.c; cc ret.c
/*

*/

#include <stdio.h>
#include <stdlib.h>
#include <sys/systeminfo.h>


/*
*
*/
int
main() {
    int ret;
    ret = get_sp();
    printf("Stack Pointer is: 0x%x\n",ret);
    char platform[257],release[257];
    sysinfo(SI_PLATFORM, platform, sizeof(platform) - 1);
    sysinfo(SI_RELEASE, release, sizeof(release) - 1);
    printf("Platform: %s (%s)\n", platform, release);
    return (EXIT_SUCCESS);
}

int
get_sp(){
    __asm__("mov %sp,%g1");
    __asm__("mov %g1,%o1");
}
"ret.c", line 16: warning: implicit function declaration: get_sp
"ret.c", line 27: warning: implicit function declaration: __asm__
Undefined                       first referenced
symbol                             in file
__asm__                             ret.o
ld: fatal: Symbol referencing errors. No output written to a.out
-bash-3.00$

Any workaround?

Thanks

