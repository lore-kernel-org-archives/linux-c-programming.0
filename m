From: r_zaca <r_zaca@ig.com.br>
Subject: Re: Byte Order
Date: Thu, 13 Jan 2005 08:05:57 -0200
Message-ID: <20050113_100557_072441.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1105610757"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1105610757
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

  Thanks a lot, that is what I was looking for. A simple test that I can do, 
using some C conde, to find out if the machine where the program is running 
on uses Big or Little endian "memory organization". 


On Wed, 2005-01-12 15:03:57 -0200, r_zaca <r_zaca@ig.com.br> 
wrote in message <20050112_170357_014648.r_zaca@ig.com.br>: 
Content-Description: Mail message body 
>   How can I say if the machine where I am working uses "Host Byte 
Order" or 
> "Network Byte Order"? 

Something like this should do the job: 

#include <stdint.h> 
#include <stdio.h> 
#include <stdlib.h> 

int 
main (int argc, char *argv[]) 
{ 
        uint32_t i = 0x44332211; 
        unsigned char *c; 

        c = (unsigned char *) &i; 

        if (c[0] == 0x11 && c[1] == 0x22 && c[2] == 0x33 && c[3] == 0x44) 
                printf ("This is a little-endian host\n"); 
        else if (c[0] == 0x44 && c[1] == 0x33 && c[2] == 0x22 && c[3] == 
0x11) 
                printf ("This is a big-endian host\n"); 
        else if (c[0] == 0x33 && c[1] == 0x44 && c[2] == 0x11 && c[3] == 
0x22) 
                printf ("This is a pdp-endian host\n"); 
        else { 
                printf ("This host is broken:-)\n"); 
                return EXIT_FAILURE; 
        } 

        return EXIT_SUCCESS; 
} 


>   Is it an obvius question? I mean, all hosts (machines) uses "Host 
Byte 
> Order" and when it needs to send data through the network it uses 
"Network 
> Byte Order". 

The rule is easy: Just *always* either use htonl/htons/ntohl/ntohs or 
transmit the number in readable format. The nice thing is that any sane 
libc will implement those as macros, so if your host already works in 
network byte order, the conversion will get optimized away. 

MfG, JBG 

--Message-Boundary-by-Mail-Sender-1105610757--

