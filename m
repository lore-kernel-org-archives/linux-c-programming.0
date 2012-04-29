From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: error: dereferencing pointer to incomplete type and ICMP undeclared
Date: Sun, 29 Apr 2012 13:38:10 +0530
Message-ID: <4F9CF6EA.2050405@linux.vnet.ibm.com>
References: <loom.20120427T083712-887@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <loom.20120427T083712-887@post.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Himalay <himalay1995@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 04/27/2012 12:13 PM, Himalay wrote:
> I am using CYGWIN gcc compiler on Windows XP Prof. OS. I am getting following
> errors. I have defined __USE_BSD in ip_icmp.h.
> Anyone please help me in solving errors.
>
> recv_v4.c: In function `recv_v4':
> recv_v4.c:38: error: dereferencing pointer to incomplete type
> recv_v4.c:38: error: `ICMP_TIMXCEED' undeclared (first use in this function)
> recv_v4.c:38: error: (Each undeclared identifier is reported only once
> recv_v4.c:38: error: for each function it appears in.)
> recv_v4.c:39: error: dereferencing pointer to incomplete type
> recv_v4.c:39: error: `ICMP_TIMXCEED_INTRANS' undeclared (first use in this
> function)
> recv_v4.c:51: error: dereferencing pointer to incomplete type
> recv_v4.c:51: error: `ICMP_UNREACH' undeclared (first use in this function)
> recv_v4.c:61: error: dereferencing pointer to incomplete type
> recv_v4.c:61: error: `ICMP_UNREACH_PORT' undeclared (first use in this function)
> recv_v4.c:64: error: dereferencing pointer to incomplete type
> recv_v4.c:69: error: dereferencing pointer to incomplete type
> recv_v4.c:69: error: dereferencing pointer to incomplete type
>
> Following is the code:
>
> trace.h:
> #include<sys/socket.h>
> #include<sys/types.h>
> #include<sys/errno.h>
> #include<sys/time.h>
> #include<netinet/in.h>
> #include<netdb.h>
> #include<netinet/in_systm.h>
> #include<netinet/ip.h>
> #include<netinet/ip_icmp.h>
> #include<netinet/udp.h>
> #include<unistd.h>
> #include<stdio.h>
>
I think the above undefined(s) are in a header file which is above 
ip_icmp.h (in which you have define __USE_BSD) in the order of inclusion 
in the above list of inclusions.  Try to give as an -D__USE_BSD option 
to gcc.

Regards,
Seenu.

