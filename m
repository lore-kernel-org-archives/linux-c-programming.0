From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: getprotobyname failure
Date: Wed, 26 Feb 2003 00:58:06 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15964.4382.108450.550822@cerise.nosuchdomain.co.uk>
References: <014901c2dcab$dba77ba0$3002a8c0@yigitcan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <014901c2dcab$dba77ba0$3002a8c0@yigitcan>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yigit Can <yigit.can@karel.com.tr>
Cc: linux c programming <linux-c-programming@vger.kernel.org>


Yigit Can wrote:

> I have a problem with getprotobyname() function.
> 
> I wrote a simple program that only uses getprotobyname function
> 
> I can run this program on my development machine 
> but when I try to run this program on my basic kernel it gives me
> the "memory fault" error.
> 
> I'm using libc-2.2.5 on a powerpc 8xx development kit
> so, i'm using the same library on the host and target machine.
> 
> my development machine has celeron  type processor
> and my target board is TQM850L (has ppc_850 processor).

I presume that you have managed to get other programs to work by
cross-compiling, right?

> I've replaced my protocols and nsswitch.conf files with host machines (my
> protocols file contians "tcp 6 TCP" line)
> and that's made no difference.
> 
> what can I do?
> 
> please help,
> 
> 
>  my program :
> 
> #include <netdb.h>
> #include <stdio.h>
> 
>  int main(void){
> 
>     struct sockaddr_in addr;
>     struct protoent *protocol=NULL;
>     protocol=getprotobyname("tcp");
>     printf("\n RESULT : %02x \n",protocol->p_proto);

You should check that the pointer which getprotobyname() returns is
non-NULL before trying to dereference it.

-- 
Glynn Clements <glynn.clements@virgin.net>
