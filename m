From: Himalay <himalay1995@gmail.com>
Subject: error: dereferencing pointer to incomplete type and ICMP undeclared
Date: Fri, 27 Apr 2012 06:43:30 +0000 (UTC)
Message-ID: <loom.20120427T083712-887@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I am using CYGWIN gcc compiler on Windows XP Prof. OS. I am getting following 
errors. I have defined __USE_BSD in ip_icmp.h.
Anyone please help me in solving errors.

recv_v4.c: In function `recv_v4':
recv_v4.c:38: error: dereferencing pointer to incomplete type
recv_v4.c:38: error: `ICMP_TIMXCEED' undeclared (first use in this function)
recv_v4.c:38: error: (Each undeclared identifier is reported only once
recv_v4.c:38: error: for each function it appears in.)
recv_v4.c:39: error: dereferencing pointer to incomplete type
recv_v4.c:39: error: `ICMP_TIMXCEED_INTRANS' undeclared (first use in this 
function)
recv_v4.c:51: error: dereferencing pointer to incomplete type
recv_v4.c:51: error: `ICMP_UNREACH' undeclared (first use in this function)
recv_v4.c:61: error: dereferencing pointer to incomplete type
recv_v4.c:61: error: `ICMP_UNREACH_PORT' undeclared (first use in this function)
recv_v4.c:64: error: dereferencing pointer to incomplete type
recv_v4.c:69: error: dereferencing pointer to incomplete type
recv_v4.c:69: error: dereferencing pointer to incomplete type

Following is the code:

trace.h:
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/errno.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <netdb.h>
#include <netinet/in_systm.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <netinet/udp.h>
#include <unistd.h>
#include <stdio.h>


#ifdef	HAVE_SOCKADDR_DL_STRUCT
#include	<net/if_dl.h>
#endif


#define	BUFSIZE		1500

struct rec {					/* format of outgoing UDP data 
*/
  u_short	rec_seq;			/* sequence number */
  u_short	rec_ttl;			/* TTL packet left with */
  struct timeval	rec_tv;		/* time packet left */
};

			/* globals */
char	 recvbuf[BUFSIZE];
char	 sendbuf[BUFSIZE];

int		 datalen;			/* # bytes of data following 
ICMP header */
char	*host;
u_short	 sport, dport;
int		 nsent;				/* add 1 for each sendto() */
pid_t	 pid;				/* our PID */
int		 probe, nprobes;
int		 sendfd, recvfd;	/* send on UDP sock, read on raw ICMP 
sock */
int		 ttl, max_ttl;
int		 verbose;

			/* function prototypes */
const char	*icmpcode_v4(int);
const char	*icmpcode_v6(int);
int		 recv_v4(int, struct timeval *);
int		 recv_v6(int, struct timeval *);
void	 sig_alrm(int);
void	 traceloop(void);
void	 tv_sub(struct timeval *, struct timeval *);

struct proto {
  const char	*(*icmpcode)(int);
  int	 (*recv)(int, struct timeval *);
  struct sockaddr  *sasend;	/* sockaddr{} for send, from getaddrinfo */
  struct sockaddr  *sarecv;	/* sockaddr{} for receiving */
  struct sockaddr  *salast;	/* last sockaddr{} for receiving */
  struct sockaddr  *sabind;	/* sockaddr{} for binding source port */
  socklen_t   		salen;	/* length of sockaddr{}s */
  int			icmpproto;	/* IPPROTO_xxx value for ICMP */
  int	   ttllevel;		/* setsockopt() level to set TTL */
  int	   ttloptname;		/* setsockopt() name to set TTL */
} *pr;

#ifdef	IPV6

#include	<netinet/ip6.h>
#include	<netinet/icmp6.h>

#endif



recv_v4.c:
#include	"trace.h"

/*
 * Return: -3 on timeout
 *		   -2 on ICMP time exceeded in transit (caller keeps going)
 *		   -1 on ICMP port unreachable (caller is done)
 *		 >= 0 return value is some other ICMP unreachable code
 */

int recv_v4(int seq, struct timeval *tv)
{
	int				hlen1, hlen2, icmplen;
	socklen_t		len;
	ssize_t			n;
	struct ip		*ip, *hip;
	struct icmp		*icmp;
	struct udphdr	*udp;

	alarm(3);
	for ( ; ; ) {
		len = pr->salen;
		n = recvfrom(recvfd, recvbuf, sizeof(recvbuf), 0, pr->sarecv, 
&len);
		if (n < 0) {
			if (errno == EINTR)
				return(-3);		/* alarm expired */
			else
				err_sys("recvfrom error");
		}
		gettimeofday(tv, NULL);		/* get time of packet arrival */

		ip = (struct ip *) recvbuf;	/* start of IP header */
		hlen1 = ip->ip_hl << 2;		/* length of IP header */
	
		icmp = (struct icmp *) (recvbuf + hlen1); /* start of ICMP 
header */
		if ( (icmplen = n - hlen1) < 8)
			err_quit("icmplen (%d) < 8", icmplen);
	
		if (icmp->icmp_type == ICMP_TIMXCEED &&
			icmp->icmp_code == ICMP_TIMXCEED_INTRANS) {
			if (icmplen < 8 + 20 + 8)
				err_quit("icmplen (%d) < 8 + 20 + 8", icmplen);

			hip = (struct ip *) (recvbuf + hlen1 + 8);
			hlen2 = hip->ip_hl << 2;
			udp = (struct udphdr *) (recvbuf + hlen1 + 8 + hlen2);
 			if (hip->ip_p == IPPROTO_UDP &&
				udp->uh_sport == htons(sport) &&
				udp->uh_dport == htons(dport + seq))
				return(-2);		/* we hit an 
intermediate router */

		} else if (icmp->icmp_type == ICMP_UNREACH) {
			if (icmplen < 8 + 20 + 8)
				err_quit("icmplen (%d) < 8 + 20 + 8", icmplen);

			hip = (struct ip *) (recvbuf + hlen1 + 8);
			hlen2 = hip->ip_hl << 2;
			udp = (struct udphdr *) (recvbuf + hlen1 + 8 + hlen2);
 			if (hip->ip_p == IPPROTO_UDP &&
				udp->uh_sport == htons(sport) &&
				udp->uh_dport == htons(dport + seq)) {
				if (icmp->icmp_code == ICMP_UNREACH_PORT)
					return(-1);	/* have reached 
destination */
				else
					return(icmp->icmp_code);	/* 0, 
1, 2, ... */
			}
		} else if (verbose) {
			printf(" (from %s: type = %d, code = %d)\n",
					Sock_ntop_host(pr->sarecv, pr->salen),
					icmp->icmp_type, icmp->icmp_code);
		}
		/* Some other ICMP error, recvfrom() again */
	}
}







