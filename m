From: =?ISO-8859-1?Q?Fl=E1vio_de_Ayra_Mendes?= <flv@globax.com.br>
Subject: Re: retriving a dhcp assigned ip
Date: Sat, 22 Mar 2003 19:06:11 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3E7CDE53.60109@globax.com.br>
References: <20030322214216.45bc5681.cialdi@firenze.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080606010201050403060903"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030322214216.45bc5681.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: Massimiliano Cialdi <cialdi@firenze.net>
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------080606010201050403060903
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Massimiliano Cialdi wrote:

>How can I retrive the ip address assigned to my host by a dhcp server?
>I think I need to use ioctl with SIOCGIFADDR parameter, but I don't know
>where the address is saved.
>
>thanks
>
>  
>

--------------080606010201050403060903
Content-Type: text/x-csrc;
 name="discoverip.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="discoverip.c"

/* 
 * Wed Mar  3 16:21:48 EST 1999 - 
 * h4 <h4@locked.org>
 */

#include <stdio.h>
#include <errno.h>  
#include <string.h>

#include <sys/stat.h> /* socket() */
#include <sys/types.h> /* socket() */
#include <sys/ioctl.h> /* socket() */
#include <sys/socket.h> /* socket() */
#include <linux/if.h> /* ifreq */
#include <linux/in.h> /* sockaddr_in */

int main(int argc, char **argv)
{
  struct sockaddr_in *sk8;
  struct ifreq        r0x;

  int sockfd;

  if (argc != 2) {
    fprintf(stderr, "usage: %s <interface>\n", argv[0]);
    exit(1);
  }
  
  /* 
   * linux/if.h
   * #define ifr_name   ifr_ifrn.ifrn_name
   */
  strncpy(r0x.ifr_name, argv[1], sizeof(r0x.ifr_name));

  if ((sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_IP)) == -1) {
    fprintf(stderr, "socket(): %s\n", strerror(errno));
    exit(1);
  }

  if (ioctl(sockfd, SIOCGIFADDR, &r0x) != 0) {
    fprintf(stderr, "ioctl(): %s\n", strerror(errno));
    exit(1);
  }

  /*
   * linux/if.h
   * #define ifr_addr        ifr_ifru.ifru_addr
   */
  sk8 = (struct sockaddr_in *)&r0x.ifr_addr;

  fprintf(stdout, "interface : %s\n", r0x.ifr_name);
  fprintf(stdout, "address: %s\n", inet_ntoa(sk8->sin_addr.s_addr));

  return(0);
}


--------------080606010201050403060903--

