From: "Yigit Can" <yigit.can@karel.com.tr>
Subject: getprotobyname failure
Date: Tue, 25 Feb 2003 10:34:10 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00ed01c2dca8$ab5e84f0$3002a8c0@yigitcan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux c programming <linux-c-programming@vger.kernel.org>, linux config <linux-config@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>





Hello,

I have a problem with getprotobyname() function.

I wrote a simple program that only uses getprotobyname function

I can run this program on my development machine=20
but when I try to run this program on my basic kernel it gives me the =
"memory fault" error.

I'm using libc-2.2.5 on a powerpc 8xx development kit
so, i'm using the same library on the host and target machine.

my development machine has celeron  type processor
and my target board is TQM850L (has ppc_850 processor).

I've replaced my protocols and nsswitch.conf files with host machines (my
protocols file contians "tcp 6 TCP" line)
and that's made no difference.

what can I do?
 
please help,
 

 my program :
 
 #include <netdb.h>
#include <stdio.h>
 
 int main(void){
 
    struct sockaddr_in addr;
    struct protoent *protocol=3DNULL;
    protocol=3Dgetprotobyname("tcp");
    printf("\n RESULT : %02x \n",protocol->p_proto);
 
    return 0;
}

Yigit CAN
Karel Electronics Corp.
yigit.can@karel.com.tr
 

