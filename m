From: "Yigit Can" <yigit.can@karel.com.tr>
Subject: getprotobyname failure
Date: Wed, 26 Feb 2003 14:59:28 +0200
Sender: linux-config-owner@vger.kernel.org
Message-ID: <001d01c2dd96$eac076f0$3002a8c0@yigitcan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-config-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kernelnewbies <kernelnewbies@nl.linux.org>, linux kernel <linux-kernel@vger.kernel.org>, linux config <linux-config@vger.kernel.org>, linux c programming <linux-c-programming@vger.kernel.org>

Hello,

I have a problem with getprotobyname() function.

I wrote a simple program that only uses getprotobyname function

I can run this program on my development machine
but when I try to run this program on my basic kernel it gives me the
"memory fault" error.

the "getprotobyname" function returns NULL and i don't know the reason,
becouse i have the /etc/protocols file containing "tcp 6 TCP" line

I'm using Denx embedded linux development kit with libc-2.2.5 with an cross
compiler

my development machine has celeron  type processor
and my target board is TQM850L (powerpc 850)

I've replaced my protocols and nsswitch.conf files with host machines (my
protocols file contians "tcp 6 TCP" line)
and that's made no difference.

Why the getprotobyname function returns NULL?

please help,


 my program :

#include <netdb.h>
#include <stdio.h>

 int main(void){

    struct sockaddr_in addr;
    struct protoent *protocol=NULL;
    protocol=getprotobyname("tcp");
    printf("\n RESULT : %02x \n",protocol->p_proto);

    return 0;
}

Yigit CAN



